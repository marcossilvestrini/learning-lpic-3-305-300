#!/usr/bin/env bash
set -euo pipefail

: <<'MULTILINE-COMMENT'
    Requirements: qemu-img, virt-customize
    Description: Create and customize a Debian qcow2 overlay for Xen/libvirt.
    Author: Marcos Silvestrini
MULTILINE-COMMENT

export LANG=C

BASE_IMAGE="${BASE_IMAGE:-/home/vagrant/os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2}"
OVERLAY_IMAGE="${OVERLAY_IMAGE:-/home/vagrant/os-images/Debian_12.0.0_VMM/Debian_12.0.0-xen-serial.qcow2}"
GUEST_IFACE="${GUEST_IFACE:-enX0}"

if [ "$(id -u)" -ne 0 ]; then
  echo "Run as root (sudo)."
  exit 1
fi

if [ ! -f "$BASE_IMAGE" ]; then
  echo "Base image not found: $BASE_IMAGE" >&2
  exit 1
fi

command -v qemu-img >/dev/null 2>&1 || { echo "qemu-img not found." >&2; exit 1; }
command -v virt-customize >/dev/null 2>&1 || { echo "virt-customize not found." >&2; exit 1; }

if [ ! -f "$OVERLAY_IMAGE" ]; then
  echo "Creating overlay: $OVERLAY_IMAGE"
  qemu-img create -f qcow2 -F qcow2 -b "$BASE_IMAGE" "$OVERLAY_IMAGE"
else
  echo "Overlay already exists: $OVERLAY_IMAGE"
fi

echo "Customizing overlay for Xen serial console, DHCP, and SSH host keys..."
virt-customize \
  -a "$OVERLAY_IMAGE" \
  --run-command "if grep -q '^GRUB_CMDLINE_LINUX=' /etc/default/grub; then sed -i 's/^GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX=\"console=tty0 console=ttyS0,115200n8\"/' /etc/default/grub; else echo 'GRUB_CMDLINE_LINUX=\"console=tty0 console=ttyS0,115200n8\"' >> /etc/default/grub; fi" \
  --run-command "update-grub" \
  --run-command "systemctl enable serial-getty@ttyS0.service" \
  --run-command "ssh-keygen -A" \
  --run-command "systemctl enable ssh" \
  --run-command "mkdir -p /etc/network/interfaces.d" \
  --run-command "grep -q '^source /etc/network/interfaces.d/\\*' /etc/network/interfaces || echo 'source /etc/network/interfaces.d/*' >> /etc/network/interfaces" \
  --run-command "printf 'auto ${GUEST_IFACE}\nallow-hotplug ${GUEST_IFACE}\niface ${GUEST_IFACE} inet dhcp\n' > /etc/network/interfaces.d/${GUEST_IFACE}.cfg"

echo "Overlay is ready: $OVERLAY_IMAGE"
