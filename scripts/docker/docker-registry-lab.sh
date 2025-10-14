#!/usr/bin/env bash
: <<'MULTILINE-COMMENT'
🧱 Script Name: docker-registry-lab.sh
🔒 Requirements: root privileges; Docker Engine; curl
📚 Description:
  - Creates and manages a local Docker Registry (registry:2)
  - Demonstrates push/pull workflow using nginx:latest
  - Provides menu options for run, summary, and teardown
👤 Author: Marcos Silvestrini (Standardized)
📅 Date: 13/10/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

# =========================
# ⚙️ Global configuration
# =========================
REGISTRY_DATA_PATH="/var/lib/registry"
DOCKER_IMAGE="nginx:latest"

# Lab containers
REGISTRY_NAME="lab-registry-v2"
TEST_CTR_NAME="lab-nginx-from-registry"

# Registry network details
REGISTRY_PORT="5000"
REGISTRY_HOST="localhost:${REGISTRY_PORT}"
TARGET_IMAGE_NAME="${REGISTRY_HOST}/nginx-test:latest"

# =========================
# 🧩 Logging & helpers
# =========================
log()   { echo -e "[INFO]  $*"; }
warn()  { echo -e "[WARN]  ⚠️  $*" >&2; }
error() { echo -e "[ERROR] ❌ $*" >&2; }
abort() { error "$*"; exit 1; }
step()  { echo -e "\n[STEP] --- $* ---"; }

require_root() { [[ $EUID -eq 0 ]] || abort "Run as root (sudo)."; }
has_cmd() { command -v "$1" &>/dev/null; }

ensure_dir() {
  if [ ! -d "$1" ]; then
    log "Creating directory '$1'..."
    mkdir -p "$1"
  else
    log "Directory '$1' already exists."
  fi
}

cleanup_container() {
  if docker ps -a --format '{{.Names}}' | grep -qx "$1"; then
    log "Removing container '$1'..."
    docker rm -f "$1" >/dev/null
  fi
}

cleanup_image() {
  if docker image inspect "$1" &>/dev/null; then
    log "Removing image '$1'..."
    docker rmi -f "$1" >/dev/null
  fi
}

running_container() { docker ps --format '{{.Names}}' | grep -qx "$1"; }

free_up_port() {
  local port="$1"
  log "Checking if port $port is in use..."
  local cid
  cid=$(docker ps --filter "publish=${port}" -q)
  if [ -n "$cid" ]; then
    local cname
    cname=$(docker inspect --format='{{.Name}}' "$cid" | sed 's,^/,,')
    warn "Port $port is used by container '$cname' (ID: $cid)."
    log "Removing container '$cname' to free the port."
    docker rm -f "$cid" >/dev/null
  else
    log "Port $port is free."
  fi
}

# =========================
# 🚀 Registry Lab Workflow
# =========================
run_docker_registry_lab() {
  log "Starting Docker Registry (registry:2) lab..."
  step "Ensuring port $REGISTRY_PORT is free"
  free_up_port "$REGISTRY_PORT"

  cleanup_container "$REGISTRY_NAME"
  ensure_dir "$REGISTRY_DATA_PATH"

  step "Starting registry:2 on port $REGISTRY_PORT"
  docker run -d \
    -p "${REGISTRY_PORT}:5000" \
    --name "$REGISTRY_NAME" \
    -v "${REGISTRY_DATA_PATH}:/var/lib/registry" \
    registry:2

  log "Waiting for registry to initialize..."
  sleep 5

  running_container "$REGISTRY_NAME" || abort "Registry failed to start."

  perform_image_workflow
}

