#!/usr/bin/env bash
: <<'MULTILINE-COMMENT'
🧭 Script Name: swarm-init-manager.sh
🔒 Requirements: root privileges; Docker Engine
📚 Description:
  - Detects manager advertise IP (192.168.0.x)
  - Initializes Docker Swarm (if not active)
  - Extracts join tokens (manager/worker)
  - Persists contract in configs/docker/swarm-configs
👤 Author: Marcos Silvestrini
📅 Date: 14/10/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

# ========= Logging
log()   { echo -e "[INFO]  📌 $*"; }
warn()  { echo -e "[WARN]  ⚠️  $*" >&2; }
error() { echo -e "[ERROR] ❌ $*" >&2; }
abort() { error "$*"; exit 1; }

require_root() { [[ $EUID -eq 0 ]] || abort "Run as root (sudo)."; }
has_cmd()      { command -v "$1" &>/dev/null; }

# ========= Paths (prefer /vagrant if existir)
SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="/home/vagrant"
[[ -d "$BASE_DIR" ]] || BASE_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
CONF_DIR="$BASE_DIR/configs/docker"
CONF_FILE="$CONF_DIR/swarm-configs"

ensure_dirs() { mkdir -p "$CONF_DIR"; }

# ========= Detect 192.168.0.x
detect_advertise_ip() {
  local ip
  ip="$(ip -4 -o addr show scope global | awk '$4 ~ /^192\.168\.0\./ {print $2" "$4}' \
      | head -n1 | awk '{print $2}' | cut -d/ -f1)"
  [[ -n "${ip:-}" ]] || abort "No IPv4 in 192.168.0.0/24 found. Check your Vagrant private network."
  echo "$ip"
}

# ========= Swarm ops
swarm_state() { docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null || echo "unknown"; }

init_swarm_if_needed() {
  local adv_ip="$1"
  local state; state="$(swarm_state)"
  if [[ "$state" == "active" ]]; then
    log "Swarm already active on this node (manager assumed)."
  else
    log "Initializing Swarm as manager (advertise-addr=${adv_ip})..."
    docker swarm init --advertise-addr "$adv_ip" >/dev/null
    log "Swarm initialized."
  fi
}

get_tokens() {
  docker swarm join-token -q manager
  docker swarm join-token -q worker
}

write_contract() {
  local adv_ip="$1" mtoken="$2" wtoken="$3"
  cat >"$CONF_FILE" <<EOF
# ===============================
# Docker Swarm Contract (auto)
# Generated: $(date -Is)
# ===============================
SWARM_MANAGER_IP="$adv_ip"
SWARM_MANAGER_PORT="2377"
SWARM_MANAGER_TOKEN="$mtoken"
SWARM_WORKER_TOKEN="$wtoken"

# Ready-to-use commands (for reference)
SWARM_MANAGER_JOIN_CMD="docker swarm join --token \$SWARM_MANAGER_TOKEN \$SWARM_MANAGER_IP:\$SWARM_MANAGER_PORT"
SWARM_WORKER_JOIN_CMD="docker swarm join --token \$SWARM_WORKER_TOKEN \$SWARM_MANAGER_IP:\$SWARM_MANAGER_PORT"
EOF
  chmod 0644 "$CONF_FILE"
  log "Contract written to: $CONF_FILE"
}

summary() {
  echo
  echo "==================== Swarm Manager Summary ===================="
  echo "Advertise IP ..........: ${1}"
  echo "Contract file .........: ${CONF_FILE}"
  echo "---------------------------------------------------------------"
  docker info --format 'Swarm: {{.Swarm.LocalNodeState}}, ControlAvailable: {{.Swarm.ControlAvailable}}'
  docker node ls 2>/dev/null || true
  echo "==============================================================="
}

main() {
  require_root
  has_cmd docker || abort "Docker Engine not found."

  ensure_dirs
  local ip; ip="$(detect_advertise_ip)"
  init_swarm_if_needed "$ip"

  # tokens
  local mtoken wtoken
  mtoken="$(docker swarm join-token -q manager)"
  wtoken="$(docker swarm join-token -q worker)"
  [[ -n "$mtoken" && -n "$wtoken" ]] || abort "Unable to obtain join tokens."

  write_contract "$ip" "$mtoken" "$wtoken"
  summary "$ip"
}

main "$@"
