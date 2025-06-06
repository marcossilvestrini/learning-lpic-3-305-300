#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    Script Name: namespace.sh
    Requirements: root privileges, unshare, chroot, Linux with namespace support
    Description: Automates creation of a minimal chroot and launches an isolated environment using multiple Linux namespaces.
    Author: Marcos Silvestrini
    Date: 06/06/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'
LANG=C

CHROOT_DIR="/mnt/myenv"
UTILS=(bash ls ps mkdir cat sh uname touch hostname ip id whoami)

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

  unshare --fork --pid --mount --uts --ipc --net --user --map-root-user \
    bash -c '
      mount -t proc proc /mnt/myenv/proc 2>/dev/null || echo "[WARN] ⚠️ Failed to mount /proc"
      mount -t sysfs sysfs /mnt/myenv/sys 2>/dev/null || echo "[WARN] ⚠️ Failed to mount /sys"

      chroot /mnt/myenv /usr/bin/hostname namespace-lab 2>/dev/null || echo "[WARN] ⚠️ Hostname set failed"

      chroot /mnt/myenv /usr/bin/hostname 2>/dev/null | xargs -I{} echo "[NAMESPACE UTS] 🌐 Hostname: {}"
      chroot /mnt/myenv /usr/bin/id 2>/dev/null | xargs -I{} echo "[NAMESPACE USER] 👤 UID/GID: {}"

      echo "[NAMESPACE PID] 🧵 Running ps:"
      chroot /mnt/myenv /usr/bin/ps aux 2>/dev/null || echo "✘ ps failed"

      echo "[NAMESPACE NET] 🌐 Network interfaces:"
      chroot /mnt/myenv /usr/sbin/ip a 2>/dev/null || echo "✘ ip failed"

      echo "[NAMESPACE MOUNT] 🗂️ Filesystem /tmp test:"
      if chroot /mnt/myenv /usr/bin/touch /tmp/ns-testfile 2>/dev/null; then
        echo "✔ /tmp OK"
      else
        echo "✘ /tmp failed"
      fi

      echo "[NAMESPACE FS] 📂 Root filesystem content:"
      chroot /mnt/myenv /usr/bin/ls / 2>/dev/null || echo "✘ ls failed"

      exec chroot /mnt/myenv /usr/bin/bash
    '
}

if [[ "$EUID" -ne 0 ]]; then
  abort "This script must be run as root"
fi

if [[ ! -d "$CHROOT_DIR/bin" ]]; then
  prepare_chroot
else
  log "Chroot already exists at $CHROOT_DIR 🏗️"
fi

run_namespace_env
