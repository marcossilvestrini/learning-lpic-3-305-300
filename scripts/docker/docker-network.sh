#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: docker-network-lab.sh
    🔒 Requirements: root privileges; Docker Engine; iproute2; jq (optional)
    📚 Description: Interactive lab for Docker networking:
      - Create/select a Docker network by driver (bridge, overlay, macvlan, host, none)
      - Deploy test containers on the chosen network (HTTP server + client)
      - Validate container-to-container connectivity (ping, HTTP over 8080)
      - Provide a clear operational summary and cleanup options
    🎯 Scope:
      - bridge: user-defined bridge (embedded DNS, name-based reachability)
      - overlay: single-node Swarm overlay (requires `docker swarm init`)
      - macvlan: L2 segment attached to parent NIC (needs subnet/gateway/parent)
      - host: uses host network namespace (no container DNS names; uses 127.0.0.1)
      - none: isolated namespace (sem conectividade)
    👤 Author: Marcos Silvestrini
    📅 Date: 08/10/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

# =========================
# 📦 Global configuration
# =========================
LOG_PREFIX="[NetLab]"
DOCKER_IMAGE_SRV="busybox:1.36"   # httpd via busybox
DOCKER_IMAGE_CLI="busybox:1.36"   # wget/ping via busybox

# Runtime state
NET_DRIVER=""
NET_NAME=""
NET_ID=""
SRV_CTR=""
CLI_CTR=""
TEST_HTTP_STATUS=""
TEST_PING_STATUS=""
TEST_NOTES=""

# Suggested defaults
BRIDGE_NET_NAME_DEFAULT="labnet-bridge"
BRIDGE_SUBNET_DEFAULT="172.28.0.0/16"
BRIDGE_GATEWAY_DEFAULT="172.28.0.1"

OVERLAY_NET_NAME_DEFAULT="labnet-overlay"

MACVLAN_NET_NAME_DEFAULT="labnet-macvlan"
MACVLAN_SUBNET_DEFAULT=""  # detect/prompt
MACVLAN_GATEWAY_DEFAULT="" # detect/prompt
MACVLAN_PARENT_DEFAULT=""  # detect/prompt

# =========================
# 🗒️ Logging & helpers
# =========================
log()   { echo -e "[INFO]  📌 $LOG_PREFIX $*"; }
warn()  { echo -e "[WARN]  ⚠️  $LOG_PREFIX $*" >&2; }
error() { echo -e "[ERROR] ❌ $LOG_PREFIX $*" >&2; }
abort() { error "$*"; exit 1; }

require_root()   { [[ "$EUID" -eq 0 ]] || abort "Run as root (sudo)."; }
require_docker() { command -v docker &>/dev/null || abort "Docker CLI not found."; }
has_cmd()        { command -v "$1" &>/dev/null; }

json_print() {
  if has_cmd jq; then jq -r '.'; else cat; fi
}

# =========================
# 🔍 Environment diagnostics
# =========================
show_base_info() {
  log "Docker: $(docker version --format '{{.Server.Version}}' 2>/dev/null || echo n/a)"
  log "Networks available (short):"
  docker network ls --format 'table {{.ID}}\t{{.Name}}\t{{.Driver}}'
}

# =========================
# 🎛️ Driver selection
# =========================
choose_driver() {
  echo "Select Docker network driver:"
  echo "1) bridge   (user-defined bridge)"
  echo "2) overlay  (single-node Swarm overlay)"
  echo "3) macvlan  (advanced, needs parent/subnet/gateway)"
  echo "4) host     (use default host network)"
  echo "5) none     (use default none network)"
  read -rp "Option [1-5]: " opt
  case "${opt:-1}" in
    1) NET_DRIVER="bridge" ;;
    2) NET_DRIVER="overlay" ;;
    3) NET_DRIVER="macvlan" ;;
    4) NET_DRIVER="host" ;;
    5) NET_DRIVER="none" ;;
    *) NET_DRIVER="bridge" ;;
  esac
  log "Selected network driver: $NET_DRIVER"
}

# =========================
# 🧠 Auto-detect helpers (macvlan)
# =========================
detect_default_iface() {
  ip route show default 2>/dev/null | awk 'NR==1{print $5}'
}
detect_iface_cidr() {
  local dev="$1"
  ip -o -f inet addr show "$dev" 2>/dev/null | awk '{print $4}' | head -n1   # e.g., 192.168.1.10/24
}
cidr_to_subnet() {
  # Input: CIDR (e.g., 192.168.1.10/24) -> Output: 192.168.1.0/24
  local cidr="$1"
  python3 - "$cidr" <<'PY' 2>/dev/null || true
import sys, ipaddress
cidr=sys.argv[1]
try:
    net=str(ipaddress.ip_network(cidr, strict=False))
    print(net)
except Exception:
    pass
PY
}
gateway_guess_from_cidr() {
  # Guess .1 as gateway from /24; otherwise leave blank
  local cidr="$1"
  python3 - "$cidr" <<'PY' 2>/dev/null || true
import sys, ipaddress
try:
    net=ipaddress.ip_network(sys.argv[1], strict=False)
    gw=list(net.hosts())[0] if net.num_addresses>=4 else None
    print(gw if gw else "")
except Exception:
    pass
PY
}

