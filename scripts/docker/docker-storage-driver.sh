#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: docker-storage-driver.sh
    🔒 Requirements: root privileges; Docker Engine; lvm2/xfsprogs (overlay2); zfsutils-linux (ZFS); btrfs-progs (Btrfs)
    📚 Description: Provision and configure Docker storage backends (overlay2, ZFS, Btrfs) end-to-end:
      - Auto-detect pre-created lab partitions (no hard-coded /dev/sdX)
      - Persist mounts in /etc/fstab; configure /etc/docker/daemon.json
      - Restart Docker and validate effective driver
      - Provision a 5GB loop-backed volume and run a test container bound to it
      - Display a clear operational summary
    🎯 Scope:
      - overlay2 on XFS (ftype=1) over LVM PV (reuse existing VG if PV already grouped)
      - Native ZFS pool/dataset (device labeled 'docker-zfs')
      - Native Btrfs filesystem + subvolume (device labeled 'docker-btrfs')
    ⚙️ Idempotency: Safe re-runs (fstab append-once; pool/dataset/subvolume guarded; daemon.json backup)
    🧯 Rollback (manual): umount targets; zpool destroy/import; remove fstab entries/backups; stop Docker
    👤 Author: Marcos Silvestrini
    📅 Date: 06/10/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

# =========================
# 📦 Global configuration
# =========================
DOCKER_DAEMON_JSON="/etc/docker/daemon.json"
BACKUP_DIR="/var/backups/docker-storage-driver"
VOLUME_NAME_PREFIX="labvol"
CONTAINER_NAME_PREFIX="labctr"
LOOP_VOL_SIZE_GB=5
MOUNT_BASE="/srv/docker-backends"
VOL_BASE="/srv/docker-volumes"
SYSTEMD_DOCKER_UNIT="docker.service"

# Runtime state (for the final summary)
DRIVER=""
DATA_ROOT=""
VOLUME_NAME=""
VOLUME_PATH=""
CONTAINER_NAME=""
BACKEND_DEVICE=""
BACKEND_MOUNT=""

# LVM names (overlay2 path)
VG_NAME="vg_docker"
LV_NAME="lv_overlay2"

# ZFS names
ZFS_POOL_DEFAULT="dockerpool"
ZFS_DATASET_NAME="docker"

# =========================
# 🗒️ Logging & helpers
# =========================
log()   { echo -e "[INFO]  📌 $*"; }
warn()  { echo -e "[WARN]  ⚠️  $*" >&2; }
error() { echo -e "[ERROR] ❌ $*" >&2; }
abort() { error "$*"; exit 1; }

require_root() { [[ $EUID -eq 0 ]] || abort "Run as root."; }
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
  log "Backup generated: $BACKUP_DIR/$(basename "$f").bak.*"
}

append_fstab_once() {
  local entry="$1"
  if ! grep -qsF "$entry" /etc/fstab; then
    echo "$entry" >> /etc/fstab
    log "fstab updated with: $entry"
  else
    log "fstab entry already present (idempotent)."
  fi
}

mount_if_needed() {
  local target="$1"
  if mountpoint -q "$target"; then
    log "Mount already active: $target"
  else
    log "Mounting: $target"
    mount "$target"
  fi
}

# Normalize any weird output (e.g., "├─/dev/sdb1") to a clean "/dev/sdb1"
normalize_devpath() {
  local raw="$1"
  echo "$raw" | grep -Eo '/dev/[a-zA-Z0-9/_.-]+' | head -n1
}

# =========================
# 🔍 Diagnostics & raw snapshots
# =========================
print_lsblk_snapshot() {
  log "lsblk snapshot (raw):"
  lsblk -rpo NAME,FSTYPE,LABEL,TYPE,SIZE | sed 's/^/[LSBLK] /'
}

# =========================
# 🔎 Auto-detection (no hard-coded /dev/sdX)
# =========================
detect_btrfs_partition() {
  lsblk -rpo NAME,FSTYPE,LABEL,TYPE | awk '$2=="btrfs" && $3=="docker-btrfs" && $4=="part"{print $1}' | head -n1
}

detect_zfs_member_partition() {
  lsblk -rpo NAME,FSTYPE,LABEL,TYPE | awk '$2=="zfs_member" && $3=="docker-zfs" && $4=="part"{print $1}' | head -n1
}

