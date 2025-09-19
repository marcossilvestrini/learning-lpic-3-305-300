#!/bin/bash

: <<'MULTILINE-COMMENT'
    Script Name: docker-storage-lab.sh
    Description: Prepare a secondary disk with a clean Btrfs partition for Docker storage labs.
    Author: Marcos Silvestrini
    Date: 21/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

log()   { echo -e "[INFO] $*"; }
warn()  { echo -e "[WARN] $*" >&2; }
error() { echo -e "[ERROR] $*" >&2; }

install_if_missing() {
    local cmd="$1"
    local pkg="$2"
    if ! command -v "$cmd" &>/dev/null; then
        log "Installing missing dependency: $cmd"
        if command -v apt-get &>/dev/null; then
            sudo apt-get update -qq
            sudo apt-get install -y -qq "$pkg"
        elif command -v dnf &>/dev/null; then
            sudo dnf install -y "$pkg"
        elif command -v yum &>/dev/null; then
            sudo yum install -y "$pkg"
        else
            error "Unsupported package manager. Please install '$pkg' manually."
            return 1
        fi
    fi
    return 0
}

resolve_base_disk() {
    local device="$1"
    local parent

    if [[ "$device" != /dev/* ]]; then
        device="/dev/${device##/dev/}"
    fi

    while true; do
        parent=$(lsblk -no PKNAME "$device" 2>/dev/null | head -n1)
        if [[ -z "$parent" || "$parent" == "-" ]]; then
            echo "$device"
            return 0
        fi
        device="/dev/$parent"
    done
}

get_secondary_disk() {
    local root_source root_disk disk
    root_source=$(findmnt -n -o SOURCE /)
    if [[ -z "$root_source" ]]; then
        error "Unable to detect the root device."
        return 1
    fi

    root_disk=$(resolve_base_disk "$root_source")

    for disk in $(lsblk -dn -o NAME,TYPE | awk '$2=="disk"{print $1}'); do
        disk="/dev/$disk"
        [[ "$disk" == "$root_disk" ]] && continue
        echo "$disk"
        return 0
    done
    return 1
}

cleanup_all() {
    local disk="$1"
    log "Cleaning up any existing filesystems on $disk..."

    mapfile -t partitions < <(lsblk -pn -o NAME,TYPE "$disk" | awk '$2=="part"{print $1}')
    for part in "${partitions[@]}"; do
        sudo umount "$part" 2>/dev/null || true
        sudo wipefs -a "$part" 2>/dev/null || true
    done

    sudo wipefs -a "$disk" 2>/dev/null || true
}

create_btrfs_partition() {
    local disk="$1"
    log "Partitioning $disk with a single Btrfs-ready partition (Docker labs)..."
    warn "This will ERASE all data on $disk."

    sudo wipefs -a "$disk"
    echo -e "g\nn\n1\n\n\n\nw\n" | sudo fdisk "$disk"

    if command -v partprobe &>/dev/null; then
        sudo partprobe "$disk"
    else
        warn "partprobe not available; waiting for kernel partition refresh"
    fi

    sudo udevadm settle 2>/dev/null || true

    local partition=""
    for _ in $(seq 1 10); do
        partition=$(lsblk -pn -o NAME "$disk" | awk 'NR==2')
        if [[ -n "$partition" && -b "$partition" ]]; then
            break
        fi
        sleep 1
        sudo udevadm settle 2>/dev/null || true
    done

    if [[ -z "$partition" || ! -b "$partition" ]]; then
        error "Failed to detect new partition on $disk"
        exit 1
    fi

    echo "$partition"
}

format_btrfs() {
    local partition="$1"
    local label="$2"

    log "Formatting $partition as Btrfs (label: $label)..."
    sudo mkfs.btrfs -f -L "$label" "$partition"
}

summary() {
    local disk="$1"
    echo "======= Storage Lab Summary ======="
    lsblk -f "$disk"
    echo "==================================="
}

install_if_missing fdisk util-linux
install_if_missing mkfs.btrfs btrfs-progs
install_if_missing partprobe parted

BTRFS_LABEL=${DOCKER_BTRFS_LABEL:-docker-storage}

DISK=$(get_secondary_disk) || { error "No suitable secondary disk found!"; exit 1; }
log "Selected disk for Docker storage: $DISK"

cleanup_all "$DISK"
PARTITION=$(create_btrfs_partition "$DISK")
format_btrfs "$PARTITION" "$BTRFS_LABEL"
summary "$DISK"

log "Partition ready: $PARTITION (Btrfs label '$BTRFS_LABEL')"
