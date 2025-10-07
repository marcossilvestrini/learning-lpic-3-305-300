#!/bin/bash

: <<'MULTILINE-COMMENT'
	📝 Script Name: docker-storage-lab.sh
	📚 Description: Prepare a secondary disk for Docker storage labs (LVM, Btrfs, ZFS) 
	 	with full cleanup and idempotent reset. 
		All partitions, filesystems, and LVM signatures are forcefully removed.
	👤 Author: Marcos Silvestrini
	📅 Date: 30/09/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

log()   { echo -e "[INFO] 🟢 $*"; }
warn()  { echo -e "[WARN] 🟡 $*" >&2; }
error() { echo -e "[ERROR] 🔴 $*" >&2; }

install_if_missing() {
  local cmd="$1" pkg="$2"
  if ! command -v "$cmd" &>/dev/null; then
    if command -v apt-get &>/dev/null; then
      sudo apt-get update -qq
      sudo apt-get install -y -qq "$pkg"
    elif command -v dnf &>/dev/null; then
      sudo dnf install -y "$pkg"
    elif command -v yum &>/dev/null; then
      sudo yum install -y "$pkg"
    else
      error "Unsupported package manager for '$pkg'"
      exit 1
    fi
  fi
}

get_secondary_disk() {
  local root_part root_disk
  root_part=$(findmnt -n -o SOURCE /)
  if [[ "$root_part" =~ (/dev/[a-z]+)[0-9]+ ]]; then
    root_disk="${BASH_REMATCH[1]}"
  else
    root_disk="$root_part"
  fi
  for d in $(lsblk -dn -o NAME,TYPE | awk '$2=="disk"{print $1}'); do
    local dev="/dev/$d"
    [[ "$dev" == "$root_disk" ]] && continue
    echo "$dev"
    return 0
  done
  return 1
}

cleanup_all() {
  local disk="$1"
  log "Cleaning up mounts/LVM/ZFS on ${disk}*..."
  for p in 1 2 3; do
    sudo umount "${disk}${p}" 2>/dev/null || true
  done
  sudo vgchange -an docker-lvm 2>/dev/null || true
  sudo lvchange -an docker-lvm 2>/dev/null || true
  # If a previous pool name was used, export/destroy silently
  sudo zpool export docker-zfs 2>/dev/null || true
  sudo zpool destroy docker-zfs 2>/dev/null || true
  sudo dmsetup remove_all 2>/dev/null || true
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
  log "Wiping signatures on ${disk}[1-3]..."
  for p in 1 2 3; do
    local dev="${disk}${p}"
    sudo pvremove -ff -y "$dev" 2>/dev/null || true
    sudo mdadm --zero-superblock "$dev" 2>/dev/null || true
    sudo wipefs -a "$dev" 2>/dev/null || true
  done
  sudo udevadm settle
}

summary() {
  echo "======= 📊 Docker Storage Lab Summary ======="
  lsblk -f
  command -v zpool >/dev/null 2>&1 && zpool list || true
  echo "============================================="
}

# --- Main
install_if_missing fdisk util-linux
install_if_missing mkfs.btrfs btrfs-progs
install_if_missing partprobe parted

DISK=$(get_secondary_disk) || { error "No suitable secondary disk found"; exit 1; }
log "Selected secondary disk: $DISK"

cleanup_all "$DISK"
create_partitions "$DISK"
full_partition_wipe "$DISK"

# LVM
if [[ -b "${DISK}1" ]]; then
  log "Initializing LVM on ${DISK}1..."
  sudo pvcreate -ff -y "${DISK}1"
  sudo vgcreate -ff -y docker-lvm "${DISK}1"
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

# ZFS pool(ASSUMES zfs.sh already ran + reboot)
if [[ -b "${DISK}3" ]]; then
  if command -v zpool >/dev/null 2>&1; then
    log "Creating ZFS pool 'docker-zfs' on ${DISK}3..."
    sudo zpool create -f docker-zfs "${DISK}3" || warn "zpool create returned non-zero (pool may already exist)."
    # Optional: export immediately to keep the disk free for future labs
    # sudo zpool export docker-zfs 2>/dev/null || true
    sudo zpool import docker-zfs 2>/dev/null || true

  else
    warn "zpool not found. Ensure zfs.sh ran and the system was rebooted."
  fi
fi

summary