#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: cgroups.sh
    🔒 Requirements: root privileges, cgroups v2, stress-ng installed
    📚 Description: Demonstrates cgroups v2 behavior through 3 common pod scenarios:
                 (1) Soft resource limits (limited but stable),
                 (2) CPU throttling (process slowed by CPU quota),
                 (3) OOM kill (process terminated by kernel for exceeding memory)
    👤 Author: Marcos Silvestrini
    📅 Date: 10/06/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'
LANG=C

CGROUP_BASE="/sys/fs/cgroup"
GROUP_NAME="lpic3demo"

log()   { echo -e "[INFO] 📌 $*"; }
abort() { echo -e "[ERROR] ❌ $*" >&2; exit 1; }

to_bytes() {
    local num="${1//[!0-9]/}"
    local unit="${1//[0-9]/}"
    case "$unit" in
        [Mm]) echo $((num * 1024 * 1024)) ;;
        [Kk]) echo $((num * 1024)) ;;
        *) echo "$num" ;;
    esac
}

detect_cgroup_version() {
    [[ "$(stat -fc %T "$CGROUP_BASE")" == "cgroup2fs" ]] && echo "v2" || echo "v1"
}

prepare_cgroup() {
    local mem_limit="$1"
    local cpu_quota="$2"
    local cpu_period="$3"

    log "📂 Setting up cgroup with mem=${mem_limit}, cpu=${cpu_quota}/${cpu_period}"
    mkdir -p "$CGROUP_BASE/$GROUP_NAME"
    echo "+memory +cpu" > "$CGROUP_BASE/cgroup.subtree_control" 2>/dev/null || true
    echo "$(to_bytes "$mem_limit")" > "$CGROUP_BASE/$GROUP_NAME/memory.max"
    echo "$cpu_quota $cpu_period" > "$CGROUP_BASE/$GROUP_NAME/cpu.max"
}

run_test() {
    local label="$1"
    local stress_args="$2"
    local description="$3"
    local extra_pre="$4"

    echo $$ > "$CGROUP_BASE/$GROUP_NAME/cgroup.procs"
    log "👷 Running test: $label"
    echo "[INFO] 📄 Description: $description"
    echo "[INFO] 🧪 stress-ng args: $stress_args"

    cat <<EOF > /tmp/stress_test.sh
#!/usr/bin/env bash
echo "[CGROUP TEST] 👷 PID: \$\$"

DMESG_BEFORE=\$(mktemp)
DMESG_AFTER=\$(mktemp)
DMESG_DIFF=\$(mktemp)
dmesg > "\$DMESG_BEFORE"

CGROUP_PATH=\$(cat /proc/\$\$/cgroup | awk -F: '{print \$NF}')
echo "[CGROUP TEST] 🧾 Membership: \$CGROUP_PATH"

$extra_pre

START_TIME=\$(date +%s)

stress-ng $stress_args &
PID=\$!
echo \$PID > "$CGROUP_BASE/$GROUP_NAME/cgroup.procs"

MAX_MEM=0
CPU_USED=0

for i in {1..30}; do
    if ! kill -0 \$PID 2>/dev/null; then
        echo "[CGROUP MONITOR] ⚠️ Process \$PID no longer running"
        break
    fi
    MEM=\$(cat "$CGROUP_BASE/$GROUP_NAME/memory.current")
    CPU=\$(grep usage_usec "$CGROUP_BASE/$GROUP_NAME/cpu.stat" | awk '{print \$2}')
    [[ \$MEM -gt \$MAX_MEM ]] && MAX_MEM=\$MEM
    CPU_USED=\$CPU
    echo "[T+\${i}s] 🧠 Memory: \$MEM bytes | 🧮 CPU: \$CPU μs"
    sleep 1
done

wait \$PID
EXIT_STATUS=\$?

END_TIME=\$(date +%s)

dmesg > "\$DMESG_AFTER"
diff "\$DMESG_BEFORE" "\$DMESG_AFTER" | grep "Killed process" > "\$DMESG_DIFF" || true

MEM_HUMAN=\$(awk "BEGIN {printf \"%.1f\", \$MAX_MEM / 1024 / 1024}")
CPU_HUMAN=\$(awk "BEGIN {printf \"%.1f\", \$CPU_USED / 1000000}")
RUNTIME=\$((END_TIME - START_TIME))

echo ""
echo "======================"
echo "📊 Test Summary"
echo "======================"
echo "🧪 Scenario: $label"
echo "📄 Description: $description"
[[ \$EXIT_STATUS -eq 0 ]] && echo "✅ stress-ng completed successfully" || echo "❌ stress-ng exited with code \$EXIT_STATUS"
echo "🧠 Max Memory Usage: \${MEM_HUMAN} MB"
echo "🧮 Total CPU Usage: \${CPU_HUMAN} s"
if [[ -s "\$DMESG_DIFF" ]]; then
    echo "☠️ Kernel OOM Kill was triggered!"
else
    echo "ℹ️ No OOM Kill detected."
fi
if [[ "$label" == "CPU Throttling" ]]; then
    echo "ℹ️ CPU throttling likely occurred if CPU usage increased slowly."
fi
echo "🕒 Elapsed Time: \${RUNTIME} seconds"
echo "======================"

rm -f "\$DMESG_BEFORE" "\$DMESG_AFTER" "\$DMESG_DIFF"
EOF

    chmod +x /tmp/stress_test.sh
    exec /tmp/stress_test.sh
}

run_scenario_1_soft_limit() {
    prepare_cgroup "50M" "50000" "100000"
    run_test "Soft Limit" "--vm 1 --vm-bytes 40M --timeout 10s --cpu 1" \
        "Memory and CPU within cgroup limits. Process completes successfully." ""
}

run_scenario_2_throttling() {
    prepare_cgroup "100M" "10000" "100000"
    run_test "CPU Throttling" "--vm 1 --vm-bytes 20M --timeout 30s --cpu 2" \
        "Memory OK, but CPU throttled to 10%. CPU usage will increase slowly." ""
}

run_scenario_3_oom_kill() {
    prepare_cgroup "5M" "100000" "100000"
    run_test "OOM Kill" "--vm 20 --vm-bytes 50M --vm-keep --verify --timeout 60s --cpu 1" \
        "Process will aggressively exceed memory and trigger kernel OOM Kill." \
        "sysctl -q -w vm.overcommit_memory=2"
}

main_menu() {
    clear
    echo "==============================="
    echo "  Cgroups Behavior Simulator"
    echo "   By Silvestrini - 2025"
    echo "==============================="
    echo "Choose a scenario to run:"
    echo "1. Soft Limit       - Process stays within limits"
    echo "2. CPU Throttling   - Process slowed by CPU cap"
    echo "3. OOM Kill         - Process exceeds memory and is killed"
    echo "0. Exit"
    echo "==============================="
}

# ======================
# Entry Point
# ======================
if [[ "$EUID" -ne 0 ]]; then abort "Run as root."; fi
if ! command -v stress-ng &>/dev/null; then abort "'stress-ng' is required."; fi
if [[ "$(detect_cgroup_version)" != "v2" ]]; then abort "This script requires cgroups v2."; fi

while true; do
    main_menu
    read -rp "Enter your choice [0-3]: " CHOICE
    case "$CHOICE" in
        1) run_scenario_1_soft_limit ;;
        2) run_scenario_2_throttling ;;
        3) run_scenario_3_oom_kill ;;
        0) echo "Bye!" && exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    read -rp $'\nPress Enter to return to menu...'
done
