#!/bin/bash

: <<'MULTILINE-COMMENT'
    Script Name: lxd-storage-lab.sh
    Description: Prepare disk with partitions for LVM, Btrfs, and ZFS (for LXD storage pools)
    Author: Marcos Silvestrini + Linux Specialist AI
    Date: 21/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

# ===== LOGGING =====
log()   { echo -e "🟢 [INFO] $*"; }
warn()  { echo -e "🟡 [WARN] $*" >&2; }
error() { echo -e "🔴 [ERROR] $*" >&2; }

# ===== DEPENDENCIES =====
install_if_missing() {
    local cmd="$1"
    local pkg="$2"
    if ! command -v "$cmd" &>/dev/null; then
        log "Installing missing dependency: $cmd"
        if command -v apt-get &>/dev/null; then
            sudo apt-get update -qq && sudo apt-get install -y -qq "$pkg"
        elif command -v dnf &>/dev/null; then
            sudo dnf install -y "$pkg"
        elif command -v yum &>/dev/null; then
            sudo yum install -y "$pkg"
        else
            error "Unsupported package manager. Please install '$pkg' manually."
            exit 1
        fi
    fi
}

install_if_missing_zfs() {
    if ! command -v zpool &>/dev/null; then
        log "Installing ZFS (zfsutils-linux and zfs-dkms)..."        
        if ! grep -q "^deb .* contrib" /etc/apt/sources.list; then
            warn "Repositório 'contrib' não detectado. Adicionando temporariamente..."
            sudo sed -i '/^deb .* main/ s/$/ contrib/' /etc/apt/sources.list
            sudo apt update
        fi

        sudo apt install -y zfsutils-linux zfs-dkms || {
            error "Falha ao instalar ZFS. Verifique os repositórios."
            exit 1
        }
    else
        log "ZFS já está instalado."
    fi
}


# ===== DISK DETECTION =====
get_secondary_disk() {
    root_disk=$(lsblk -nr -o NAME,MOUNTPOINT | awk '$2=="/"{print $1}')
    for d in $(lsblk -dn -o NAME,TYPE | awk '$2=="disk"{print $1}'); do
        device="/dev/$d"
        [[ "$d" == "$root_disk" ]] && continue
        echo "$device"
        return 0
    done
    return 1
}

# ===== PARTITIONING (IDEMPOTENT) =====
create_partitions() {
    local disk="$1"
    log "Partitioning $disk for LVM, Btrfs, and ZFS (idempotent)..."
    # Idempotência: não faz nada se já tiver partições com os tipos/códigos certos
    if lsblk "$disk" | grep -E "lvm|btrfs|zfs" &>/dev/null; then
        log "Partitions for LVM, Btrfs, or ZFS already exist on $disk. Skipping partitioning."
        return 0
    fi

    # Limpando partições anteriores (apenas para LAB! ⚠️)
    warn "This will ERASE all partitions on $disk (lab only)!"
    sudo wipefs -a "$disk"
    echo -e "g\nn\n1\n\n+40G\nt\n8e\nn\n2\n\n+40G\nt\n2\n42\nn\n3\n\n\n\nt\n3\nbf\nw\n" | sudo fdisk "$disk"
    sudo partprobe "$disk"
    log "Partitions created: $(lsblk -l $disk | grep part)"
}

# ===== FORMAT PARTITIONS =====
format_partitions() {
    local disk="$1"
    local lvm_part="${disk}1"
    local btrfs_part="${disk}2"
    local zfs_part="${disk}3"

    # LVM
    if ! sudo pvs | grep -q "$lvm_part"; then
        log "Creating LVM PV/VG on $lvm_part"
        sudo pvcreate "$lvm_part"
        sudo vgcreate lpic3-lxd-lvm "$lvm_part"
    else
        log "LVM already initialized on $lvm_part"
    fi

    # Btrfs
    if ! sudo blkid "$btrfs_part" | grep -qi btrfs; then
        log "Formatting $btrfs_part with Btrfs"
        sudo mkfs.btrfs -f "$btrfs_part"
    else
        log "Btrfs already formatted on $btrfs_part"
    fi

    # ZFS - Check if zfsutils-linux is installed
    install_if_missing_zfs
    
    # load ZFS kernel module if not already loaded
    if ! lsmod | grep -q zfs; then
        log "Loading ZFS kernel module..."
        sudo /sbin/modprobe zfs || {
            error "Failed to load ZFS kernel module. Ensure ZFS is installed."
            exit 1
        }
    fi
    
    if sudo zpool status | grep -E "^\s+$DISK[0-9]+" >/dev/null; then
        # Ex: sda3 já está em algum pool ativo
        pool_name=$(sudo zpool status | awk -v part="${DISK}3" '
            /^  pool: /{p=$2}
            $1==part {print p}
        ')
        log "🟢 [INFO] ZFS partition ${DISK}3 is already in use by pool: $pool_name. Skipping creation."
    elif sudo zpool list | grep -qw lpic3-lxd-zfs; then
        log "🟢 [INFO] ZFS pool lpic3-lxd-zfs already exists. Skipping creation."
    else
        log "🟢 [INFO] Creating ZFS pool lpic3-lxd-zfs on ${DISK}3"
        sudo zpool create -f lpic3-lxd-zfs ${DISK}3
    fi

}


# ===== FINAL REPORT =====
summary() {
    echo "======= 📊 Storage Lab Summary ======="
    lsblk
    echo -e "\nLVM:"
    sudo vgdisplay lpic3-lxd-lvm || echo "LVM not present"
    echo -e "\nZFS:"
    sudo zpool status lpic3-lxd-zfs || echo "ZFS not present"
    echo "======================================"
}

# ===== MAIN FLOW =====
install_if_missing fdisk util-linux
install_if_missing mkfs.btrfs btrfs-progs
install_if_missing mkfs.xfs xfsprogs


DISK=$(get_secondary_disk) || { error "No suitable secondary disk found!"; exit 1; }
log "💾 Selected disk for storage: $DISK"

create_partitions "$DISK"
format_partitions "$DISK"
summary