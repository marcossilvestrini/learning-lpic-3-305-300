#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: docker-volumes-lab.sh
    🔒 Requirements: root privileges; Docker Engine; jq (optional, for pretty JSON)
    📚 Description: Interactive lab to validate Docker storage mechanisms:
      - Named Volume (local driver)
      - Bind Mount (host directory bind)
      - Tmpfs Mount (in-memory)
      - Each scenario creates and validates a live container with mounted data
      - Provides a detailed operational summary
    🎯 Scope:
      - volume: docker-managed persistent storage
      - bind: host directory bind mount
      - tmpfs: in-memory ephemeral mount
    ⚙️ Idempotency: Safe re-runs; containers are recreated, resources reused
    🧯 Teardown: remove lab containers; optional cleanup of volumes and bind dirs
    👤 Author: Marcos Silvestrini
    📅 Date: 07/10/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

# =========================
# 📦 Global configuration
# =========================
LAB_BASE="/srv/docker-volumes-lab"
STATE_DIR="/var/run/docker-volumes-lab"
LOG_PREFIX="[VolumesLab]"
DOCKER_IMAGE="alpine:3.20"

# Default resource names
VOLUME_NAME="${VOLUME_NAME:-labvol-default}"
BIND_DIR_DEFAULT="${LAB_BASE}/bind1"
TMPFS_SIZE_DEFAULT="${TMPFS_SIZE:-64m}"

# Containers per scenario
CTR_VOLUME="labctr-volume"
CTR_BIND="labctr-bind"
CTR_TMPFS="labctr-tmpfs"

# =========================
# 🗒️ Logging & helpers
# =========================
log()   { echo -e "[INFO]  📌 $LOG_PREFIX $*"; }
warn()  { echo -e "[WARN]  ⚠️  $LOG_PREFIX $*" >&2; }
error() { echo -e "[ERROR] ❌ $LOG_PREFIX $*" >&2; }
abort() { error "$*"; exit 1; }

require_root() {
  if [[ "$EUID" -ne 0 ]]; then
    echo -e "[ERROR] ❌ This script must be run as root (sudo)."
    exit 1
  fi
}

require_docker() {
  command -v docker &>/dev/null || abort "Docker CLI not found. Please install Docker first."
}

ensure_dir()     { mkdir -p "$1"; }
exists_container(){ docker ps -a --format '{{.Names}}' | grep -qx "$1"; }
running_container(){ docker ps --format '{{.Names}}' | grep -qx "$1"; }

json_print() {
  if command -v jq &>/dev/null; then jq -r '.'; else cat; fi
}

# Cleanly (re)create a container name
recreate_container() {
  local name="$1"; shift
  docker rm -f "$name" >/dev/null 2>&1 || true
  docker run -d --name "$name" "$@" >/dev/null
}

# =========================
# 🧪 Volume scenario
# =========================
volume_create_and_test() {
  local vol_name="$1"
  log "Ensuring Docker volume exists: $vol_name …"
  if ! docker volume inspect "$vol_name" >/dev/null 2>&1; then
    docker volume create \
      --label "lab=volumes" \
      --label "scenario=volume" \
      "$vol_name" >/dev/null
    log "Volume created: $vol_name"
  else
    log "Volume already present: $vol_name (idempotent)"
  fi

  log "Launching validation container for volume: $CTR_VOLUME"
  recreate_container "$CTR_VOLUME" \
    -v "${vol_name}:/data" \
    "$DOCKER_IMAGE" \
    sh -c "echo $(date +%F_%T) ':: hello from volume' > /data/marker.txt && sleep 1d"

  log "Validating marker file inside container (volume)…"
  docker exec "$CTR_VOLUME" sh -lc 'ls -l /data && cat /data/marker.txt' || abort "Volume validation failed."
  log "Volume scenario OK ✅"
}

