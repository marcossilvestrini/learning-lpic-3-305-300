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
export PATH=$PATH:/snap/bin

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
    log "LXD not found in PATH. Trying to install via Snap..."
    snap install lxd --channel=latest/stable || abort "Failed to install LXD via Snap!"
else
    log "LXD already installed (Snap)."
fi

# ========== LXD INIT ==========
if ! cat configs/container/lxd/lxd-init.yaml | lxd init --preseed 2>&1 | tee /tmp/lxd-init.log | grep -qi 'error'; then
    log "LXD initialized successfully with preseed. 🎉"
else
    warn "Check /tmp/lxd-init.log for details. Initialization may have failed."
fi

# ========== LXD SERVICE ==========
if systemctl is-active --quiet snap.lxd.daemon; then
    log "LXD (Snap) service is running. 🚀"
else
    warn "LXD (Snap) service is not running. Starting..."
    systemctl start snap.lxd.daemon || abort "Failed to start LXD (Snap) daemon."
fi

# ========== LXD GROUP ==========
if ! getent group lxd | grep -qw vagrant; then
    log "Adding 'vagrant' to group 'lxd'..."
    usermod -aG lxd vagrant || warn "Failed to add vagrant to lxd group."
else
    log "User 'vagrant' already in group 'lxd'."
fi

# Post-init: configure LXD MinIO S3 backend support
echo "Configuring LXD MinIO S3 backend..."

# Set the MinIO binary path for LXD Snap (only required for Snap installations)
sudo snap set lxd minio.path=/opt/minio

# Restart LXD daemon to reload MinIO support
sudo snap restart lxd

# Set the S3 endpoint address for LXD storage buckets
lxc config set core.storage_buckets_address ":8555"

echo "LXD S3 bucket backend configured."


log "✅ LXD environment setup complete!"