detect_overlay_lvm_pv() {
  # Preferences:
  # 1) PV free (no VG)
  # 2) PV in VG 'vg_docker'
  # 3) First LVM2_member found (fallback)
  local any_pv free_pv vg_pv
  any_pv=$(lsblk -rpo NAME,FSTYPE,TYPE | awk '$2=="LVM2_member" && $3=="part"{print $1}' | head -n1)

  if has_cmd pvs; then
    free_pv=$(pvs --noheadings -o pv_name,vg_name 2>/dev/null | awk '$2==""{print $1}' | head -n1)
    [[ -n "$free_pv" ]] && { echo "$free_pv"; return 0; }

    vg_pv=$(pvs --noheadings -o pv_name,vg_name 2>/dev/null | awk -v vg="$VG_NAME" '$2==vg{print $1}' | head -n1)
    [[ -n "$vg_pv" ]] && { echo "$vg_pv"; return 0; }
  fi

  [[ -n "$any_pv" ]] && { echo "$any_pv"; return 0; }
  return 1
}

# =========================
# 🎛️ Driver selection
# =========================
choose_driver() {
  echo "Select target storage driver:"
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
    btrfs)    BACKEND_DEVICE="$(detect_btrfs_partition || true)" ;;
    zfs)      BACKEND_DEVICE="$(detect_zfs_member_partition || true)" ;;
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
  BACKEND_MOUNT="$MOUNT_BASE/overlay2"
  ensure_dir "$BACKEND_MOUNT"

  # Determine current VG (if any)
  local current_vg=""
  current_vg=$(pvs --noheadings -o vg_name "$BACKEND_DEVICE" 2>/dev/null | xargs || true)

  if [[ -z "$current_vg" ]]; then
    # Free PV → ensure PV and create target VG
    if ! pvs "$BACKEND_DEVICE" &>/dev/null; then
      log "Initializing PV on $BACKEND_DEVICE…"
      pvcreate -ff -y "$BACKEND_DEVICE" >/dev/null
    else
      log "PV already initialized on $BACKEND_DEVICE."
    fi
    if ! vgdisplay "$VG_NAME" &>/dev/null; then
      log "Creating VG '$VG_NAME'…"
      vgcreate "$VG_NAME" "$BACKEND_DEVICE" >/dev/null
      current_vg="$VG_NAME"
    else
      log "VG '$VG_NAME' already exists."
      vgextend "$VG_NAME" "$BACKEND_DEVICE" >/dev/null || true
      current_vg="$VG_NAME"
    fi
  else
    # PV already in a VG → reuse that VG
    log "PV belongs to VG '$current_vg' (reusing)."
  fi

  # Create or reuse LV
  local lv_path="/dev/${current_vg}/${LV_NAME}"
  if ! lvdisplay "$lv_path" &>/dev/null; then
    log "Creating LV '$LV_NAME' in VG '$current_vg' (100%FREE)…"
    lvcreate -n "$LV_NAME" -l 100%FREE "$current_vg" >/dev/null
  else
    log "LV '$LV_NAME' already exists in VG '$current_vg'."
  fi

  # Format XFS with ftype=1 only if not already formatted
  if ! blkid "$lv_path" | grep -q 'TYPE="xfs"'; then
    log "Formatting $lv_path as XFS (ftype=1)…"
    mkfs.xfs -f -n ftype=1 "$lv_path" >/dev/null
  else
    log "LV already formatted as XFS."
  fi

  # Persist mount via fstab (UUID-based)
  local uuid; uuid=$(blkid -s UUID -o value "$lv_path")
  local entry="UUID=$uuid $BACKEND_MOUNT xfs defaults,pquota 0 2"
  append_fstab_once "$entry"
  mount_if_needed "$BACKEND_MOUNT"

  DATA_ROOT="$BACKEND_MOUNT/docker"
  ensure_dir "$DATA_ROOT"

  # Telemetry (useful for audits)
  log "LVM topology:"
  pvdisplay -C -o pv_name,vg_name,pv_size,pv_free --noheadings | sed 's/^/[LVM-PV] /' || true
  vgdisplay -C -o vg_name,vg_size,vg_free          --noheadings | sed 's/^/[LVM-VG] /' || true
  lvdisplay -C -o lv_name,vg_name,lv_size          --noheadings | sed 's/^/[LVM-LV] /' || true
}

