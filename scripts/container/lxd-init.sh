#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    Script Name: lxd-setup.sh
    Requirements: root privileges, apt, lxd
    Description: Automate LXD install/config on Debian/Ubuntu
    Author: Marcos Silvestrini + Linux Specialist AI
    Date: 21/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

# ========== LOGGING ==========
log()   { echo -e "🌟 [INFO] $*"; }
warn()  { echo -e "⚠️  [WARN] $*" >&2; }
abort() { echo -e "🛑 [ERROR] $*" >&2; exit 1; }

# ========== VALIDATION ==========
[[ "$EUID" -eq 0 ]] || abort "Run as root or via sudo!"
export LANG=C

cd /home/vagrant || abort "Failed to cd to /home/vagrant"

RELEASE_INFO=$(cat /etc/*release 2>/dev/null || echo "N/A")

if [[ $RELEASE_INFO != *"Debian"* && $RELEASE_INFO != *"Ubuntu"* ]]; then
    abort "This script supports only Debian/Ubuntu based distros."
fi

log "Debian/Ubuntu detected. Proceeding with LXD setup..."

# ========== LXD INSTALL ==========
if ! command -v lxc >/dev/null; then
    log "LXD not found. Installing LXD..."
    apt-get update -qq && apt-get install -y -qq lxd || abort "Failed to install LXD!"
else
    log "LXD already installed."
fi

# ========== LXD INIT ==========
if ! cat configs/container/lxd/lxd-init.yaml | lxd init --preseed 2>&1 | tee /tmp/lxd-init.log | grep -qi 'error'; then
    log "LXD initialized successfully with preseed. 🎉"
else
    warn "Check /tmp/lxd-init.log for details. Initialization may have failed."
fi

# ========== LXD SERVICE ==========
systemctl enable lxd &>/dev/null || warn "Failed to enable LXD at boot."
if systemctl is-active --quiet lxd; then
    log "LXD service is running. 🚀"
else
    warn "LXD not running. Starting service..."
    systemctl start lxd || abort "Failed to start LXD service."
fi

# ========== LXD GROUP ==========
if ! getent group lxd | grep -qw vagrant; then
    log "Adding 'vagrant' to group 'lxd'..."
    usermod -aG lxd vagrant || warn "Failed to add vagrant to lxd group."
else
    log "User 'vagrant' already in group 'lxd'."
fi

log "✅ LXD environment setup complete!"