perform_image_workflow() {
  step "1. Pulling '$DOCKER_IMAGE' from Docker Hub"
  docker pull "$DOCKER_IMAGE"

  step "2. Tagging for local registry -> '$TARGET_IMAGE_NAME'"
  docker tag "$DOCKER_IMAGE" "$TARGET_IMAGE_NAME"

  step "3. Pushing to local registry"
  docker push "$TARGET_IMAGE_NAME"

  step "4. Removing local copies"
  cleanup_image "$DOCKER_IMAGE"
  cleanup_image "$TARGET_IMAGE_NAME"

  step "5. Pulling image back from registry"
  docker pull "$TARGET_IMAGE_NAME"

  step "6. Running test container from registry"
  cleanup_container "$TEST_CTR_NAME"
  docker run -d --name "$TEST_CTR_NAME" -p 8081:80 "$TARGET_IMAGE_NAME"
  sleep 3

  step "7. Validating HTTP endpoint"
  if curl -s --head http://localhost:8081 | head -n1 | grep -q "200 OK"; then
    log "✅ SUCCESS: Nginx page accessible at http://localhost:8081"
  else
    error "❌ FAIL: Could not access Nginx test page. Dumping logs..."
    docker logs "$TEST_CTR_NAME"
  fi

  show_lab_summary
}

# =========================
# 📊 Summary
# =========================
show_lab_summary() {
  echo
  echo "=============================================================="
  echo "              Docker Registry Lab Summary"
  echo "=============================================================="
  echo "[Registry Container]"
  if running_container "$REGISTRY_NAME"; then
    docker ps --filter "name=${REGISTRY_NAME}" --format "  {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
    echo
    echo "  [Catalog]"
    if has_cmd jq; then
      curl -s "http://${REGISTRY_HOST}/v2/_catalog" | jq
    else
      curl -s "http://${REGISTRY_HOST}/v2/_catalog"
    fi
  else
    echo "  Registry not running."
  fi
  echo "--------------------------------------------------------------"
  echo "[Test Container]"
  if running_container "$TEST_CTR_NAME"; then
    docker ps --filter "name=${TEST_CTR_NAME}" --format "  {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
  else
    echo "  Test container not running."
  fi
  echo "--------------------------------------------------------------"
  echo "[Images]"
  docker images | grep "nginx-test" || echo "  No nginx-test image found."
  echo "=============================================================="
}

# =========================
# 🧹 Teardown / Cleanup
# =========================
teardown_lab() {
  log "Removing lab containers..."
  cleanup_container "$REGISTRY_NAME"
  cleanup_container "$TEST_CTR_NAME"

  read -rp "Remove local registry image ($TARGET_IMAGE_NAME)? [y/N]: " rmi
  if [[ "$rmi" =~ ^[Yy]$ ]]; then
    cleanup_image "$TARGET_IMAGE_NAME"
  fi

  read -rp "Clear registry data at '$REGISTRY_DATA_PATH'? [y/N]: " rmd
  if [[ "$rmd" =~ ^[Yy]$ ]]; then
    if [ -d "$REGISTRY_DATA_PATH" ] && [ -n "$REGISTRY_DATA_PATH" ]; then
      rm -rf "${REGISTRY_DATA_PATH:?}"/*
      log "Registry data cleared."
    else
      warn "Invalid directory, skipping."
    fi
  fi
  log "Teardown complete."
}

# =========================
# 🧭 Menu
# =========================
main_menu() {
  clear
  echo "=============================================="
  echo "       Docker Registry Lab Script"
  echo "=============================================="
  echo " 1) Run Full Registry Lab"
  echo " 2) Show Lab Summary"
  echo ""
  echo " 9) Teardown Lab"
  echo " 0) Exit"
  echo "=============================================="
}

# =========================
# 🚀 Entry point
# =========================
main() {
  require_root
  has_cmd docker || abort "Docker not installed."
  has_cmd curl || abort "curl not installed."

  while true; do
    main_menu
    read -rp "Enter your choice [0,1,2,9]: " CHOICE
    case "$CHOICE" in
      1) run_docker_registry_lab ;;
      2) show_lab_summary ;;
      9) teardown_lab ;;
      0) log "Bye!"; exit 0 ;;
      *) warn "Invalid option. Try again." ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
  done
}

main "$@"
