#!/bin/bash

: <<'MULTILINE-COMMENT'
	📝 Script Name: docker-storage-lab.sh
	📚 Description: Prepare a secondary disk for Docker storage labs (LVM, Btrfs, ZFS) with full cleanup and idempotent reset. All partitions, filesystems, and LVM signatures are forcefully removed.
	👤 Author: Marcos Silvestrini
	📅 Date: 30/09/2025
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

ensure_openzfs_support() {
    log "Ensuring OpenZFS support..."

    local kernel_release
    kernel_release=$(uname -r)

    if [[ "$kernel_release" == *"-rt"* ]]; then
        warn "RT kernel detected ($kernel_release) - skipping OpenZFS kernel modules."

        if command -v zpool >/dev/null 2>&1; then
            log "ZFS userland tools already available."
            return 0
        fi

        if ! command -v apt-get >/dev/null 2>&1 || ! command -v dpkg >/dev/null 2>&1; then
            warn "apt-get/dpkg unavailable; cannot install ZFS userland tools automatically."
            return 0
        fi

        local pkgs=(libnvpair3linux libuutil3linux libzfs4linux libzpool5linux zfs-zed zfsutils-linux)
        local missing_pkgs=()

        for pkg in "${pkgs[@]}"; do
            if ! dpkg -s "$pkg" >/dev/null 2>&1; then
                missing_pkgs+=("$pkg")
            fi
        done

        if ((${#missing_pkgs[@]} == 0)); then
            log "Required ZFS userland packages already installed."
            return 0
        fi

        local tmpdir
        tmpdir=$(mktemp -d)

        if [[ ! -d "$tmpdir" ]]; then
            warn "Failed to create temporary directory for ZFS packages; continuing without userspace tools."
            return 0
        fi

        pushd "$tmpdir" >/dev/null || { warn "Failed to enter temporary directory; continuing without userspace tools."; rm -rf "$tmpdir"; return 0; }

        sudo apt-get update -qq || warn "apt-get update failed while fetching ZFS userland packages."

        local pkg
        for pkg in "${missing_pkgs[@]}"; do
            if apt-get download "$pkg" >/dev/null 2>&1; then
                sudo dpkg --force-depends -i "$pkg"*.deb >/dev/null 2>&1 || warn "Failed to install $pkg without DKMS dependency."
            else
                warn "Could not download $pkg; continuing."
            fi
        done

        popd >/dev/null || true
        rm -rf "$tmpdir"

        warn "ZFS kernel modules remain unavailable on RT kernels; continuing without them."
        return 0
    fi

    if ! command -v apt-get >/dev/null 2>&1; then
        warn "apt-get not available; skipping automatic ZFS installation."
        return 0
    fi

    DEBIAN_FRONTEND=noninteractive sudo apt-get update -qq
    if ! DEBIAN_FRONTEND=noninteractive sudo apt-get install -y -qq \
        --no-install-recommends \
        --no-install-suggests \
        zfsutils-linux; then
        warn "Failed to install ZFS tools; continuing without them."
    else
        log "ZFS tools installed."
    fi
}

get_secondary_disk() {
	local root_partition root_disk
	root_partition=$(findmnt -n -o SOURCE /)
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
	for p in 1 2 3; do
		sudo umount "${disk}${p}" 2>/dev/null || true
	done
	sudo lvchange -an docker-lvm 2>/dev/null || true
	sudo vgchange -an docker-lvm 2>/dev/null || true
	sudo zpool export docker-zfs 2>/dev/null || true
	sudo zpool destroy docker-zfs 2>/dev/null || true
}

create_partitions() {
	local disk="$1"
	log "Partitioning $disk for LVM, Btrfs, and ZFS (stateless/lab reset)..."
	warn "This will ERASE all partitions and filesystems on $disk (lab only)!"
	sudo wipefs -a "$disk"
	echo -e "g\nn\n1\n\n+40G\nt\n8e\nn\n2\n\n+40G\nt\n2\n42\nn\n3\n\n\nt\n3\nbf\nw\n" | sudo fdisk "$disk"
	sudo partprobe "$disk"
	sudo udevadm settle
	sleep 2
	log "Partitions created: $(lsblk -l $disk | grep part)"
}

full_partition_wipe() {
	local disk="$1"
	log "Forcefully removing any LVM, RAID, or filesystem signature from all new partitions on $disk..."
	for part in 1 2 3; do
		local dev="${disk}${part}"
		sudo dmsetup remove_all 2>/dev/null || true
		sudo pvremove -ff -y "$dev" 2>/dev/null || true
		sudo mdadm --zero-superblock "$dev" 2>/dev/null || true
		sudo wipefs -a "$dev" 2>/dev/null || true
	done
	sudo udevadm settle
	sleep 1
}

summary() {
	echo "======= 📊 Docker Storage Lab Summary ======="
	lsblk -f
	zpool list 2>/dev/null || true
	echo "============================================="
}

# ===== MAIN FLOW =====
install_if_missing fdisk util-linux
install_if_missing mkfs.btrfs btrfs-progs
install_if_missing partprobe parted

# Garante suporte OpenZFS antes de continuar
ensure_openzfs_support

DISK=$(get_secondary_disk) || { error "No suitable secondary disk found!"; exit 1; }
log "💾 Selected disk for Docker storage: $DISK"

cleanup_all "$DISK"
create_partitions "$DISK"
full_partition_wipe "$DISK"

# LVM
if [ -b "${DISK}1" ]; then
	log "Initializing LVM on ${DISK}1..."
	sudo pvcreate -ff -y "${DISK}1"
	sudo vgcreate -ff -y docker-lvm "${DISK}1"
else
	warn "${DISK}1 not found, skipping LVM."
fi

# Btrfs
if [ -b "${DISK}2" ]; then
	log "Creating Btrfs filesystem on ${DISK}2..."
	sudo mkfs.btrfs -f -L docker-btrfs "${DISK}2"
	sudo partprobe "$DISK"
	sudo udevadm settle
	sleep 1
else
	warn "${DISK}2 not found, skipping Btrfs."
fi


# OpenZFS
if [ -b "${DISK}3" ]; then
    if uname -r | grep -q "rt"; then
        warn "RT kernel detected - skipping ZFS pool creation"
    else
        log "Creating OpenZFS pool on ${DISK}3..."
        if command -v zpool >/dev/null 2>&1; then
            sudo zpool create -f docker-zfs "${DISK}3" || {
                warn "Failed to create OpenZFS pool - skipping"
            }
            sudo zpool export docker-zfs 2>/dev/null || true
        else
            warn "ZFS tools not available - skipping pool creation"
        fi
    fi
else
    warn "${DISK}3 not found, skipping OpenZFS."
fi

summary