provision_zfs() {
  install_pkg_if_missing zfsutils-linux || install_pkg_if_missing zfs
  BACKEND_MOUNT="$MOUNT_BASE/zfs"
  ensure_dir "$BACKEND_MOUNT"

  # Prefer pool name from LABEL if present; fallback to default
  local pool_label
  pool_label=$(lsblk -rpo NAME,LABEL | awk -v dev="$BACKEND_DEVICE" '$1==dev{print $2}')
  local pool="${pool_label:-$ZFS_POOL_DEFAULT}"
  local dataset="${pool}/${ZFS_DATASET_NAME}"

  if zpool list "$pool" &>/dev/null; then
    log "ZFS pool '$pool' already imported."
  else
    if zpool import | grep -q "^  pool: $pool"; then
      log "Importing existing ZFS pool '$pool'…"
      zpool import "$pool"
    else
      log "Creating ZFS pool '$pool' on $BACKEND_DEVICE…"
      zpool create -f -o ashift=12 "$pool" "$BACKEND_DEVICE"
    fi
  fi

  if ! zfs list "$dataset" &>/dev/null; then
    log "Creating dataset $dataset with mountpoint $BACKEND_MOUNT…"
    zfs create -o mountpoint="$BACKEND_MOUNT" "$dataset"
  else
    log "Dataset $dataset already exists."
    zfs set mountpoint="$BACKEND_MOUNT" "$dataset"
  fi

  DATA_ROOT="$BACKEND_MOUNT/docker"
  ensure_dir "$DATA_ROOT"
}

provision_btrfs() {
  install_pkg_if_missing btrfs-progs
  BACKEND_MOUNT="$MOUNT_BASE/btrfs"
  ensure_dir "$BACKEND_MOUNT"

  # Device is already Btrfs with label 'docker-btrfs' → no format
  local uuid; uuid=$(blkid -s UUID -o value "$BACKEND_DEVICE")
  local entry="UUID=$uuid $BACKEND_MOUNT btrfs defaults 0 0"
  append_fstab_once "$entry"
  mount_if_needed "$BACKEND_MOUNT"

  if ! btrfs subvolume list "$BACKEND_MOUNT" | grep -q "/docker"; then
    log "Creating Btrfs subvolume 'docker'…"
    btrfs subvolume create "$BACKEND_MOUNT/docker" >/dev/null
  else
    log "Btrfs subvolume 'docker' already exists."
  fi

  DATA_ROOT="$BACKEND_MOUNT/docker"
  ensure_dir "$DATA_ROOT"
}

# =========================
# 🐳 Docker configuration
# =========================
configure_docker_daemon() {
  [[ -n "$DATA_ROOT" ]] || abort "DATA_ROOT not set."
  [[ -n "$DRIVER"    ]] || abort "DRIVER not set."

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
  if has_cmd jq; then jq '.' "$DOCKER_DAEMON_JSON" || cat "$DOCKER_DAEMON_JSON"; else cat "$DOCKER_DAEMON_JSON"; fi
}

restart_docker() {
  log "Restarting Docker service…"
  systemctl daemon-reload || true
  systemctl enable --now "$SYSTEMD_DOCKER_UNIT"
  systemctl restart "$SYSTEMD_DOCKER_UNIT"
  sleep 2
  systemctl --no-pager --full status "$SYSTEMD_DOCKER_UNIT" | sed -n '1,10p' || true

  docker info >/dev/null 2>&1 || abort "Docker did not start properly. Check daemon logs."
  local eff; eff=$(docker info --format '{{.Driver}}')
  [[ "$eff" == "$DRIVER" ]] || abort "Effective driver ($eff) != configured ($DRIVER)."
  log "Docker is healthy and running with driver: $eff ✅"
}

