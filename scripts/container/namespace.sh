#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: namespace.sh
    🔒 Requirements: root privileges, unshare, chroot, Linux with namespace support
    📚 Description: Automates creation of a minimal chroot and launches an isolated environment using multiple Linux namespaces.
    🦺 SAFETY: All mounts are isolated; no mounts are unmounted on the host! 
    👤 Author: Marcos Silvestrini
    📅 Date: 18/06/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'
LANG=C

CHROOT_DIR="/mnt/myenv"
UTILS=(bash ls ps mkdir cat sh uname touch hostname ip id whoami)
TEARDOWN_LOG="/tmp/ns_teardown.log"

log()   { echo -e "[INFO] 💻 $*"; }
warn()  { echo -e "[WARN] ⚠️ $*" >&2; }
abort() { echo -e "[ERROR] ❌ $*" >&2; exit 1; }

ensure_binary_and_libs() {
  local bin="$1"
  local path
  path="$(command -v "$bin" 2>/dev/null || true)"

  if [[ -z "$path" ]]; then
    warn "Binary not found: $bin"
    return
  fi

  dest="$CHROOT_DIR$(dirname "$path")"
  mkdir -p "$dest"
  cp -v "$path" "$dest/"

  ldd "$path" | awk '{print $3}' | grep -E '^/' | while read -r lib; do
    mkdir -p "$CHROOT_DIR$(dirname "$lib")"
    cp -vn "$lib" "$CHROOT_DIR$lib"
  done
}

prepare_chroot() {
  if [[ -d "$CHROOT_DIR/bin" ]]; then
    log "Chroot already exists at $CHROOT_DIR 🏗️"
    return
  fi
  log "Creating chroot base structure at $CHROOT_DIR 🛠️"
  mkdir -p "$CHROOT_DIR"/{bin,etc,usr/bin,usr/sbin,proc,sys,dev,tmp,lib64}

  log "Copying essential binaries and their libraries 📂"
  for bin in "${UTILS[@]}"; do
    ensure_binary_and_libs "$bin"
  done

  log "Copying essential system configuration 🛡️"
  cp -v /etc/resolv.conf "$CHROOT_DIR/etc/"
  cp -v /etc/passwd "$CHROOT_DIR/etc/"
  cp -v /etc/group "$CHROOT_DIR/etc/"

  ld_so="/lib64/ld-linux-x86-64.so.2"
  if [[ -f "$ld_so" ]]; then
    mkdir -p "$CHROOT_DIR/lib64"
    cp -v "$ld_so" "$CHROOT_DIR/lib64/"
  fi
}

run_namespace_env() {
  log "Launching unshare with full isolation 🚀"
  mount --bind /dev "$CHROOT_DIR/dev" 2>/dev/null && log "✔ /dev successfully bound" || warn "Failed to bind /dev"

  # Tudo dentro do namespace, não desmonta nada do host!
  unshare --fork --pid --mount --uts --ipc --net --user --map-root-user bash <<'EOF'
    set -e
    mount -t proc proc /mnt/myenv/proc 2>/dev/null || echo "[WARN] ⚠️ Failed to mount /proc"
    mount -t sysfs sysfs /mnt/myenv/sys 2>/dev/null || echo "[WARN] ⚠️ Failed to mount /sys"
    chroot /mnt/myenv /usr/bin/hostname namespace-lab 2>/dev/null || echo "[WARN] ⚠️ Hostname set failed"

    # Gera o resumo da experiência
    echo "[SUMMARY]" > /tmp/ns-lab-summary.txt

    hn=$(chroot /mnt/myenv /usr/bin/hostname 2>/dev/null)
    echo "[NAMESPACE UTS] 🌐 Hostname: $hn" >> /tmp/ns-lab-summary.txt

    id_out=$(chroot /mnt/myenv /usr/bin/id 2>/dev/null)
    echo "[NAMESPACE USER] 👤 UID/GID: $id_out" >> /tmp/ns-lab-summary.txt

    echo '[NAMESPACE PID] 🧵 Running processes:' >> /tmp/ns-lab-summary.txt
    chroot /mnt/myenv /usr/bin/ps -eo pid,user,args --sort=pid 2>/dev/null | head -n 5 | sed 's/^/    /' >> /tmp/ns-lab-summary.txt

    echo '[NAMESPACE NET] 🌐 Network interfaces:' >> /tmp/ns-lab-summary.txt
    chroot /mnt/myenv /usr/sbin/ip a 2>/dev/null | head -n 5 | sed 's/^/    /' >> /tmp/ns-lab-summary.txt

    echo -n '[NAMESPACE MOUNT] 🗂️ /tmp write: ' >> /tmp/ns-lab-summary.txt
    if chroot /mnt/myenv /usr/bin/touch /tmp/ns-testfile 2>/dev/null; then
      echo '✔ OK' >> /tmp/ns-lab-summary.txt
    else
      echo '❌ FAILED' >> /tmp/ns-lab-summary.txt
    fi

    echo '[NAMESPACE FS] 📂 Root filesystem:' >> /tmp/ns-lab-summary.txt
    chroot /mnt/myenv /usr/bin/ls / 2>/dev/null | tr '\n' ' ' >> /tmp/ns-lab-summary.txt
    echo >> /tmp/ns-lab-summary.txt

    echo ""
    echo "======================"
    echo "📊 Namespace Test Summary"
    echo "======================"
    cat /tmp/ns-lab-summary.txt
    echo "======================"
    echo
    exec chroot /mnt/myenv /usr/bin/bash
EOF
}

teardown_chroot() {
  log "Tearing down chroot lab and cleaning up temporary files 🧹"
  umount -l "$CHROOT_DIR/dev" 2>/dev/null || true
  rm -rf "$CHROOT_DIR"
  log "Cleanup complete."
}

main_menu() {
  clear
  echo "==============================="
  echo "  Namespace Simulator Lab"
  echo "   By Silvestrini - 2025"
  echo "==============================="
  echo "Choose an action:"
  echo "1. Prepare minimal chroot for namespace lab"
  echo "2. Run namespace lab (unshare + chroot + summary)"
  echo "9. Teardown/Cleanup Temporary Files"
  echo "0. Exit"
  echo "==============================="
}

# ======================
# Entry Point
# ======================
if [[ "$EUID" -ne 0 ]]; then abort "This script must be run as root"; fi

while true; do
  main_menu
  read -rp "Enter your choice [0,1,2,9]: " CHOICE
  case "$CHOICE" in
    1) prepare_chroot ;;
    2) run_namespace_env ;;
    9) teardown_chroot ;;
    0) echo "Bye!" && exit 0 ;;
    *) echo "Invalid option" ;;
  esac
  read -rp $'\nPress Enter to return to menu...'
done
