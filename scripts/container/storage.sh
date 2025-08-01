#!/bin/bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: lxd-storage-lab.sh
    📚 Description: Prepare a secondary disk for LXD storage pools (LVM, Btrfs, ZFS) with full cleanup and idempotent reset. All partitions, filesystems, and LVM signatures are forcefully removed.
    👤 Author: Marcos Silvestrini + Linux Specialist AI
    📅 Date: 21/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

log()   { echo -e "[INFO] 🟢 $*"; }
warn()  { echo -e "[WARN] 🟡 $*" >&2; }
error() { echo -e "[ERROR] 🔴 $*" >&2; }

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

install_if_missing_zfs() {
    if ! command -v zpool &>/dev/null; then
        log "Instalando ZFS (zfsutils-linux e zfs-dkms)..."

        if ! grep -q "^deb .* contrib" /etc/apt/sources.list; then
            warn "Repository 'contrib' not detected. Adding temporarily..."            
            sudo sed -i '/^deb .* main/ s/$/ contrib/' /etc/apt/sources.list
            sudo apt update
        fi

        # Accept the ZFS license non-interactively
        echo "zfs-dkms zfs-dkms/license note" | sudo debconf-set-selections

        sudo DEBIAN_FRONTEND=noninteractive apt install -y zfsutils-linux zfs-dkms || {
            error "Failed to install ZFS. Check your repositories."
            exit 1
        }
    else
        log "ZFS já está instalado."
    fi
}


get_secondary_disk() {
    # Discover the device mounted as root ('/')
    local root_partition root_disk
    root_partition=$(findmnt -n -o SOURCE /)
    # Extract the base disk (e.g., /dev/sda from /dev/sda1)
    if [[ "$root_partition" =~ (/dev/[a-z]+)[0-9]+ ]]; then
        root_disk="${BASH_REMATCH[1]}"
    else
        root_disk="$root_partition"
    fi
    for d in $(lsblk -dn -o NAME,TYPE | awk '$2=="disk"{print $1}'); do
        disk="/dev/$d"
        [[ "$disk" == "$root_disk" ]] && continue
        echo "$disk"
        return 0
    done
    return 1
}

cleanup_all() {
    local disk="$1"
    log "Cleaning up any mounted filesystems, LVM, or ZFS pools on $disk and its partitions..."

    # Unmount all possible partitions on the disk
    for p in 1 2 3; do
        sudo umount "${disk}${p}" 2>/dev/null || true
    done

    # Deactivate LVM volume group (if any)
    sudo lvchange -an lpic3-lxd-lvm 2>/dev/null || true
    sudo vgchange -an lpic3-lxd-lvm 2>/dev/null || true

    # Export ZFS pool (if any)
    sudo zpool export lpic3-lxd-zfs 2>/dev/null || true
}

create_partitions() {
    local disk="$1"
    log "Partitioning $disk for LVM, Btrfs, and ZFS (stateless/lab reset)..."
    warn "This will ERASE all partitions and filesystems on $disk (lab only)!"
    sudo wipefs -a "$disk"
    # Create partitions: 1 (LVM, 40G), 2 (Btrfs, 40G), 3 (ZFS, rest)
    echo -e "g\nn\n1\n\n+40G\nt\n8e\nn\n2\n\n+40G\nt\n2\n42\nn\n3\n\n\n\nt\n3\nbf\nw\n" | sudo fdisk "$disk"
    sudo partprobe "$disk"
    # Wait for devices to be available and for udev to settle
    sudo udevadm settle
    sleep 2
    log "Partitions created: $(lsblk -l $disk | grep part)"
}

full_partition_wipe() {
    local disk="$1"
    log "Forcefully removing any LVM, RAID, or filesystem signature from all new partitions on $disk..."
    for part in 1 2 3; do
        local dev="${disk}${part}"
        # Remove all device-mapper devices possibly holding the partition
        sudo dmsetup remove_all 2>/dev/null || true
        # Remove LVM physical volume signatures, if present
        sudo pvremove -ff -y "$dev" 2>/dev/null || true
        # Remove any RAID/MD signatures (optional, robust for labs)
        sudo mdadm --zero-superblock "$dev" 2>/dev/null || true
        # Wipe all filesystem signatures
        sudo wipefs -a "$dev" 2>/dev/null || true
    done
    sudo udevadm settle
    sleep 1
}

summary() {
    echo "======= 📊 Storage Lab Summary ======="
    lsblk -f
    echo "======================================"
}

# ===== MAIN FLOW =====
install_if_missing fdisk util-linux

# ZFS - Check if zfsutils-linux is installed
install_if_missing_zfs

DISK=$(get_secondary_disk) || { error "No suitable secondary disk found!"; exit 1; }
log "💾 Selected disk for storage: $DISK"

cleanup_all "$DISK"
create_partitions "$DISK"
full_partition_wipe "$DISK"
summary
