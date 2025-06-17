#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    Script Name: capabilities-lab.sh
    Requirements: root privileges, auto-installs: capsh, tcpdump, python3, libcap2-bin
    Description: Demonstrates Linux capabilities through 3 practical scenarios:
                 (1) Drop all capabilities (test failures),
                 (2) Add CAP_NET_RAW and test packet capture,
                 (3) Add CAP_NET_BIND_SERVICE and bind to port 80
    Author: Marcos Silvestrini
    Date: 16/06/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

log()   { echo -e "[INFO] 📌 $*"; }
abort() { echo -e "[ERROR] ❌ $*" >&2; exit 1; }

install_if_missing() {
    local cmd="$1"
    local pkg="$2"

    if ! command -v "$cmd" &>/dev/null; then
        log "📦 Installing missing dependency: $cmd (package: $pkg)"
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

summary() {
    echo -e "\n======================"
    echo "📊 Capability Test Summary"
    echo "======================"
    echo "🧪 Scenario: $1"
    echo "📄 Description: $2"
    echo "🧾 Capability Status: $4"
    echo "📈 Result: $3"
    echo "======================"
}

run_scenario_1_drop_all() {
    DESC="Drop all capabilities and try running tcpdump"
    OUTPUT=$(capsh --drop=all -- -c "timeout 2 tcpdump -i lo -c 1 > /dev/null 2>&1" 2>&1 || true)
    if echo "$OUTPUT" | grep -qi "permission denied"; then
        RESULT="✅ Capability drop worked – tcpdump blocked"
    else
        RESULT="❌ Unexpected behavior – tcpdump may have succeeded"
    fi
    CAPS="Dropped ALL"
    summary "Drop All" "$DESC" "$RESULT" "$CAPS"
}

run_scenario_2_add_net_raw() {
    local SCRIPT="/tmp/cap_net_raw_test.sh"
    echo "#!/bin/bash" > "$SCRIPT"
    echo "timeout 2 tcpdump -i lo -c 1 > /dev/null 2>&1" >> "$SCRIPT"
    chmod +x "$SCRIPT"

    DESC="Add only CAP_NET_RAW and attempt packet capture via tcpdump"

    OUTPUT=$(capsh --drop=all --add=cap_net_raw -- -c "$SCRIPT" 2>&1 || true)
    if [[ $? -eq 0 ]]; then
        RESULT="✅ tcpdump ran – CAP_NET_RAW effective"
    else
        RESULT="❌ tcpdump failed"
    fi

    CAPS="Added CAP_NET_RAW"
    summary "Add CAP_NET_RAW" "$DESC" "$RESULT" "$CAPS"
    rm -f "$SCRIPT"
}

run_scenario_3_bind_port() {
    DESC="Try to bind to privileged port 80 using Python with CAP_NET_BIND_SERVICE"

    log "📦 Preparing Python server on port 80..."
    cp "$(command -v python3)" /tmp/python3_copy
    chmod +x /tmp/python3_copy

    setcap cap_net_bind_service=eip /tmp/python3_copy 2>/dev/null || {
        RESULT="❌ Failed to setcap"
        CAPS="Attempted to set CAP_NET_BIND_SERVICE"
        summary "Bind Port 80" "$DESC" "$RESULT" "$CAPS"
        rm -f /tmp/python3_copy
        return
    }

    log "🧪 Checking if port 80 is already in use..."
    if ss -tuln | grep -q ':80'; then
        RESULT="❌ Port 80 is already in use"
        CAPS="CAP_NET_BIND_SERVICE granted, but port 80 busy"
        summary "Bind Port 80" "$DESC" "$RESULT" "$CAPS"
        rm -f /tmp/python3_copy
        return
    fi

    cat <<EOF > /tmp/server.py
import socket
s = socket.socket()
try:
    s.bind(("0.0.0.0", 80))
    print("✅ Bound to port 80 successfully!")
except Exception as e:
    print("❌ Failed to bind:", e)
EOF

    OUTPUT=$(timeout 5 /tmp/python3_copy /tmp/server.py 2>&1)
    if echo "$OUTPUT" | grep -q "✅ Bound"; then
        RESULT="✅ Python successfully bound to port 80"
    else
        RESULT="❌ Failed to bind port 80: $(echo "$OUTPUT" | tail -n1)"
    fi

    CAPS="Added CAP_NET_BIND_SERVICE"
    summary "Bind Port 80" "$DESC" "$RESULT" "$CAPS"

    rm -f /tmp/python3_copy /tmp/server.py
}


/*************  ✨ Windsurf Command ⭐  *************/
# Prints a menu with options for the user to choose a scenario to run
#
# Options:
#   1. Drop All         - Packet capture fails (no CAP_NET_RAW)
#   2. Add CAP_NET_RAW  - Packet capture works
#   3. Bind Port 80     - Python binds to 80 without root
/*******  6d6a46a8-45f3-4856-bef2-a977602e8389  *******/
main_menu() {
    clear
    echo "==============================="
    echo "  Capabilities Simulator Lab"
    echo "   By Silvestrini - 2025"
    echo "==============================="
    echo "Choose a scenario to run:"
    echo "1. Drop All         - Packet capture fails (no CAP_NET_RAW)"
    echo "2. Add CAP_NET_RAW  - Packet capture works"
    echo "3. Bind Port 80     - Python binds to 80 without root"
    echo "0. Exit"
    echo "==============================="
}

# ======================
# Entry Point
# ======================
if [[ "$EUID" -ne 0 ]]; then abort "Run as root."; fi

# Auto-install required tools
install_if_missing capsh "libcap2-bin"
install_if_missing tcpdump "tcpdump"
install_if_missing python3 "python3"
install_if_missing setcap "libcap2-bin"

while true; do
    main_menu
    read -rp "Enter your choice [0-3]: " CHOICE
    case "$CHOICE" in
        1) run_scenario_1_drop_all ;;
        2) run_scenario_2_add_net_raw ;;
        3) run_scenario_3_bind_port ;;
        0) echo "Bye!" && exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
done
