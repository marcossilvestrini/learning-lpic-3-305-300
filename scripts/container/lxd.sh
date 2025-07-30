#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    Script Name: lxd-lab.sh
    Requirements: root privileges, lxd, lxc, curl
    Description: Simulate basic LXD operations:
      - Launch container (Alpine)
      - Exec shell inside
      - Stop/Delete container
      - Teardown lab
    Author: Marcos Silvestrini + Linux Specialist AI
    Date: 01/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

LAB_CONTAINER="lxd-lab"
IMAGE="images:alpine/3.19"
LAB_STATE="/tmp/lxd-lab"


log()   { echo -e "[INFO] $*"; }
warn()  { echo -e "[WARN] $*" >&2; }
abort() { echo -e "[ERROR] $*" >&2; exit 1; }

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

init_lxd() {
    if ! pgrep lxd >/dev/null; then
        log "Initializing LXD..."
        lxd init --auto
    fi
}

launch_container() {
    log "Launching LXD container $LAB_CONTAINER ($IMAGE)..."
    lxc launch "$IMAGE" "$LAB_CONTAINER"
    sleep 3
}

exec_shell() {
    log "Launching shell in $LAB_CONTAINER..."
    lxc exec "$LAB_CONTAINER" -- /bin/sh
}

stop_container() {
    log "Stopping LXD container $LAB_CONTAINER..."
    lxc stop "$LAB_CONTAINER" || true
}

delete_container() {
    log "Deleting LXD container $LAB_CONTAINER..."
    lxc delete "$LAB_CONTAINER" || true
}

teardown_lab() {
    stop_container
    delete_container
    log "Lab cleaned up."
}

lab_summary() {
    log "======= 📊 LXD Lab Summary ======="
    lxc list
    log "=================================="
}

main_menu() {
    clear
    echo "==============================="
    echo "        LXD Simulator Lab"
    echo "      By Silvestrini - 2025"
    echo "==============================="
    echo "Choose an action:"
    echo "1. Launch LXD container"
    echo "2. Exec shell inside container"
    echo "3. Stop container"
    echo "4. Delete container"
    echo "9. Teardown/Cleanup"
    echo "0. Exit"
    echo "==============================="
}

if [[ "$EUID" -ne 0 ]]; then abort "Run as root."; fi
install_if_missing snap snapd

# Enable and start snap service
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap || true
# Install latest LXD from Snap
snap install lxd --channel=latest/stable
# Add user 'vagrant' to 'lxd' group
usermod -aG lxd vagrant

# Ensure lxd command is available
export PATH=$PATH:/snap/bin
# create lab state directory
mkdir -p "$LAB_STATE"

while true; do
    main_menu
    read -rp "Enter your choice [0,1,2,3,4,9]: " CHOICE
    case "$CHOICE" in
        1) launch_container; lab_summary ;;
        2) exec_shell ;;
        3) stop_container; lab_summary ;;
        4) delete_container; lab_summary ;;
        9) teardown_lab ;;
        0) echo "Bye!" && exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
done
