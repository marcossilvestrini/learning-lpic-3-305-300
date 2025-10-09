#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: docker-storage-volumes-lab.sh
    🔒 Requirements: root privileges; Docker Engine; lvm2/xfsprogs (overlay2); zfsutils-linux (ZFS); btrfs-progs (Btrfs); jq (optional)
    📚 Description: Unified storage lab for Docker:
      - Configure Docker storage backends (overlay2, ZFS, Btrfs) with auto-detection of pre-created lab partitions
      - Persist mounts (fstab) and set Docker data-root + storage-driver in daemon.json
      - Restart Docker and validate the effective driver
      - Run volume scenarios: Named Volume, Bind Mount, Tmpfs
      - Provide an intuitive operational summary
    🎯 Scope:
      - overlay2 on XFS (ftype=1) over LVM PV (reuse existing VG if PV already grouped)
      - ZFS pool/dataset (device labeled 'docker-zfs')
      - Btrfs filesystem + subvolume (device labeled 'docker-btrfs')
      - Volume lab: named volume, bind mount, tmpfs (each with validation container)
    👤 Author: Marcos Silvestrini
    📅 Date: 08/10/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

# =========================
# 📦 Global configuration
# =========================
DOCKER_DAEMON_JSON="/etc/docker/daemon.json"
BACKUP_DIR="/var/backups/docker-storage-lab"

MOUNT_BASE="/srv/docker-backends"
VOL_BASE="/srv/docker-volumes"
LAB_BASE="/srv/docker-volumes-lab"
STATE_DIR="/var/run/docker-volumes-lab"

SYSTEMD_DOCKER_UNIT="docker.service"
DOCKER_IMAGE="alpine:3.20"

# Storage driver runtime state
DRIVER=""
DATA_ROOT=""
BACKEND_DEVICE=""
BACKEND_MOUNT=""

# LVM names (overlay2)
VG_NAME="vg_docker"
LV_NAME="lv_overlay2"

# ZFS names
ZFS_POOL_DEFAULT="dockerpool"
ZFS_DATASET_NAME="docker"

# Volume lab defaults
VOLUME_NAME="${VOLUME_NAME:-labvol-default}"
BIND_DIR_DEFAULT="${LAB_BASE}/bind1"
TMPFS_SIZE_DEFAULT="${TMPFS_SIZE:-5g}"

# Containers per scenario
CTR_VOLUME="labctr-volume"
CTR_BIND="labctr-bind"
CTR_TMPFS="labctr-tmpfs"

# =========================
# 🗒️ Logging & helpers
# =========================
log()   { echo -e "[INFO]  📌 $*"; }
warn()  { echo -e "[WARN]  ⚠️  $*" >&2; }
error() { echo -e "[ERROR] ❌ $*" >&2; }
abort() { error "$*"; exit 1; }

require_root() { [[ $EUID -eq 0 ]] || abort "Run as root (sudo)."; }
has_cmd() { command -v "$1" &>/dev/null; }
ensure_dir() { mkdir -p "$1"; }

install_pkg_if_missing() {
  local pm=""
  if has_cmd apt-get; then pm="apt-get -qqy install"
  elif has_cmd dnf; then pm="dnf -y install"
  elif has_cmd yum; then pm="yum -y install"
  else abort "Unsupported package manager. Please install required packages manually."
  fi
  for pkg in "$@"; do
    if ! dpkg -s "$pkg" &>/dev/null && ! rpm -q "$pkg" &>/dev/null; then
      log "Installing dependency: $pkg"
      bash -lc "$pm $pkg"
    fi
  done
}

backup_file_if_exists() {
  local f="$1"
  [[ -f "$f" ]] || return 0
  ensure_dir "$BACKUP_DIR"
  cp -a "$f" "$BACKUP_DIR/$(basename "$f").bak.$(date +%F-%H%M%S)"
  log "Backup created: $BACKUP_DIR/$(basename "$f")"
}

