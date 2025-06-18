#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    Script Name: capabilities-lab.sh
    Requirements: root privileges, auto-installs: capsh, tcpdump, python3, strace, util-linux
    Description: Demonstrates Linux capabilities through 6 practical scenarios:
        (1) Drop all capabilities (test failures),
        (2) Add CAP_NET_RAW and test packet capture,
        (3) Add CAP_NET_BIND_SERVICE and bind to port 80,
        (4) Use CAP_KILL to kill a process,
        (5) Use CAP_SYS_PTRACE to strace another process,
        (6) Use CAP_SYS_ADMIN to mount a tmpfs.
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

run_scenario_4_cap_kill() {
    DESC="Try killing a subprocess running as another user (e.g., nobody) with and without CAP_KILL"
    log "📦 Launching background victim process as nobody (sleep 10)..."

    VICTIM_SCRIPT="/tmp/victim_kill.sh"
    VICTIM_PID_FILE="/tmp/victim_pid.txt"

    cat <<EOF > "$VICTIM_SCRIPT"
#!/bin/bash
sleep 30 &
echo \$! > "$VICTIM_PID_FILE"
wait
EOF

    chmod +x "$VICTIM_SCRIPT"
    sudo -u nobody "$VICTIM_SCRIPT" &
    sleep 1

    if [[ ! -f "$VICTIM_PID_FILE" ]]; then
        summary "CAP_KILL" "$DESC" "❌ Failed to launch victim process" "N/A"
        return
    fi

    VICTIM_PID=$(cat "$VICTIM_PID_FILE")
    sleep 1

    if ! ps -p "$VICTIM_PID" &>/dev/null; then
        summary "CAP_KILL" "$DESC" "❌ Victim process not running" "N/A"
        return
    fi

    log "👤 Victim PID is $VICTIM_PID"

    # 1. Attempt to kill without CAP_KILL
    capsh --drop=all -- -c "kill -9 $VICTIM_PID" 2>/dev/null || true
    sleep 1

    if ps -p "$VICTIM_PID" &>/dev/null; then
        WITHOUT_CAP_RESULT="✅ Kill blocked without CAP_KILL"
    else
        WITHOUT_CAP_RESULT="❌ Kill succeeded without CAP_KILL (unexpected)"
        # Relaunch
        sudo -u nobody "$VICTIM_SCRIPT" &
        sleep 1
        VICTIM_PID=$(cat "$VICTIM_PID_FILE")
        sleep 1
    fi

    # 2. Attempt to kill with CAP_KILL
    capsh --keep=1 --caps="cap_kill+ep" -- -c "kill -9 $VICTIM_PID" 2>/dev/null || true
    sleep 1

    if ps -p "$VICTIM_PID" &>/dev/null; then
        WITH_CAP_RESULT="❌ Kill failed with CAP_KILL"
        kill -9 "$VICTIM_PID" &>/dev/null
    else
        WITH_CAP_RESULT="✅ Kill succeeded with CAP_KILL"
    fi

    RESULT="$WITHOUT_CAP_RESULT / $WITH_CAP_RESULT"
    CAPS="Added CAP_KILL"
    summary "CAP_KILL" "$DESC" "$RESULT" "$CAPS"

    # Cleanup
    rm -f "$VICTIM_SCRIPT" "$VICTIM_PID_FILE"
}


run_scenario_5_cap_ptrace() {
    DESC="Try using strace on a child process (simulate debugging)"
    log "📌 📌 📌 📌 📌 📌 📌 📌 Preparing test process for strace..."

    STRACE_BIN="/tmp/strace_copy"
    cp "$(command -v strace)" "$STRACE_BIN"
    chmod +x "$STRACE_BIN"
    setcap cap_sys_ptrace=eip "$STRACE_BIN"

    if ! getcap "$STRACE_BIN" | grep -q "cap_sys_ptrace"; then
        summary "CAP_SYS_PTRACE" "$DESC" "❌ setcap failed" "N/A"
        return
    fi

    # Start a long-running process
    sleep 30 &
    CHILD_PID=$!
    sleep 1

    if ! ps -p "$CHILD_PID" &>/dev/null; then
        summary "CAP_SYS_PTRACE" "$DESC" "❌ Failed to launch child" "N/A"
        return
    fi

    OUTPUT=$($STRACE_BIN -p "$CHILD_PID" -o /tmp/ptrace.out -e trace=none -qq 2>&1 || true)

    if grep -q "attached" /tmp/ptrace.out || echo "$OUTPUT" | grep -q "attached"; then
        RESULT="✅ strace attached – CAP_SYS_PTRACE effective"
    else
        RESULT="❌ Failed to trace – check execution and permissions"
    fi

    CAPS="CAP_SYS_PTRACE set on binary"
    summary "CAP_SYS_PTRACE" "$DESC" "$RESULT" "$CAPS"
    kill "$CHILD_PID" &>/dev/null || true
    rm -f "$STRACE_BIN" /tmp/ptrace.out
}


run_scenario_6_cap_admin() {
    DESC="Try mounting a tmpfs using CAP_SYS_ADMIN"
    MNT_DIR="/tmp/testmnt"
    mkdir -p "$MNT_DIR"
    chmod 755 "$MNT_DIR"

    OUTPUT=$(capsh --keep=1 --caps="cap_sys_admin+ep" -- -c "/bin/mount -t tmpfs none $MNT_DIR" 2>&1 || true)

    if mount | grep -q "$MNT_DIR"; then
        RESULT="✅ Mount succeeded with CAP_SYS_ADMIN"
        umount "$MNT_DIR"
    else
        RESULT="❌ Failed to mount – likely missing capability"
    fi

    CAPS="Added CAP_SYS_ADMIN"
    summary "CAP_SYS_ADMIN" "$DESC" "$RESULT" "$CAPS"
    rm -rf "$MNT_DIR"
}


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
    echo "4. CAP_KILL         - Kill process with and without CAP_KILL"
    echo "5. CAP_SYS_PTRACE   - Use strace on a process"
    echo "6. CAP_SYS_ADMIN    - Try mounting tmpfs"
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
install_if_missing strace "strace"
install_if_missing mount "util-linux"

while true; do
    main_menu
    read -rp "Enter your choice [0-6]: " CHOICE
    case "$CHOICE" in
        1) run_scenario_1_drop_all ;;
        2) run_scenario_2_add_net_raw ;;
        3) run_scenario_3_bind_port ;;
        4) run_scenario_4_cap_kill ;;
        5) run_scenario_5_cap_ptrace ;;
        6) run_scenario_6_cap_admin ;;
        0) echo "Bye!" && exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
done