# =========================
# 🕸️ Network creation
# =========================
create_network_bridge() {
  read -rp "Bridge network name [${BRIDGE_NET_NAME_DEFAULT}]: " nn; nn="${nn:-$BRIDGE_NET_NAME_DEFAULT}"
  read -rp "Subnet (CIDR) [${BRIDGE_SUBNET_DEFAULT}]: " sn; sn="${sn:-$BRIDGE_SUBNET_DEFAULT}"
  read -rp "Gateway [${BRIDGE_GATEWAY_DEFAULT}]: " gw; gw="${gw:-$BRIDGE_GATEWAY_DEFAULT}"

  NET_NAME="$nn"
  if docker network inspect "$NET_NAME" >/dev/null 2>&1; then
    log "Network '$NET_NAME' already exists."
  else
    log "Creating bridge network '$NET_NAME'…"
    docker network create \
      --driver bridge \
      --subnet "$sn" \
      --gateway "$gw" \
      "$NET_NAME" >/dev/null
  fi
  NET_ID=$(docker network inspect -f '{{.Id}}' "$NET_NAME")
}

init_swarm_if_needed() {
  if docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null | grep -qi 'inactive'; then
    log "Initializing single-node Swarm…"
    docker swarm init >/dev/null || warn "Swarm init skipped (already active?)."
  else
    log "Swarm already active."
  fi
}

create_network_overlay() {
  read -rp "Overlay network name [${OVERLAY_NET_NAME_DEFAULT}]: " nn; nn="${nn:-$OVERLAY_NET_NAME_DEFAULT}"
  NET_NAME="$nn"

  init_swarm_if_needed

  if docker network inspect "$NET_NAME" >/dev/null 2>&1; then
    log "Network '$NET_NAME' already exists."
  else
    log "Creating overlay network '$NET_NAME'…"
    docker network create \
      --driver overlay \
      --attachable \
      "$NET_NAME" >/dev/null
  fi
  NET_ID=$(docker network inspect -f '{{.Id}}' "$NET_NAME")
}

create_network_macvlan() {
  local parent="${MACVLAN_PARENT_DEFAULT}"
  local cidr="" subnet="" gateway=""

  # Try auto-detect
  parent="${parent:-$(detect_default_iface || true)}"
  cidr="$(detect_iface_cidr "$parent" || true)"

  if [[ -n "$cidr" ]]; then
    subnet="$(cidr_to_subnet "$cidr" || true)"
    gateway="$(gateway_guess_from_cidr "$cidr" || true)"
  fi

  read -rp "Macvlan network name [${MACVLAN_NET_NAME_DEFAULT}]: " nn; nn="${nn:-$MACVLAN_NET_NAME_DEFAULT}"
  read -rp "Parent interface [${parent:-eth0}]: " pr; pr="${pr:-${parent:-eth0}}"
  read -rp "Subnet (CIDR, e.g., 192.168.1.0/24) [${subnet:-}]: " sn; sn="${sn:-$subnet}"
  read -rp "Gateway (e.g., 192.168.1.1) [${gateway:-}]: " gw; gw="${gw:-$gateway}"

  [[ -n "$sn" && -n "$gw" && -n "$pr" ]] || abort "macvlan requires parent, subnet and gateway."

  NET_NAME="$nn"
  if docker network inspect "$NET_NAME" >/dev/null 2>&1; then
    log "Network '$NET_NAME' already exists."
  else
    log "Creating macvlan network '$NET_NAME' (parent=$pr)…"
    docker network create \
      -d macvlan \
      --subnet "$sn" \
      --gateway "$gw" \
      -o parent="$pr" \
      "$NET_NAME" >/dev/null
  fi
  NET_ID=$(docker network inspect -f '{{.Id}}' "$NET_NAME")
}

use_builtin_network() {
  # For host/none we use built-ins
  NET_NAME="$1"
  if ! docker network inspect "$NET_NAME" >/dev/null 2>&1; then
    abort "Built-in network '$NET_NAME' not found."
  fi
  NET_ID=$(docker network inspect -f '{{.Id}}' "$NET_NAME")
  log "Using built-in network: $NET_NAME"
}

