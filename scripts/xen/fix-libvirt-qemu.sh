#!/usr/bin/env bash
set -euo pipefail

# Provision the Xen host to accept remote domain creation via libvirt/virsh.
# Intended to be run LOCALLY on the Xen host (for example by Vagrant provisioning).
# Run as root: sudo ./provision_xen_host.sh

if [ "$(id -u)" -ne 0 ]; then
  echo "Run as root (sudo)."
  exit 1
fi

echo "[1/4] Creating /usr/lib/xen/boot and copying QEMU/SeaBIOS ROMs"
mkdir -p /usr/lib/xen/boot

candidates=(
  /usr/share/qemu/vgabios-*.bin
  /usr/share/seabios/vgabios-*.bin
  /usr/share/qemu/efi-*.rom
  /usr/share/qemu/*.rom
)

copied=false
for pat in "${candidates[@]}"; do
  for src in $pat; do
    if [ -f "$src" ]; then
      dst="/usr/lib/xen/boot/$(basename "$src")"
      if [ -e "$dst" ] && [ "$(readlink -f "$dst")" = "$(readlink -f "$src")" ]; then
        # if it's already an identical copy, skip
        echo "skipping existing: $dst"
      else
        echo "copying: $src -> $dst"
        cp -af "$src" "$dst"
        copied=true
      fi
    fi
  done
done

if [ "$copied" = false ]; then
  echo "No ROMs found in known locations; check qemu/seabios packages." >&2
fi

chmod 644 /usr/lib/xen/boot/* || true
chown root:root /usr/lib/xen/boot/* || true

echo "[2/4] Installing wrapper at /usr/libexec/xen-qemu-system-i386 (idempotent)"
ORIG1=/usr/libexec/xen-qemu-system-i386.orig
WRAPPER1=/usr/libexec/xen-qemu-system-i386
mkdir -p "$(dirname "$WRAPPER1")"

if [ ! -f "$ORIG1" ] && [ -f "$WRAPPER1" ]; then
  cp -a "$WRAPPER1" "$ORIG1"
  echo "backup created: $ORIG1"
fi

cat > /usr/libexec/xen-qemu-system-i386 <<'W1'
#!/usr/bin/env bash
REAL="/usr/libexec/xen-qemu-system-i386.orig"
args=()
has_L=false
skip_next=false
for arg in "$@"; do
  if [ "$skip_next" = true ]; then skip_next=false; continue; fi
  case "$arg" in
    -vnc) skip_next=true; continue;;
    -L) has_L=true; args+=("$arg");;
    *) args+=("$arg");;
  esac
done
if [ "$has_L" = false ]; then
  args=("-L" "/usr/lib/xen/boot" "${args[@]}")
fi
exec "$REAL" "${args[@]}"
W1

chmod 755 /usr/libexec/xen-qemu-system-i386

echo "[3/4] Installing wrapper at /usr/lib/xen/bin/qemu-system-i386 (idempotent)"
ORIG2=/usr/lib/xen/bin/qemu-system-i386.orig
WRAPPER2=/usr/lib/xen/bin/qemu-system-i386
mkdir -p "$(dirname "$WRAPPER2")"

if [ ! -f "$ORIG2" ] && [ -f "$WRAPPER2" ]; then
  cp -a "$WRAPPER2" "$ORIG2"
  echo "backup created: $ORIG2"
fi

cat > /usr/lib/xen/bin/qemu-system-i386 <<'W2'
#!/usr/bin/env bash
REAL="/usr/lib/xen/bin/qemu-system-i386.orig"
if [ ! -x "$REAL" ] && [ -x /usr/libexec/xen-qemu-system-i386 ]; then
  REAL="/usr/libexec/xen-qemu-system-i386"
fi
args=()
has_L=false
skip_next=false
for arg in "$@"; do
  if [ "$skip_next" = true ]; then skip_next=false; continue; fi
  case "$arg" in
    -vnc) skip_next=true; continue;;
    -L) has_L=true; args+=("$arg");;
    *) args+=("$arg");;
  esac
done
if [ "$has_L" = false ]; then
  args=("-L" "/usr/lib/xen/boot" "${args[@]}")
fi
# minimal debug log
echo "$(date +'%F %T'): qemu-wrapper args:${args[*]}" >> /var/log/qemu-xen-wrapper.log 2>/dev/null || true
if [ ! -x "$REAL" ]; then
  echo "No executable QEMU backend found for Xen wrapper." >&2
  exit 127
fi
exec "$REAL" "${args[@]}"
W2

chmod 755 /usr/lib/xen/bin/qemu-system-i386

echo "[4/4] Done. You may restart libvirtd if desired: systemctl restart libvirtd"

echo "Host is ready — Xen host prepared for remote libvirt/virsh calls."
