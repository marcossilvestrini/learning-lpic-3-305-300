#!/bin/bash

: <<'MULTILINE-COMMENT'
    Script Name: full-chroot-lab.sh
    Requirements: root privileges
    Description: Automates setup and teardown of a functional minimal chroot environment,
                 with interactive menu.
    Author: Marcos Silvestrini
    Date: 06/06/2025
MULTILINE-COMMENT

# Ensure script is run as root
if [[ "$EUID" -ne 0 ]]; then
  echo "[ERROR] This script must be run as root." >&2
  exit 1
fi

set -euo pipefail
IFS=$'\n\t'
export LANG=C

# Variables
CHROOT_DIR="/mnt/myenv"
WORKDIR="/home/vagrant"
UTILS=(ls ps mkdir cat sh uname touch w)
REMOVE_DIR=true  # Set to true to also delete the chroot directory

# Logging
log()   { echo "[INFO] $*"; }
warn()  { echo "[WARN] $*" >&2; }
abort() { echo "[ERROR] $*" >&2; exit 1; }

# ===============================
# FUNCTIONS
# ===============================

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

setup_chroot_env() {
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
    cp -v /etc/resolv.conf "$CHROOT_DIR/etc/" || warn "No resolv.conf"
    cp -v /etc/passwd /etc/group "$CHROOT_DIR/etc/" || warn "No passwd/group"
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
}

umount_safely() {
    local target="$1"
    if mountpoint -q "$target"; then
        umount -l "$target" && log "Unmounted: $target" || warn "Failed to unmount: $target"
    else
        log "Not mounted: $target (skipping)"
    fi
}

teardown_chroot_env() {
    log "Starting chroot environment cleanup..."
    for mp in dev/pts dev proc sys; do
        umount_safely "$CHROOT_DIR/$mp"
    done
    if [[ "$REMOVE_DIR" == true ]]; then
        log "Removing chroot directory: $CHROOT_DIR"
        rm -rf "$CHROOT_DIR"
    fi
    log "Chroot cleanup complete."
}

main_menu() {
    clear
    echo "==============================="
    echo "  Chroot Simulator Lab"
    echo "   By Silvestrini - 2025"
    echo "==============================="
    echo "Choose an action:"
    echo "1. Setup chroot environment"
    echo "9. Teardown/Cleanup Temporary Files"
    echo "0. Exit"
    echo "==============================="
}

# ===============================
# MAIN LOOP
# ===============================
while true; do
    main_menu
    read -rp "Enter your choice [0,1,9]: " CHOICE
    case "$CHOICE" in
        1) setup_chroot_env ;;
        9) teardown_chroot_env ;;
        0) echo "Bye!" && exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
done