append_fstab_once() {
  local entry="$1"
  if ! grep -qsF "$entry" /etc/fstab; then
    echo "$entry" >> /etc/fstab
    log "fstab updated with: $entry"
  else
    log "fstab entry already present; skipping."
  fi
}

mount_if_needed() {
  local target="$1"
  if mountpoint -q "$target"; then
    log "Mount already active: $target"
  else
    log "Mounting: $target"
    mount "$target" 2>/dev/null || warn "Mount skipped (already busy or mounted)."
  fi
}

normalize_devpath() {
  local raw="$1"
  echo "$raw" | grep -Eo '/dev/[a-zA-Z0-9/_.-]+' | head -n1
}

json_print() {
  if has_cmd jq; then jq -r '.'; else cat; fi
}

exists_container(){ docker ps -a --format '{{.Names}}' | grep -qx "$1"; }
running_container(){ docker ps --format '{{.Names}}' | grep -qx "$1"; }

recreate_container() {
  local name="$1"; shift
  docker rm -f "$name" >/dev/null 2>&1 || true
  docker run -d --name "$name" "$@" >/dev/null
}

print_lsblk_snapshot() {
  log "lsblk snapshot (raw):"
  lsblk -rpo NAME,FSTYPE,LABEL,TYPE,SIZE | sed 's/^/[LSBLK] /'
}

# =========================
# 🔎 Auto-detection
# =========================
detect_btrfs_partition() {
  lsblk -rpo NAME,FSTYPE,LABEL,TYPE | awk '$2=="btrfs" && $3=="docker-btrfs" && $4=="part"{print $1}' | head -n1
}
detect_zfs_member_partition() {
  lsblk -rpo NAME,FSTYPE,LABEL,TYPE | awk '$2=="zfs_member" && $3=="docker-zfs" && $4=="part"{print $1}' | head -n1
}
detect_overlay_lvm_pv() {
  lsblk -rpo NAME,FSTYPE,TYPE | awk '$2=="LVM2_member" && $3=="part"{print $1}' | head -n1
}

# =========================
# 🎛️ Driver selection
# =========================
choose_driver() {
  echo "Select Docker storage driver:"
  echo "1) overlay2 (XFS with ftype=1 over LVM)"
  echo "2) zfs (zfs_member labeled 'docker-zfs')"
  echo "3) btrfs (Btrfs labeled 'docker-btrfs')"
  read -rp "Option [1-3]: " opt
  case "${opt:-1}" in
    1) DRIVER="overlay2" ;;
    2) DRIVER="zfs" ;;
    3) DRIVER="btrfs" ;;
    *) DRIVER="overlay2" ;;
  esac
  log "Selected driver: $DRIVER"
}

autodetect_device_for_driver() {
  print_lsblk_snapshot
  case "$DRIVER" in
    btrfs) BACKEND_DEVICE="$(detect_btrfs_partition || true)" ;;
    zfs) BACKEND_DEVICE="$(detect_zfs_member_partition || true)" ;;
    overlay2) BACKEND_DEVICE="$(detect_overlay_lvm_pv || true)" ;;
  esac
  BACKEND_DEVICE="$(normalize_devpath "${BACKEND_DEVICE:-}")"
  [[ -n "${BACKEND_DEVICE:-}" && -b "$BACKEND_DEVICE" ]] || abort "No suitable backend device found for $DRIVER."
  log "Auto-detected backend device: $BACKEND_DEVICE"
}