create_network() {
  case "$NET_DRIVER" in
    bridge)  create_network_bridge ;;
    overlay) create_network_overlay ;;
    macvlan) create_network_macvlan ;;
    host)    use_builtin_network "host" ;;
    none)    use_builtin_network "none" ;;
    *) abort "Unsupported driver." ;;
  esac
  log "Network ready: $NET_NAME ($NET_ID)"
}

# =========================
# 🐳 Workload deployment
# =========================
deploy_test_stack() {
  # Names depend on driver to avoid collisions
  SRV_CTR="netlab-srv-${NET_DRIVER}"
  CLI_CTR="netlab-cli-${NET_DRIVER}"

  # Clean old
  docker rm -f "$SRV_CTR" "$CLI_CTR" >/dev/null 2>&1 || true

  case "$NET_DRIVER" in
    host)
      # Server binds to host:8080; client uses 127.0.0.1
      log "Launching server on host network (port 8080)…"
      docker run -d --name "$SRV_CTR" --network host "$DOCKER_IMAGE_SRV" \
        sh -c "mkdir -p /www; echo 'OK from $SRV_CTR ($NET_DRIVER)' > /www/index.html; busybox httpd -f -p 8080 -h /www" >/dev/null

      log "Launching client on host network…"
      docker run -d --name "$CLI_CTR" --network host "$DOCKER_IMAGE_CLI" sh -c "sleep 1d" >/dev/null
      ;;

    none)
      # Isolated: server still runs httpd, but client has no route
      log "Launching server on 'none' network…"
      docker run -d --name "$SRV_CTR" --network none "$DOCKER_IMAGE_SRV" \
        sh -c "mkdir -p /www; echo 'OK from $SRV_CTR ($NET_DRIVER)' > /www/index.html; busybox httpd -f -p 8080 -h /www" >/dev/null

      log "Launching client on 'none' network…"
      docker run -d --name "$CLI_CTR" --network none "$DOCKER_IMAGE_CLI" sh -c "sleep 1d" >/dev/null
      ;;

    *)
      # bridge / overlay / macvlan: attach both to $NET_NAME
      log "Launching server on network '$NET_NAME'…"
      docker run -d --name "$SRV_CTR" --network "$NET_NAME" "$DOCKER_IMAGE_SRV" \
        sh -c "mkdir -p /www; echo 'OK from $SRV_CTR ($NET_DRIVER)' > /www/index.html; busybox httpd -f -p 8080 -h /www" >/dev/null

      log "Launching client on network '$NET_NAME'…"
      docker run -d --name "$CLI_CTR" --network "$NET_NAME" "$DOCKER_IMAGE_CLI" sh -c "sleep 1d" >/dev/null
      ;;
  esac

  log "Server: $SRV_CTR | Client: $CLI_CTR"
}

# =========================
# 🔬 Connectivity tests
# =========================
run_tests() {
  TEST_HTTP_STATUS="N/A"
  TEST_PING_STATUS="N/A"
  TEST_NOTES=""

  case "$NET_DRIVER" in
    host)
      # Both share host namespace; use 127.0.0.1
      log "Testing HTTP from client to server via 127.0.0.1:8080 (host network)…"
      if docker exec "$CLI_CTR" sh -lc "wget -qO- http://127.0.0.1:8080 | grep -q 'OK from $SRV_CTR'"; then
        TEST_HTTP_STATUS="OK"
      else
        TEST_HTTP_STATUS="FAIL"
      fi
      TEST_PING_STATUS="N/A"
      TEST_NOTES="Host network: no container name DNS; using 127.0.0.1."
      ;;

    none)
      # No connectivity by design; assert failure
      log "Asserting isolation on 'none' network (HTTP should fail)…"
      if docker exec "$CLI_CTR" sh -lc "wget -qO- http://$SRV_CTR:8080" ; then
        TEST_HTTP_STATUS="UNEXPECTED SUCCESS"
      else
        TEST_HTTP_STATUS="EXPECTED FAIL"
      fi
      if docker exec "$CLI_CTR" sh -lc "ping -c1 -W1 $SRV_CTR" ; then
        TEST_PING_STATUS="UNEXPECTED SUCCESS"
      else
        TEST_PING_STATUS="EXPECTED FAIL"
      fi
      TEST_NOTES="None network: isolated namespace, no L3 connectivity."
      ;;

    *)
      # bridge/overlay/macvlan: DNS name should resolve; ping + HTTP via name
      log "Pinging server by name from client…"
      if docker exec "$CLI_CTR" sh -lc "ping -c1 -W2 $SRV_CTR >/dev/null"; then
        TEST_PING_STATUS="OK"
      else
        TEST_PING_STATUS="FAIL"
      fi

      log "Fetching HTTP from client to 'http://$SRV_CTR:8080'…"
      if docker exec "$CLI_CTR" sh -lc "wget -qO- http://$SRV_CTR:8080 | grep -q 'OK from $SRV_CTR'"; then
        TEST_HTTP_STATUS="OK"
      else
        TEST_HTTP_STATUS="FAIL"
      fi
      TEST_NOTES="Name-based reachability via embedded DNS on user-defined networks."
      ;;
  esac

  log "Tests => PING: $TEST_PING_STATUS | HTTP: $TEST_HTTP_STATUS"
}

