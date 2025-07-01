#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    Script Name: runc-lab.sh
    Requirements: root privileges, runc, curl, jq
    Description: Simulate basic runc operations:
      - Download and setup busybox rootfs
      - Generate OCI spec
      - Run container
      - Exec into container
      - Kill container
      - Teardown everything
    Author: Marcos Silvestrini + Linux Specialist AI
    Date: 01/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

# ===== VARIABLES =====
LAB_DIR="/tmp/runc-lab"
ROOTFS="$LAB_DIR/rootfs"
BUSYBOX_URL="https://busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox"
CONTAINER_ID="busybox-lab"
BUSYBOX_BIN="$LAB_DIR/busybox"

# ===== LOGGING =====
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

# ===== LAB FUNCTIONS =====

setup_rootfs() {
    log "Setting up BusyBox rootfs in $ROOTFS ..."
    rm -rf "$LAB_DIR"
    mkdir -p "$ROOTFS"/{bin,sbin,usr/bin,usr/sbin,proc,sys,tmp,dev,etc}
    chmod 755 "$ROOTFS/etc"

    log "Downloading busybox-static ..."
    curl -L -o "$BUSYBOX_BIN" "$BUSYBOX_URL"
    chmod +x "$BUSYBOX_BIN"
    cp "$BUSYBOX_BIN" "$ROOTFS/bin/"

    cp /etc/passwd "$ROOTFS/etc/" || true
    cp /etc/group "$ROOTFS/etc/" || true

    # Monte /proc temporariamente no rootfs
    mount --bind /proc "$ROOTFS/proc"

    # Instale os symlinks busybox
    chroot "$ROOTFS" /bin/busybox --install -s

    # Garantir symlinks essenciais no /bin
    for cmd in id ls hostname sh sleep; do
        [[ -e "$ROOTFS/bin/$cmd" ]] || ln -sf busybox "$ROOTFS/bin/$cmd"
    done

    umount "$ROOTFS/proc" || true

    log "BusyBox rootfs ready."
}

generate_spec() {
    log "Generating runc config.json ..."
    cd "$LAB_DIR"
    [[ -f config.json ]] && rm -f config.json
    runc spec
    # Usa jq para alterar a spec com mais segurança
    jq '
      .process.args = ["/bin/sleep", "1000"] |
      .root.path = "rootfs" |
      .process.terminal = false |
      .hostname = "runc-lab" |
      .root.readonly = false
    ' config.json > config.json.tmp && mv config.json.tmp config.json
    log "config.json generated and adjusted."
}

run_container() {
    log "Running BusyBox container..."
    cd "$LAB_DIR"
    if runc list | grep -q "$CONTAINER_ID"; then
        log "Container already running, killing first..."
        runc kill "$CONTAINER_ID" || true
        runc delete "$CONTAINER_ID" || true
    fi
    runc run -d "$CONTAINER_ID"
    sleep 1
    if runc list | grep -q "$CONTAINER_ID"; then
        log "Container is running!"
        runc list
    else
        warn "Failed to start container."
    fi
}

exec_container_shell() {
    log "Entering container shell with runc exec (type 'exit' to return)..."
    runc exec -t "$CONTAINER_ID" /bin/sh
}

kill_container() {
    log "Killing container $CONTAINER_ID ..."
    runc kill "$CONTAINER_ID" KILL 2>/dev/null || log "Container not running"
    runc delete "$CONTAINER_ID" 2>/dev/null || log "Container already deleted"
}

teardown_lab() {
    log "Tearing down lab and cleaning up..."
    kill_container || true
    rm -rf "$LAB_DIR"
    log "Lab cleaned up."
}

chroot_summary() {
    log "======= 📊 Chroot/Rootfs Test Summary ======="
    local hostname user rootfs write_test

    hostname=$(chroot "$ROOTFS" /bin/hostname 2>/dev/null || echo "N/A")
    user=$(chroot "$ROOTFS" /bin/id 2>/dev/null || echo "N/A")
    rootfs=$(chroot "$ROOTFS" /bin/ls / 2>/dev/null | xargs echo || echo "N/A")
    write_test=$(chroot "$ROOTFS" /bin/sh -c "echo '[TEST] write OK' > /tmp/runc-test && cat /tmp/runc-test" 2>/dev/null || echo "FAILED")

    echo -e "[CHROOT UTS] 🌐 Hostname: $hostname"
    echo -e "[CHROOT USER] 👤 UID/GID: $user"
    echo -e "[CHROOT FS] 📂 Root filesystem: $rootfs"
    echo -e "[CHROOT MOUNT] 🗂️ /tmp write: $write_test"
    log "============================================="
}

main_menu() {
    clear
    echo "==============================="
    echo "  runc Simulator Lab"
    echo "   By Silvestrini - 2025"
    echo "==============================="
    echo "Choose an action:"
    echo "1. Setup BusyBox rootfs"
    echo "2. Generate runc spec"
    echo "3. Run BusyBox container"
    echo "4. Kill container"
    echo "5. Exec shell inside container"
    echo "9. Teardown/Cleanup Temporary Files"
    echo "0. Exit"
    echo "==============================="
}

# ========== MAIN LOOP ==========

if [[ "$EUID" -ne 0 ]]; then abort "Run as root."; fi
install_if_missing curl curl
install_if_missing runc runc
install_if_missing jq jq

while true; do
    main_menu
    read -rp "Enter your choice [0,1,2,3,4,5,9]: " CHOICE
    case "$CHOICE" in
        1) setup_rootfs; chroot_summary ;;
        2) generate_spec ;;
        3) run_container ;;
        4) kill_container ;;
        5) exec_container_shell ;;
        9) teardown_lab ;;
        0) echo "Bye!" && exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
done
