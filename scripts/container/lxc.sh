#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: lxc-lab.sh
    🔒 Requirements: root privileges, lxc, curl
    📚 Description: Simulate basic LXC operations:
      - Create container
      - Start/Stop container
      - Exec shell inside
      - Teardown lab
    👤 Author: Marcos Silvestrini
    📅 Date: 07/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

LAB_CONTAINER="lxc-lab"
RELEASE=${RELEASE:-"3.19"}
DISTRO="images:alpine/$RELEASE"
LAB_STATE="/tmp/lxc-lab"

log()   { echo -e "[INFO] 📌 $*"; }
warn()  { echo -e "[WARN] ⚠️ $*" >&2; }
abort() { echo -e "[ERROR] ❌ $*" >&2; exit 1; }

install_if_missing() {
    local cmd="$1"
    local pkg="$2"
    if ! command -v "$cmd" &>/dev/null; then
        log "Installing missing dependency: $cmd"
        if command -v apt-get &>/dev/null; then
            apt-get update -qq && apt-get install -y -qq "$pkg"
        elif command -v dnf &>/dev/null; then
            dnf install -y "$pkg"
        elif command -v yum &>/dev/null; then
            yum install -y "$pkg"
        else
            abort "Unsupported package manager. Please install '$pkg' manually."
        fi
    fi
}

create_container() {
    log "Creating LXC container $LAB_CONTAINER ($DISTRO)..."
    lxc-create -n "$LAB_CONTAINER" -t download -- -d alpine -r "$RELEASE" -a amd64
}

start_container() {
    log "Starting LXC container $LAB_CONTAINER..."
    lxc-start -n "$LAB_CONTAINER"
    sleep 2
}

exec_shell() {
    log "Launching shell in $LAB_CONTAINER..."
    lxc-attach -n "$LAB_CONTAINER"
}

stop_container() {
    log "Stopping LXC container $LAB_CONTAINER..."
    lxc-stop -n "$LAB_CONTAINER" || true
}

teardown_lab() {
    log "Destroying LXC container $LAB_CONTAINER..."
    stop_container
    lxc-destroy -n "$LAB_CONTAINER" || true
    log "Lab cleaned up."
}

lab_summary() {
    log "======= 📊 LXC Lab Summary ======="
    lxc-ls -f
    log "=================================="
}

main_menu() {
    clear
    echo "==============================="
    echo "        LXC Simulator Lab"
    echo "      By Silvestrini - 2025"
    echo "==============================="
    echo "Choose an action:"
    echo "1. Create LXC container"
    echo "2. Start container"
    echo "3. Exec shell inside container"
    echo "4. Stop container"
    echo "9. Teardown/Cleanup"
    echo "0. Exit"
    echo "==============================="
}

if [[ "$EUID" -ne 0 ]]; then abort "Run as root."; fi
install_if_missing lxc lxc
mkdir -p "$LAB_STATE"

while true; do
    main_menu
    read -rp "Enter your choice [0,1,2,3,4,9]: " CHOICE
    case "$CHOICE" in
        1) create_container; lab_summary ;;
        2) start_container; lab_summary ;;
        3) exec_shell ;;
        4) stop_container; lab_summary ;;
        9) teardown_lab ;;
        0) echo "Bye!" && exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
done