# =========================
# 🧹 Teardown / Cleanup
# =========================
teardown_lab() {
  log "Removing test containers…"
  docker rm -f "$SRV_CTR" "$CLI_CTR" >/dev/null 2>&1 || true

  # Remoção genérica de QUALQUER contêiner do NetLab (independente do driver usado)
  log "Removing any NetLab containers (netlab-srv-*, netlab-cli-*)…"
  ids=$(docker ps -a --format '{{.ID}} {{.Names}}' | awk '$2 ~ /^netlab-(srv|cli)-(bridge|overlay|host|macvlan)$/ {print $1}')
  if [[ -n "${ids:-}" ]]; then
    docker rm -f $ids >/dev/null 2>&1 || true
  else
    log "No NetLab containers to remove."
  fi

  # Networks criadas pelo lab
  log "Removing lab networks (labnet-bridge, labnet-overlay, labnet-macvlan)…"
  for n in labnet-bridge labnet-overlay labnet-macvlan; do
    if docker network inspect "$n" >/dev/null 2>&1; then
      docker network rm "$n" >/dev/null 2>&1 || warn "Network removal skipped for $n."
    fi
  done

  # Overlay: oferta para sair do Swarm
  if docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null | grep -qi 'active'; then
    if docker network ls --format '{{.Name}}' | grep -q '^labnet-overlay$'; then
      read -rp "Leave Swarm on this node? [y/N]: " LS
      if [[ "$LS" =~ ^[Yy]$ ]]; then
        log "Leaving Swarm…"
        docker swarm leave --force >/dev/null 2>&1 || warn "Swarm leave skipped."
      fi
    fi
  fi

  log "Cleanup finished."
}


# =========================
# 📊 Summary
# =========================
show_summary() {
  echo
  echo "============================= 📊 Docker Network Lab Summary ============================="
  echo "🌐 Driver .......................: ${NET_DRIVER:-n/a}"
  echo "🕸️  Network Name ................: ${NET_NAME:-n/a}"
  echo "🆔 Network ID ...................: ${NET_ID:-n/a}"
  echo "-----------------------------------------------------------------------------------------"
  if [[ -n "${NET_NAME:-}" ]] && docker network inspect "$NET_NAME" >/dev/null 2>&1; then
    docker network inspect "$NET_NAME" | json_print
  else
    echo "ℹ️  Using built-in network ($NET_DRIVER)."
  fi
  echo "-----------------------------------------------------------------------------------------"
  echo "🐳 Server Container .............: ${SRV_CTR:-n/a}"
  echo "🐚 Client Container .............: ${CLI_CTR:-n/a}"
  echo "📶 Ping (client→server) .........: ${TEST_PING_STATUS:-n/a}"
  echo "🌐 HTTP (client→server:8080) ....: ${TEST_HTTP_STATUS:-n/a}"
  echo "📝 Notes ........................: ${TEST_NOTES:-}"
  echo "========================================================================================="
}

# =========================
# 🧭 Menu
# =========================
main_menu() {
  clear
  echo "============================================"
  echo "        🐳 Docker Network Unified Lab"
  echo "             By Silvestrini - 2025"
  echo "============================================"
  echo "Current context:"
  echo " - Driver:    ${NET_DRIVER:-<not set>}"
  echo " - Network:   ${NET_NAME:-<not set>}"
  echo " - Server:    ${SRV_CTR:-<none>}"
  echo " - Client:    ${CLI_CTR:-<none>}"
  echo "============================================"
  echo "Choose an action:"
  echo "1) Select driver & create/select network"
  echo "2) Deploy test containers (server/client)"
  echo "3) Run connectivity tests"
  echo "4) Show Summary"
  echo "9) Teardown / Cleanup"
  echo "0) Exit"
  echo "============================================"
}

# =========================
# 🚀 Entry point
# =========================
main() {
  require_root
  require_docker
  show_base_info

  while true; do
    main_menu
    read -rp "Enter your choice [0,1,2,3,4,9]: " CH
    case "$CH" in
      1)
        choose_driver
        create_network
        ;;
      2)
        [[ -n "${NET_DRIVER:-}" ]] || abort "Select a driver/network first (option 1)."
        deploy_test_stack
        ;;
      3)
        [[ -n "${SRV_CTR:-}" && -n "${CLI_CTR:-}" ]] || abort "Deploy the test containers first (option 2)."
        run_tests
        ;;
      4)
        show_summary
        ;;
      9)
        teardown_lab
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
