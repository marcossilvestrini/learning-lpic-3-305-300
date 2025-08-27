#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    📝 Script Name: lxd-setup.sh
    🔒 Requirements: root privileges, apt, lxd
    📚 Description: Automate LXD install/config on Debian/Ubuntu
    👤 Author: Marcos Silvestrini
    📅 Date: 21/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'
export PATH=$PATH:/snap/bin

# ========== LOGGING ==========
log()   { echo -e "🌟 [INFO] $*"; }
warn()  { echo -e "⚠️ [WARN] $*" >&2; }
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
log "Configuring LXD MinIO S3 backend..."

# Set the MinIO binary path for LXD Snap (only required for Snap installations)
sudo snap set lxd minio.path=/opt/minio

# Restart LXD daemon to reload MinIO support
sudo snap restart lxd

# Set the S3 endpoint address for LXD storage buckets
lxc config set core.storage_buckets_address ":8555"
log "LXD MinIO S3 backend configured at :8555"

# load ZFS kernel module if not already loaded
if ! lsmod | grep -q zfs; then
    log "Loading ZFS kernel module..."
    sudo /sbin/modprobe zfs || {
        error "Failed to load ZFS kernel module. Ensure ZFS is installed."
        exit 1
    }
fi
log "ZFS kernel module loaded successfully."

# ========== LXD GROUP ==========
if ! getent group lxd | grep -qw vagrant; then
    log "Adding 'vagrant' to group 'lxd'..."
    usermod -aG lxd vagrant || warn "Failed to add vagrant to lxd group."
else
    log "User 'vagrant' already in group 'lxd'."
fi

# ========== LXD UI SETUP ==========
log "Enabling LXD UI..."

# Enable UI feature flag on snap
snap set lxd ui.enable=true || warn "Failed to enable UI via snap."

# Expose HTTPS listener on port 8443 (required for UI access)
lxc config set core.https_address ":8443" || warn "Failed to expose LXD API/UI."

# Restart the LXD daemon to apply changes
snap restart --reload lxd || systemctl reload snap.lxd.daemon

# # Open firewall port if UFW is active
# if command -v ufw >/dev/null && ufw status | grep -q active; then
#     ufw allow 8443/tcp || warn "Failed to open 8443/tcp on UFW."
# fi

# Detect first 192.168.x.x IPv4 from host
HOST_IP=$(hostname -I | tr ' ' '\n' | grep -m1 '^192\.168\.')

# Validate that port 8443 is listening and show access URL
if ss -lntp | grep -q ":8443"; then
    if [[ -n "$HOST_IP" ]]; then
        log "LXD UI is available at https://${HOST_IP}:8443 🎨"
    else
        log "LXD UI is available at https://<host>:8443 🎨 (no 192.168.x.x IP found)"
    fi
else
    warn "Port 8443 is not listening. Check LXD daemon logs."
fi

# ========== LXD CONFIGURATION ==========

# Configure profiles
# lxc profile create production
# lxc profile set production limits.memory 16GiB
# lxc profile set production limits.cpu 10
# lxc profile set production environment.EDITOR vim
# lxc profile set default environment.EDITOR vim

# # Restart the LXD daemon to apply changes
# snap restart --reload lxd || systemctl reload snap.lxd.daemon
# log "LXD profile configuration created successfully. 🚀"

log "✅ LXD environment setup complete!"
