#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: containerd-lab.sh
    🔒 Requirements: root privileges, containerd, ctr, curl
    📚 Description: Simulate basic containerd operations:
      - Pull image (busybox)
      - Create and run container
      - Exec shell inside
      - Stop/Remove container
      - Teardown lab
    👤 Author: Marcos Silvestrini + Linux Specialist AI
    📅 Date: 01/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

LAB_NS="labns"
CONTAINER_ID="busybox-lab"
IMAGE="docker.io/library/busybox:latest"
LAB_STATE="/tmp/containerd-lab"
LOG="$LAB_STATE/lab.log"

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

ensure_containerd_running() {
    if ! pgrep -x containerd >/dev/null; then
        log "Starting containerd service..."
        systemctl start containerd || containerd &
        sleep 2
    fi
}

pull_image() {
    log "Pulling image $IMAGE ..."
    ctr --namespace $LAB_NS images pull $IMAGE | tee -a $LOG
}

create_container() {
    log "Creating container $CONTAINER_ID ..."
    ctr --namespace $LAB_NS run -d  $IMAGE $CONTAINER_ID sleep 3600 | tee -a $LOG
}

exec_shell() {
    log "Launching shell in $CONTAINER_ID ..."
    ctr --namespace $LAB_NS tasks exec --exec-id "shell-$(date +%s)" -t $CONTAINER_ID /bin/sh
}

kill_container() {
    log "Killing container $CONTAINER_ID ..."
    ctr --namespace $LAB_NS t kill $CONTAINER_ID || true
    ctr --namespace $LAB_NS tasks rm -f $CONTAINER_ID || true
    ctr --namespace $LAB_NS containers rm $CONTAINER_ID || true
}

teardown_lab() {
    log "Teardown: removing container, namespace and temp files..."
    kill_container
    ctr --namespace $LAB_NS images rm $IMAGE || true
    rm -rf "$LAB_STATE"
    log "Lab cleaned up."
}

lab_summary() {
    log "======= 📊 Containerd Lab Summary ======="
    local status
    status=$(ctr --namespace $LAB_NS containers list || echo "No containers found")
    echo -e "[CONTAINERD CONTAINERS]\n$status"
    echo -e "[IMAGES]\n$(ctr --namespace $LAB_NS images list || echo 'No images')"
    log "========================================="
}

main_menu() {
    clear
    echo "==============================="
    echo "  containerd Simulator Lab"
    echo "   By Silvestrini - 2025"
    echo "==============================="
    echo "Choose an action:"
    echo "1. Pull busybox image"
    echo "2. Create & Run BusyBox container"
    echo "3. Exec shell inside container"
    echo "4. Kill and remove container"
    echo "9. Teardown/Cleanup Temporary Files"
    echo "0. Exit"
    echo "==============================="
}

if [[ "$EUID" -ne 0 ]]; then abort "Run as root."; fi
install_if_missing ctr containerd
ensure_containerd_running
mkdir -p "$LAB_STATE"

while true; do
    main_menu
    read -rp "Enter your choice [0,1,2,3,4,9]: " CHOICE
    case "$CHOICE" in
        1) pull_image; lab_summary ;;
        2) create_container; lab_summary ;;
        3) exec_shell ;;
        4) kill_container; lab_summary ;;
        9) teardown_lab ;;
        0) echo "Bye!" && exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
done
