#!/usr/bin/env bash
: <<'MULTILINE-COMMENT'
🧭 Script Name: swarm-join-worker.sh
🔒 Requirements: root privileges; Docker Engine
📚 Description:
  - Reads configs/docker/swarm-configs
  - Detects worker advertise IP (192.168.0.x)
  - Executes docker swarm join as worker
  - Idempotent if node already in a swarm
👤 Author: Marcos Silvestrini
📅 Date: 14/10/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

log()   { echo -e "[INFO]  📌 $*"; }
warn()  { echo -e "[WARN]  ⚠️  $*" >&2; }
error() { echo -e "[ERROR] ❌ $*" >&2; }
abort() { error "$*"; exit 1; }

require_root() { [[ $EUID -eq 0 ]] || abort "Run as root (sudo)."; }
has_cmd()      { command -v "$1" &>/dev/null; }

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="/home/vagrant"
[[ -d "$BASE_DIR" ]] || BASE_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
CONF_DIR="$BASE_DIR/configs/docker"
CONF_FILE="$CONF_DIR/swarm-configs"

detect_advertise_ip() {
  local ip
  ip="$(ip -4 -o addr show scope global | awk '$4 ~ /^192\.168\.0\./ {print $2" "$4}' \
      | head -n1 | awk '{print $2}' | cut -d/ -f1)"
  [[ -n "${ip:-}" ]] || abort "No IPv4 in 192.168.0.0/24 found. Check your Vagrant private network."
  echo "$ip"
}

swarm_state() { docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null || echo "unknown"; }

load_contract() {
  [[ -f "$CONF_FILE" ]] || abort "Contract not found: $CONF_FILE. Run the manager script first."
  # shellcheck disable=SC1090
  source "$CONF_FILE"
  [[ -n "${SWARM_MANAGER_IP:-}" && -n "${SWARM_WORKER_TOKEN:-}" ]] \
    || abort "Invalid contract file: missing SWARM_MANAGER_IP or SWARM_WORKER_TOKEN."
}

join_worker() {
  local adv_ip="$1"
  log "Joining swarm as worker (advertise-addr=${adv_ip})..."
  docker swarm join \
    --token "$SWARM_WORKER_TOKEN" \
    --advertise-addr "$adv_ip" \
    "${SWARM_MANAGER_IP}:${SWARM_MANAGER_PORT:-2377}"
  log "Worker successfully joined."
}

summary() {
  echo
  echo "==================== Swarm Worker Summary ====================="
  docker info --format 'Swarm: {{.Swarm.LocalNodeState}}, NodeID: {{.Swarm.NodeID}}'
  echo "==============================================================="
}

main() {
  require_root
  has_cmd docker || abort "Docker Engine not found."

  local state; state="$(swarm_state)"
  if [[ "$state" == "active" ]]; then
    warn "Node is already part of a Swarm; skipping join."
    summary
    exit 0
  fi

  load_contract
  local ip; ip="$(detect_advertise_ip)"
  join_worker "$ip"
  summary
}

main "$@"