# =========================
# 📦 5GB volume + test container
# =========================
create_5g_volume() {
  ensure_dir "$VOL_BASE"
  local vol_name="${VOLUME_NAME_PREFIX}-${DRIVER}"
  local vol_dir="$VOL_BASE/$vol_name"
  local img="$vol_dir.img"

  if [[ ! -f "$img" ]]; then
    log "Creating ${LOOP_VOL_SIZE_GB}GB image for volume ($img)…"
    ensure_dir "$VOL_BASE"
    fallocate -l "${LOOP_VOL_SIZE_GB}G" "$img" || dd if=/dev/zero of="$img" bs=1M count=$((LOOP_VOL_SIZE_GB*1024))
    mkfs.ext4 -F "$img" >/dev/null
  else
    log "Volume image already exists ($img)."
  fi

  local loopdev
  if ! losetup -j "$img" | grep -q "$img"; then
    loopdev=$(losetup --show -f "$img")
    log "Loop device attached: $loopdev"
  else
    loopdev=$(losetup -j "$img" | awk -F: '{print $1}')
    log "Loop device already attached: $loopdev"
  fi

  ensure_dir "$vol_dir"
  if ! mountpoint -q "$vol_dir"; then
    log "Mounting volume at $vol_dir…"
    mount -o loop "$img" "$vol_dir"
  else
    log "Volume mount already active: $vol_dir"
  fi

  if ! docker volume inspect "$vol_name" >/dev/null 2>&1; then
    log "Registering Docker volume '$vol_name' -> bind: $vol_dir"
    docker volume create \
      --driver local \
      -o type=none \
      -o o=bind \
      -o device="$vol_dir" \
      "$vol_name" >/dev/null
  else
    log "Docker volume '$vol_name' already exists."
  fi

  VOLUME_NAME="$vol_name"
  VOLUME_PATH="$vol_dir"
}

run_test_container() {
  local ctr_name="${CONTAINER_NAME_PREFIX}-${DRIVER}"
  docker rm -f "$ctr_name" >/dev/null 2>&1 || true

  log "Launching test container ($ctr_name) using volume '$VOLUME_NAME' @ /data…"
  docker run -d --name "$ctr_name" -v "$VOLUME_NAME":/data alpine:3.20 sh -c "echo 'hello from ${DRIVER}' > /data/driver.txt && sleep 1d" >/dev/null

  CONTAINER_NAME="$ctr_name"
}

# =========================
# 📊 Operational Summary (visual model)
# =========================
show_summary() {
  echo
  echo "============================= 📊 Docker Storage Summary ============================="
  echo "🧩 Selected Driver ............: $DRIVER"
  echo "💽 Backend Device ..............: ${BACKEND_DEVICE:-n/a}"
  echo "📂 Backend Mount ...............: ${BACKEND_MOUNT:-n/a}"
  echo "📦 Docker Data-Root ............: $(docker info --format '{{.DockerRootDir}}')"
  echo "🧠 Effective Driver (docker) ...: $(docker info --format '{{.Driver}}')"
  echo "-------------------------------------------------------------------------------------"
  echo "🗄️  Data-Root Filesystem Usage:"
  df -h "$(docker info --format '{{.DockerRootDir}}')" || true
  echo "-------------------------------------------------------------------------------------"
  echo "🧱 Volume (5GB loop-backed) ....: ${VOLUME_NAME:-n/a}"
  echo "📁 Volume Mountpoint ...........: ${VOLUME_PATH:-n/a}"
  if [[ -n "${VOLUME_PATH:-}" ]]; then df -h "$VOLUME_PATH" || true; fi
  echo "-------------------------------------------------------------------------------------"
  echo "🐳 Test Container ..............: ${CONTAINER_NAME:-n/a}"
  docker ps --filter "name=${CONTAINER_NAME:-}" --format "table {{.Names}}\t{{.Status}}\t{{.Mounts}}"
  echo "====================================================================================="
}

# =========================
# 🚀 Main
# =========================
main() {
  require_root
  has_cmd docker || abort "Docker Engine not found. Please install Docker before proceeding."

  install_pkg_if_missing util-linux jq   # baseline for detection/logs

  choose_driver
  [[ "$DRIVER" == "overlay2" ]] && install_pkg_if_missing lvm2  # ensure pvs/vgdisplay exist

  autodetect_device_for_driver

  case "$DRIVER" in
    overlay2) provision_overlay2 ;;
    zfs)      provision_zfs ;;
    btrfs)    provision_btrfs ;;
    *) abort "Unsupported driver." ;;
  esac

  configure_docker_daemon
  restart_docker
  create_5g_volume
  run_test_container
  show_summary

  log "End-to-end provisioning completed successfully ✅"
}

main "$@"
