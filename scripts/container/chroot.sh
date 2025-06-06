#!/bin/bash

: <<'MULTILINE-COMMENT'
    Script Name: full-chroot-setup.sh
    Requirements: root privileges
    Description: Complete automation for creating and preparing a functional minimal chroot environment
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
WORKDIR="/home/vagrant"
UTILS=(ls ps mkdir cat sh uname touch w)

# ===============================
# Functions
# ===============================

log()   { echo "[INFO] $*"; }
warn()  { echo "[WARN] $*" >&2; }
abort() { echo "[ERROR] $*" >&2; exit 1; }

copy_binary_and_libs() {
    local bin_path="$1"
    local dest_bin_dir="$CHROOT_DIR$(dirname "$bin_path")"

    mkdir -p "$dest_bin_dir"
    cp -v "$bin_path" "$dest_bin_dir/"

    ldd "$bin_path" | awk '{print $3}' | grep -E '^/' | while read -r lib; do
        local dest_lib_dir="$CHROOT_DIR$(dirname "$lib")"
        mkdir -p "$dest_lib_dir"
        cp -vn "$lib" "$dest_lib_dir/" || warn "Failed to copy $lib"
    done
}

# ===============================
# Execution
# ===============================

cd "$WORKDIR" || abort "Cannot change to $WORKDIR"

log "Creating chroot base directory structure..."
mkdir -p "$CHROOT_DIR"/{bin,etc,usr,proc,sys,dev,dev/pts,tmp}

log "Copying /bin/bash binary..."
cp /bin/bash "$CHROOT_DIR/bin/"

log "Copying bash dependencies..."
ldd /bin/bash | awk '{print $3}' | grep -E '^/' | while read -r lib; do
    target="$CHROOT_DIR$(dirname "$lib")"
    mkdir -p "$target"
    cp -vn "$lib" "$target/"
done

log "Copying ELF dynamic linker (loader)..."
linker_path=$(ldd /bin/bash | grep 'ld-linux' | awk '{print $1}')
if [[ -f "$linker_path" ]]; then
    target="$CHROOT_DIR$(dirname "$linker_path")"
    mkdir -p "$target"
    cp -v "$linker_path" "$target/"
else
    abort "Dynamic linker not found!"
fi

log "Mounting virtual filesystems..."
for mp in dev dev/pts proc sys; do
    mount --bind "/$mp" "$CHROOT_DIR/$mp" 2>/dev/null || warn "Could not mount /$mp"
done

log "Copying essential config files..."
cp -v /etc/resolv.conf "$CHROOT_DIR/etc/"
cp -v /etc/passwd /etc/group "$CHROOT_DIR/etc/"

log "Adding common user utilities to chroot..."
for bin in "${UTILS[@]}"; do
    if command -v "$bin" &>/dev/null; then
        bin_path=$(command -v "$bin")
        log "Copying $bin and dependencies"
        copy_binary_and_libs "$bin_path"
    else
        warn "Binary not found: $bin"
    fi
done

log "Chroot environment setup complete."
echo "To enter: chroot $CHROOT_DIR /bin/bash"
