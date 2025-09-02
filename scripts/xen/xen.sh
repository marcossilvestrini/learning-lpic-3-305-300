#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: xen-lab.sh
    🔒 Requirements: root privileges, xl, qemu-img
    📚 Description: Simulate basic Xen operations:
      - Create and launch domain
      - Connect to console
      - Shutdown/Destroy domain
      - Teardown lab
    👤 Author: Marcos Silvestrini
    📅 Date: 07/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

LAB_DOMAIN="xen-lab"
LAB_IMG="/var/lib/xen/images/${LAB_DOMAIN}.qcow2"
LAB_CFG="/etc/xen/${LAB_DOMAIN}.cfg"
LAB_STATE="/tmp/xen-lab"

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

prepare_host() {
    install_if_missing xl xen-hypervisor-amd64
    install_if_missing qemu-img qemu-utils
    mkdir -p "$(dirname "$LAB_IMG")" "$LAB_STATE"
}

create_domain() {
    log "Creating disk image..."
    qemu-img create -f qcow2 "$LAB_IMG" 2G

    log "Generating Xen config file..."
    cat >"$LAB_CFG" <<CFG
kernel = "/boot/vmlinuz-$(uname -r)"
name = "$LAB_DOMAIN"
memory = 512
vcpus = 1
disk = ['file:$LAB_IMG,xvda,w']
root = "xvda1 ro"
extra = "console=hvc0"
vif = ['bridge=xenbr0']
CFG

    log "Launching domain $LAB_DOMAIN..."
    xl create "$LAB_CFG"
}

console_domain() {
    xl console "$LAB_DOMAIN"
}

shutdown_domain() {
    log "Shutting down domain..."
    xl shutdown "$LAB_DOMAIN" || warn "Domain not running"
}

destroy_domain() {
    log "Destroying domain..."
    xl destroy "$LAB_DOMAIN" || true
}

teardown_lab() {
    shutdown_domain
    destroy_domain
    rm -f "$LAB_IMG" "$LAB_CFG"
    log "Lab cleaned up."
}

lab_summary() {
    log "======= 📊 Xen Lab Summary ======="
    xl list || true
    log "=================================="
}

main_menu() {
    clear
    echo "==============================="
    echo "        Xen Simulator Lab"
    echo "      By Silvestrini - 2025"
    echo "==============================="
    echo "Domain: $LAB_DOMAIN"
    echo "==============================="
    echo "1. Prepare host"
    echo "2. Create & launch domain"
    echo "3. Console into domain"
    echo "4. Shutdown domain"
    echo "5. Destroy domain"
    echo "9. Teardown/Cleanup"
    echo "0. Exit"
    echo "==============================="
}

if [[ "$EUID" -ne 0 ]]; then abort "Run as root."; fi
prepare_host

while true; do
    main_menu
    read -rp "Enter your choice [0,1,2,3,4,5,9]: " CHOICE
    case "$CHOICE" in
        1) prepare_host ;;
        2) create_domain; lab_summary ;;
        3) console_domain ;;
        4) shutdown_domain; lab_summary ;;
        5) destroy_domain; lab_summary ;;
        9) teardown_lab ;;
        0) echo "Bye!"; exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
done
