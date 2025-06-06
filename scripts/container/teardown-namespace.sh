#!/bin/bash

# Script Name: teardown-namespace.sh
# Description: Cleanup script for namespace + chroot lab
# Author: Marcos Silvestrini
# Date: 06/06/2025

set -euo pipefail
IFS=$'\n\t'
export LANG=C

CHROOT_DIR="/mnt/myenv"

log()   { echo "[INFO] $*"; }
warn()  { echo "[WARN] $*" >&2; }
abort() { echo "[ERROR] $*" >&2; exit 1; }

unmount_if_mounted() {
  local target="$1"
  if mountpoint -q "$target"; then
    umount -lf "$target" && log "Unmounted: $target"
  else
    log "Not mounted: $target (skipping)"
  fi
}

# Must run as root
if [[ "$EUID" -ne 0 ]]; then
  abort "This script must be run as root."
fi

if [[ ! -d "$CHROOT_DIR" ]]; then
  log "No chroot found at $CHROOT_DIR. Nothing to do."
  exit 0
fi

log "Starting chroot/namespace environment cleanup..."

# Unmount in correct order (leaf first)
unmount_if_mounted "$CHROOT_DIR/dev/pts"
unmount_if_mounted "$CHROOT_DIR/dev"
unmount_if_mounted "$CHROOT_DIR/proc"
unmount_if_mounted "$CHROOT_DIR/sys"

# Optional cleanup (comment if you want to keep the dir)
log "Removing chroot directory: $CHROOT_DIR"
rm -rf "$CHROOT_DIR"

log "✅ Namespace and chroot environment teardown complete."