# =========================
# 🧱 Backend provisioning
# =========================
provision_overlay2() {
  install_pkg_if_missing lvm2 xfsprogs
  BACKEND_MOUNT="$MOUNT_BASE/overlay2"; ensure_dir "$BACKEND_MOUNT"
  local lv_path="/dev/${VG_NAME}/${LV_NAME}"

  if ! vgdisplay "$VG_NAME" &>/dev/null; then
    log "Creating VG '$VG_NAME'..."
    vgcreate "$VG_NAME" "$BACKEND_DEVICE" >/dev/null
  fi

  if ! lvdisplay "$lv_path" &>/dev/null; then
    log "Creating LV '$LV_NAME'..."
    lvcreate -n "$LV_NAME" -l 100%FREE "$VG_NAME" >/dev/null
  fi

  if ! blkid "$lv_path" | grep -q 'TYPE="xfs"'; then
    log "Formatting LV as XFS (ftype=1)..."
    mkfs.xfs -f -n ftype=1 "$lv_path" >/dev/null
  fi

  local uuid; uuid=$(blkid -s UUID -o value "$lv_path")
  append_fstab_once "UUID=$uuid $BACKEND_MOUNT xfs defaults,pquota 0 2"
  mount_if_needed "$BACKEND_MOUNT"

  DATA_ROOT="$BACKEND_MOUNT/docker"; ensure_dir "$DATA_ROOT"
}

provision_zfs() {
  install_pkg_if_missing zfsutils-linux || install_pkg_if_missing zfs
  BACKEND_MOUNT="$MOUNT_BASE/zfs"; ensure_dir "$BACKEND_MOUNT"

  local pool_label pool dataset
  pool_label=$(lsblk -rpo NAME,LABEL | awk -v dev="$BACKEND_DEVICE" '$1==dev{print $2}')
  pool="${pool_label:-$ZFS_POOL_DEFAULT}"
  dataset="${pool}/${ZFS_DATASET_NAME}"

  if zpool list "$pool" &>/dev/null; then
    log "ZFS pool '$pool' already active."
  else
    if zpool import | grep -q "^  pool: $pool"; then
      log "Importing existing ZFS pool '$pool'..."
      zpool import "$pool" || warn "Pool import skipped (already mounted)."
    else
      log "Creating ZFS pool '$pool' on $BACKEND_DEVICE..."
      zpool create -f -o ashift=12 "$pool" "$BACKEND_DEVICE" || warn "ZFS pool creation skipped (device busy)."
    fi
  fi

  if ! zfs list "$dataset" &>/dev/null; then
    log "Creating dataset $dataset..."
    zfs create -o mountpoint="$BACKEND_MOUNT" "$dataset" || warn "Dataset creation skipped."
  else
    log "Dataset $dataset already exists."
    zfs set mountpoint="$BACKEND_MOUNT" "$dataset" || warn "Mountpoint already defined."
  fi

  if mountpoint -q "$BACKEND_MOUNT"; then
    log "Dataset already mounted at $BACKEND_MOUNT."
  else
    zfs mount "$dataset" || warn "Dataset busy; mount skipped."
  fi

  DATA_ROOT="$BACKEND_MOUNT/docker"; ensure_dir "$DATA_ROOT"
}

provision_btrfs() {
  install_pkg_if_missing btrfs-progs
  BACKEND_MOUNT="$MOUNT_BASE/btrfs"; ensure_dir "$BACKEND_MOUNT"

  local uuid; uuid=$(blkid -s UUID -o value "$BACKEND_DEVICE")
  append_fstab_once "UUID=$uuid $BACKEND_MOUNT btrfs defaults 0 0"
  mount_if_needed "$BACKEND_MOUNT"

  if ! btrfs subvolume list "$BACKEND_MOUNT" | grep -q "/docker"; then
    log "Creating Btrfs subvolume 'docker'..."
    btrfs subvolume create "$BACKEND_MOUNT/docker" >/dev/null || true
  fi

  DATA_ROOT="$BACKEND_MOUNT/docker"; ensure_dir "$DATA_ROOT"
}

