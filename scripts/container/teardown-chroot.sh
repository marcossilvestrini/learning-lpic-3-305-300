#!/bin/bash

: <<'MULTILINE-COMMENT'
    Script Name: teardown-chroot.sh
    Requirements: root privileges
    Description: Unmounts and optionally removes a prepared minimal chroot environment
    Author: Marcos Silvestrini
    Date: 06/06/2025
MULTILINE-COMMENT

# Ensure script is run as root
if [[ "$EUID" -ne 0 ]]; then
  echo "[ERROR] This script must be run as root." >&2
  exit 1
fi

# ===============================
# Global Settings
# ===============================

set -euo pipefail
IFS=$'\n\t'
export LANG=C

# ===============================
# Variables
# ===============================

CHROOT_DIR="/mnt/myenv"
REMOVE_DIR=true  # Set to true to also delete the chroot directory

# ===============================
# Functions
# ===============================

log()   { echo "[INFO] $*"; }
warn()  { echo "[WARN] $*" >&2; }
abort() { echo "[ERROR] $*" >&2; exit 1; }

umount_safely() {
    local target="$1"
    if mountpoint -q "$target"; then
        umount -l "$target" && log "Unmounted: $target" || warn "Failed to unmount: $target"
    else
        log "Not mounted: $target (skipping)"
    fi
}

# ===============================
# Execution
# ===============================

log "Starting chroot environment cleanup..."

for mp in dev/pts dev proc sys; do
    umount_safely "$CHROOT_DIR/$mp"
done

if [[ "$REMOVE_DIR" == true ]]; then
    log "Removing chroot directory: $CHROOT_DIR"
    rm -rf "$CHROOT_DIR"
fi

log "Chroot cleanup complete."