# =========================
# 🧪 Bind mount scenario
# =========================
bind_create_and_test() {
  local host_path="$1"
  ensure_dir "$host_path"
  chmod 0777 "$host_path" || true

  log "Launching validation container for bind: $CTR_BIND"
  recreate_container "$CTR_BIND" \
    -v "${host_path}:/data" \
    "$DOCKER_IMAGE" \
    sh -c "echo $(date +%F_%T) ':: hello from bind' > /data/marker.txt && sleep 1d"

  log "Validating marker file inside container (bind)…"
  docker exec "$CTR_BIND" sh -lc 'ls -l /data && cat /data/marker.txt' || abort "Bind validation failed."

  log "Host path content (bind):"
  ls -l "$host_path" || true
  log "Bind scenario OK ✅"
}

# =========================
# 🧪 Tmpfs scenario
# =========================
tmpfs_create_and_test() {
  local tmpfs_size="$1"
  log "Launching validation container for tmpfs: $CTR_TMPFS (size=${tmpfs_size})"
  recreate_container "$CTR_TMPFS" \
    --tmpfs "/data:rw,size=${tmpfs_size},noexec,nosuid,nodev" \
    "$DOCKER_IMAGE" \
    sh -c "echo $(date +%F_%T) ':: hello from tmpfs' > /data/marker.txt && sleep 1d"

  log "Validating tmpfs from inside container…"
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
      log "Removing empty bind directory: $host_path"
      rmdir "$host_path" || true
    else
      log "Bind directory not empty (kept): $host_path"
    fi
  fi
}

# =========================
# 📊 Summary
# =========================
show_summary() {
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
    echo "🔗 Consumers:"
    docker ps --filter "name=${CTR_VOLUME}" --format "table {{.Names}}\t{{.Status}}\t{{.Mounts}}"
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
    echo "🔎 Container mounts:"
    docker exec "$CTR_TMPFS" sh -lc 'mount | grep " on /data type tmpfs" || true'
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
  echo "==============================="
  echo "       Docker Volumes Lab"
  echo "      By Silvestrini - 2025"
  echo "==============================="
  echo "Current defaults:"
  echo " - Named Volume: $VOLUME_NAME"
  echo " - Bind HostDir: $BIND_DIR_DEFAULT"
  echo " - Tmpfs Size:   $TMPFS_SIZE_DEFAULT"
  echo "==============================="
  echo "Choose an action:"
  echo "1) Create & test Named Volume"
  echo "2) Create & test Bind Mount"
  echo "3) Create & test Tmpfs Mount"
  echo "4) Show Summary"
  echo "9) Teardown (remove lab containers)"
  echo "0) Exit"
  echo "==============================="
}

# =========================
# 🚀 Entry point
# =========================
main() {
  require_root
  require_docker

  ensure_dir "$LAB_BASE"
  ensure_dir "$STATE_DIR"

  while true; do
    main_menu
    read -rp "Enter your choice [0,1,2,3,4,9]: " CHOICE
    case "$CHOICE" in
      1)
        read -rp "Volume name [${VOLUME_NAME}]: " VN; VN="${VN:-$VOLUME_NAME}"
        VOLUME_NAME="$VN"
        volume_create_and_test "$VOLUME_NAME"
        ;;
      2)
        read -rp "Bind host directory [${BIND_DIR_DEFAULT}]: " BD; BD="${BD:-$BIND_DIR_DEFAULT}"
        bind_create_and_test "$BD"
        ;;
      3)
        read -rp "Tmpfs size (e.g., 64m) [${TMPFS_SIZE_DEFAULT}]: " TS; TS="${TS:-$TMPFS_SIZE_DEFAULT}"
        tmpfs_create_and_test "$TS"
        ;;
      4)
        show_summary
        ;;
      9)
        teardown_lab
        read -rp "Remove named volume '${VOLUME_NAME}' as well? [y/N]: " RMV
        if [[ "$RMV" =~ ^[Yy]$ ]]; then prune_volume "$VOLUME_NAME"; fi
        read -rp "Remove default bind dir '${BIND_DIR_DEFAULT}' if empty? [y/N]: " RMD
        if [[ "$RMD" =~ ^[Yy]$ ]]; then cleanup_bind_dir "$BIND_DIR_DEFAULT"; fi
        ;;
      0)
        echo "Bye!"
        exit 0
        ;;
      *)
        echo "Invalid option"
        ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
  done
}

main "$@"