# =========================
# 🐳 Docker config
# =========================
configure_docker_daemon() {
  [[ -n "$DATA_ROOT" ]] || abort "DATA_ROOT not set."
  [[ -n "$DRIVER" ]] || abort "DRIVER not set."
  install_pkg_if_missing jq util-linux
  ensure_dir "$(dirname "$DOCKER_DAEMON_JSON")"
  backup_file_if_exists "$DOCKER_DAEMON_JSON"
  cat >"$DOCKER_DAEMON_JSON" <<EOF
{
  "data-root": "$DATA_ROOT",
  "storage-driver": "$DRIVER",
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
EOF
  log "daemon.json updated:"
  jq '.' "$DOCKER_DAEMON_JSON" || cat "$DOCKER_DAEMON_JSON"
}

restart_docker() {
  log "Restarting Docker service..."
  systemctl daemon-reload || true
  systemctl enable --now "$SYSTEMD_DOCKER_UNIT" || true
  systemctl restart "$SYSTEMD_DOCKER_UNIT" || warn "Docker restart warning."
  sleep 2
  if docker info >/dev/null 2>&1; then
    local eff; eff=$(docker info --format '{{.Driver}}')
    log "Docker running with driver: $eff ✅"
  else
    warn "Docker service active, but not responding; check logs."
  fi
}


# =========================
# 🧪 Volume lab scenarios
# =========================
volume_create_and_test() {
  local vol_name="$1"
  log "Ensuring Docker volume exists: $vol_name …"
  if ! docker volume inspect "$vol_name" >/dev/null 2>&1; then
    docker volume create --label "lab=volumes" --label "scenario=volume" "$vol_name" >/dev/null
    log "Volume created: $vol_name"
  else
    log "Volume already present: $vol_name (idempotent)"
  fi
  log "Launching validation container for volume: $CTR_VOLUME"
  recreate_container "$CTR_VOLUME" -v "${vol_name}:/data" "$DOCKER_IMAGE" \
    sh -c "echo $(date +%F_%T) ':: hello from volume' > /data/marker.txt && sleep 1d"
  log "Validating marker file (volume)…"
  docker exec "$CTR_VOLUME" sh -lc 'ls -l /data && cat /data/marker.txt' || abort "Volume validation failed."
  log "Volume scenario OK ✅"
}

bind_create_and_test() {
  local host_path="$1"
  ensure_dir "$host_path"; chmod 0777 "$host_path" || true
  log "Launching validation container for bind: $CTR_BIND"
  recreate_container "$CTR_BIND" -v "${host_path}:/data" "$DOCKER_IMAGE" \
    sh -c "echo $(date +%F_%T) ':: hello from bind' > /data/marker.txt && sleep 1d"
  log "Validating marker file (bind)…"
  docker exec "$CTR_BIND" sh -lc 'ls -l /data && cat /data/marker.txt' || abort "Bind validation failed."
  log "Host path content (bind):"; ls -l "$host_path" || true
  log "Bind scenario OK ✅"
}

tmpfs_create_and_test() {
  local tmpfs_size="$1"
  log "Launching validation container for tmpfs: $CTR_TMPFS (size=${tmpfs_size})"
  recreate_container "$CTR_TMPFS" --tmpfs "/data:rw,size=${tmpfs_size},noexec,nosuid,nodev" "$DOCKER_IMAGE" \
    sh -c "echo $(date +%F_%T) ':: hello from tmpfs' > /data/marker.txt && sleep 1d"
  log "Validating tmpfs mount…"
  docker exec "$CTR_TMPFS" sh -lc 'mount | grep " on /data type tmpfs" && ls -l /data && cat /data/marker.txt' \
    || abort "Tmpfs validation failed."
  log "Tmpfs scenario OK ✅"
}

# =========================
# 🧹 Teardown / Cleanup
# =========================
teardown_lab() {
  log "Stopping & removing lab containers…"
  docker rm -f "$CTR_VOLUME" "$CTR_BIND" "$CTR_TMPFS" >/dev/null 2>&1 || true
  log "Containers removed."
}
prune_volume() {
  local vol_name="$1"
  if docker volume inspect "$vol_name" >/dev/null 2>&1; then
    log "Removing Docker volume: $vol_name"
    docker volume rm "$vol_name" >/dev/null || warn "Volume in use or removal failed: $vol_name"
  else
    log "Volume not present: $vol_name (skip)"
  fi
}
cleanup_bind_dir() {
  local host_path="$1"
  if [[ -d "$host_path" ]]; then
    if [ -z "$(ls -A "$host_path")" ]; then
      log "Removing empty bind directory: $host_path"; rmdir "$host_path" || true
    else
      log "Bind directory not empty (kept): $host_path"
    fi
  fi
}

# =========================
# 📊 Summary
# =========================
show_storage_summary() {
  echo
  echo "============================= 📊 Docker Storage Backend ============================="
  echo "🧩 Selected Driver .............: $DRIVER"
  echo "💽 Backend Device ..............: ${BACKEND_DEVICE:-n/a}"
  echo "📂 Backend Mount ...............: ${BACKEND_MOUNT:-n/a}"
  echo "📦 Docker Data-Root ............: $(docker info --format '{{.DockerRootDir}}' 2>/dev/null || echo 'n/a')"
  echo "🧠 Effective Driver (docker) ...: $(docker info --format '{{.Driver}}' 2>/dev/null || echo 'n/a')"
  echo "-------------------------------------------------------------------------------------"
  if docker info >/dev/null 2>&1; then
    df -h "$(docker info --format '{{.DockerRootDir}}')" || true
  fi
  echo "====================================================================================="
}
show_volumes_summary() {
  echo
  echo "============================= 📊 Docker Volumes Lab Summary ============================="
  echo "🐳 Docker version ..............: $(docker version --format '{{.Server.Version}}' 2>/dev/null || echo 'n/a')"
  echo "📦 Docker RootDir ..............: $(docker info --format '{{.DockerRootDir}}' 2>/dev/null || echo 'n/a')"
  echo "-----------------------------------------------------------------------------------------"

  echo "🧱 Scenario: Volume"
  if docker volume inspect "$VOLUME_NAME" >/dev/null 2>&1; then
    docker volume inspect "$VOLUME_NAME" | json_print
    local mp; mp=$(docker volume inspect "$VOLUME_NAME" -f '{{.Mountpoint}}' 2>/dev/null || true)
    [[ -n "$mp" ]] && { echo "📁 Mountpoint: $mp"; df -h "$mp" || true; }
    echo "🔗 Consumers:"; docker ps --filter "name=${CTR_VOLUME}" --format "table {{.Names}}\t{{.Status}}\t{{.Mounts}}"
  else
    echo "  ⛔ Volume '${VOLUME_NAME}' not present."
  fi
  echo "-----------------------------------------------------------------------------------------"

  echo "🗂️  Scenario: Bind Mount"
  if running_container "$CTR_BIND" || exists_container "$CTR_BIND"; then
    local host_path; host_path=$(docker inspect -f '{{range .Mounts}}{{if eq .Destination "/data"}}{{.Source}}{{end}}{{end}}' "$CTR_BIND" 2>/dev/null || true)
    echo "📁 Host path: ${host_path:-n/a}"
    [[ -n "${host_path:-}" && -d "$host_path" ]] && { df -h "$host_path" || true; ls -l "$host_path" || true; }
    docker ps --filter "name=${CTR_BIND}" --format "table {{.Names}}\t{{.Status}}\t{{.Mounts}}"
  else
    echo "  ℹ️  Bind container '${CTR_BIND}' not running."
  fi
  echo "-----------------------------------------------------------------------------------------"

  echo "💾 Scenario: Tmpfs"
  if running_container "$CTR_TMPFS" || exists_container "$CTR_TMPFS"; then
    echo "🔎 Container mounts:"; docker exec "$CTR_TMPFS" sh -lc 'mount | grep " on /data type tmpfs" || true'
    docker ps --filter "name=${CTR_TMPFS}" --format "table {{.Names}}\t{{.Status}}\t{{.Mounts}}"
  else
    echo "  ℹ️  Tmpfs container '${CTR_TMPFS}' not running."
  fi
  echo "========================================================================================="
}

# =========================
# 🧭 Menu
# =========================
main_menu() {
  clear
  echo "============================================"
  echo "     Docker Storage + Volumes Unified Lab"
  echo "           By Silvestrini - 2025"
  echo "============================================"
  echo "Current defaults:"
  echo " - Driver: ${DRIVER:-<not set>}"
  echo " - Data-Root: ${DATA_ROOT:-<not set>}"
  echo " - Named Volume: $VOLUME_NAME"
  echo " - Bind HostDir: $BIND_DIR_DEFAULT"
  echo " - Tmpfs Size: $TMPFS_SIZE_DEFAULT"
  echo "============================================"
  echo "Choose an action:"
  echo "1) Configure Docker storage driver & data-root"
  echo "2) Create & test Named Volume"
  echo "3) Create & test Bind Mount"
  echo "4) Create & test Tmpfs Mount"
  echo "5) Show Storage Backend Summary"
  echo "6) Show Volumes Lab Summary"
  echo "9) Teardown (remove lab containers; optional cleanup)"
  echo "0) Exit"
  echo "============================================"
}

# =========================
# 🚀 Entry point
# =========================
main() {
  require_root
  has_cmd docker || abort "Docker Engine not found. Please install Docker first."
  install_pkg_if_missing util-linux jq

  ensure_dir "$MOUNT_BASE"; ensure_dir "$VOL_BASE"; ensure_dir "$LAB_BASE"; ensure_dir "$STATE_DIR"

  while true; do
    main_menu
    read -rp "Enter your choice [0,1,2,3,4,5,6,9]: " CHOICE
    case "$CHOICE" in
      1)
        choose_driver
        [[ "$DRIVER" == "overlay2" ]] && install_pkg_if_missing lvm2
        autodetect_device_for_driver
        case "$DRIVER" in
          overlay2) provision_overlay2 ;;
          zfs)      provision_zfs ;;
          btrfs)    provision_btrfs ;;
          *) abort "Unsupported driver." ;;
        esac
        configure_docker_daemon
        restart_docker
        show_storage_summary
        ;;
      2)
        read -rp "Volume name [${VOLUME_NAME}]: " VN; VN="${VN:-$VOLUME_NAME}"; VOLUME_NAME="$VN"
        volume_create_and_test "$VOLUME_NAME"
        ;;
      3)
        read -rp "Bind host directory [${BIND_DIR_DEFAULT}]: " BD; BD="${BD:-$BIND_DIR_DEFAULT}"
        bind_create_and_test "$BD"
        ;;
      4)
        read -rp "Tmpfs size (e.g., 64m, 5g) [${TMPFS_SIZE_DEFAULT}]: " TS; TS="${TS:-$TMPFS_SIZE_DEFAULT}"
        tmpfs_create_and_test "$TS"
        ;;
      5)
        show_storage_summary
        ;;
      6)
        show_volumes_summary
        ;;
      9)
        teardown_lab
        read -rp "Remove named volume '${VOLUME_NAME}' as well? [y/N]: " RMV
        if [[ "$RMV" =~ ^[Yy]$ ]]; then prune_volume "$VOLUME_NAME"; fi
        read -rp "Remove default bind dir '${BIND_DIR_DEFAULT}' if empty? [y/N]: " RMD
        if [[ "$RMD" =~ ^[Yy]$ ]]; then cleanup_bind_dir "$BIND_DIR_DEFAULT"; fi
        ;;
      0)
        echo "Bye!"; exit 0 ;;
      *)
        echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
  done
}

main "$@"
