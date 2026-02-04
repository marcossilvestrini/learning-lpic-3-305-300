#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: lxd-lab.sh
    🔒 Requirements: root privileges, lxd, lxc, curl
    📚 Description: Simulate basic LXD operations:
      - Launch container (Alpine)
      - Exec shell inside
      - Stop/Delete container
      - Teardown lab
    👤 Author: Marcos Silvestrini
    📅 Date: 01/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

LAB_INSTANCE="lxd-lab"
LAB_STATE="/tmp/lxd-lab"
INSTANCE_TYPE="container" # or "vm"
IMAGE="images:alpine/3.19"


# Imagens separadas por tipo
declare -A CONTAINER_IMAGES=(
    [1]="images:alpine/3.19"
    [2]="images:debian/13"
    [3]="images:rockylinux/9"
    [4]="images:opensuse/15.6"
)
declare -A CONTAINER_NAMES=(
    [1]="Alpine 3.19"
    [2]="Debian 13"
    [3]="Rocky Linux 9"
    [4]="OpenSUSE 15.6"
)

# VMs: distros principais
declare -A VM_IMAGES=(
    [1]="images:debian/13/cloud"
    [2]="images:opensuse/15.6"
    [3]="images:rockylinux/9/cloud"
    [4]="images:almalinux/9/cloud"    
)
declare -A VM_NAMES=(
    [1]="Debian 13 (cloud)"
    [2]="OpenSUSE 15.6 (cloud)"
    [3]="Rocky Linux 9 (cloud)"
    [4]="AlmaLinux 9 (cloud)"    
)


log()   { echo -e "[INFO] 📌 $*"; }
warn()  { echo -e "[WARN] ⚠️ $*" >&2; }
abort() { echo -e "[ERROR] ❌ $*" >&2; exit 1; }

wait_instance_ready() {
    local timeout=60
    local waited=0
    while true; do
        state=$(lxc info "$LAB_INSTANCE" 2>/dev/null | awk -F': ' '/^Status:/ {print $2}')
        if [[ "$state" == "RUNNING" ]]; then
            break
        fi
        sleep 2
        waited=$((waited+2))
        if (( waited >= timeout )); then
            warn "Instância não ficou pronta após $timeout segundos."
            break
        fi
    done
}
wait_for_ipv4() {
    local timeout=120
    local waited=0
    local ip=""
    log "Waiting for IPv4 address..."
    while (( waited < timeout )); do
        lxc exec "$LAB_INSTANCE" -- dhclient &> /dev/null || true
        ip=$(lxc list "$LAB_INSTANCE" -c 4 --format csv | awk -F' ' '{print $1}')
        if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
            log "IPv4 address acquired: $ip"
            return 0
        fi
        sleep 2        
        waited=$((waited+2))
    done
    warn "Timeout waiting for IPv4 address."
    return 1
}
wait_vm_agent_ready() {
    local timeout=120
    local waited=0
    log "Waiting for VM agent to be ready..."
    while (( waited < timeout )); do
        if lxc exec "$LAB_INSTANCE" -- hostnamectl &>/dev/null; then
            log "VM agent is ready."
            return 0
        fi        
        sleep 2        
        waited=$((waited+2))
    done
    warn "Timeout waiting for VM agent to be ready."
    return 1
}
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


launch_instance() {
    delete_instance
    if [[ "$INSTANCE_TYPE" == "vm" ]]; then
        log "Launching LXD VM $LAB_INSTANCE ($IMAGE)..."
        lxc launch --vm "$IMAGE" "$LAB_INSTANCE"
    else
        log "Launching LXD container $LAB_INSTANCE ($IMAGE)..."
        lxc launch "$IMAGE" "$LAB_INSTANCE"
    fi
    wait_instance_ready
    if [[ "$INSTANCE_TYPE" == "container" ]]; then
        wait_for_ipv4
    fi
}


exec_shell() {
    log "Launching shell in $LAB_INSTANCE..."
    wait_instance_ready
    if [[ "$INSTANCE_TYPE" == "vm" ]]; then
        wait_vm_agent_ready
        log "Setting root password to 'lpic3' for VM login..."
        lxc exec "$LAB_INSTANCE" -- bash -c 'echo root:lpic3 | chpasswd 2>/dev/null' || lxc exec "$LAB_INSTANCE" -- sh -c 'echo root:lpic3 | chpasswd 2>/dev/null'
        echo -e "\n[INFO] For login in VM, use user: root and password : lpic3\n[INFO] If you see BAD PASSWORD warning, ignore: the password has been set.\n"
        lxc console "$LAB_INSTANCE"
    else
        lxc exec "$LAB_INSTANCE" -- /bin/sh
    fi
}


stop_instance() {
    log "Stopping LXD $INSTANCE_TYPE $LAB_INSTANCE..."
    lxc stop "$LAB_INSTANCE" || true
}


delete_instance() {
    log "Deleting LXD $INSTANCE_TYPE $LAB_INSTANCE..."
    lxc delete "$LAB_INSTANCE" --force || true
}


teardown_lab() {
    stop_instance
    delete_instance
    log "Lab cleaned up."
}

lab_summary() {
    log "======= 📊 LXD Lab Summary ======="
    lxc list
    log "=================================="
}


choose_instance_type() {
    echo "Choose instance type:"
    echo "1. Container (default)"
    echo "2. VM"
    read -rp "Enter your choice [1-2]: " TYPE_CHOICE
    case "$TYPE_CHOICE" in
        2) INSTANCE_TYPE="vm" ;;
        *) INSTANCE_TYPE="container" ;;
    esac
}

choose_image() {
    if [[ "$INSTANCE_TYPE" == "vm" ]]; then
        echo "Choose VM image to launch:"
        for i in "${!VM_IMAGES[@]}"; do
            echo "$i. ${VM_NAMES[$i]} (${VM_IMAGES[$i]})"
        done
        read -rp "Enter your choice [1-${#VM_IMAGES[@]}]: " IMG_CHOICE
        IMAGE="${VM_IMAGES[$IMG_CHOICE]:-${VM_IMAGES[1]}}"
    else
        echo "Choose container image to launch:"
        for i in "${!CONTAINER_IMAGES[@]}"; do
            echo "$i. ${CONTAINER_NAMES[$i]} (${CONTAINER_IMAGES[$i]})"
        done
        read -rp "Enter your choice [1-${#CONTAINER_IMAGES[@]}]: " IMG_CHOICE
        IMAGE="${CONTAINER_IMAGES[$IMG_CHOICE]:-${CONTAINER_IMAGES[1]}}"
    fi
}

main_menu() {
    clear
    echo "==============================="
    echo "        LXD Simulator Lab"
    echo "      By Silvestrini - 2025"
    echo "==============================="
    echo "Current instance type: $INSTANCE_TYPE"
    echo "Current image: $IMAGE"
    echo "==============================="
    echo "Choose an action:"
    echo "1. Launch LXD instance (choose type/image)"
    echo "2. Exec shell/console inside instance"
    echo "3. Stop instance"
    echo "4. Delete instance"
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
        1)
            choose_instance_type
            choose_image
            launch_instance
            lab_summary
            ;;
        2) exec_shell ;;
        3) stop_instance; lab_summary ;;
        4) delete_instance; lab_summary ;;
        9) teardown_lab ;;
        0) echo "Bye!" && exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
done
