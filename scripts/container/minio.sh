#!/bin/bash

: <<'MULTILINE-COMMENT'
    Script Name: minio.sh
    Description: Install MinIO server and client for LXD S3 storage buckets (local backend)
    Requirements: curl, sudo, Linux x86_64, LXD snap
    Author: Marcos Silvestrini + Linux Specialist AI
    Date: 24/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

BIN_DIR="/opt/minio"
MINIO_RELEASE_URL="https://dl.min.io/server/minio/release/linux-amd64/minio"
MC_RELEASE_URL="https://dl.min.io/client/mc/release/linux-amd64/mc"

log()   { echo -e "🟢 [INFO] $*"; }
warn()  { echo -e "🟡 [WARN] $*" >&2; }
error() { echo -e "🔴 [ERROR] $*" >&2; }

# Install curl if missing
if ! command -v curl >/dev/null 2>&1; then
    log "Installing curl..."
    if command -v apt-get >/dev/null; then
        sudo apt-get update -qq
        sudo apt-get install -y -qq curl
    elif command -v dnf >/dev/null; then
        sudo dnf install -y curl
    elif command -v yum >/dev/null; then
        sudo yum install -y curl
    else
        error "Could not install curl. Please install manually."
        exit 1
    fi
fi

# Create directory for MinIO binaries
sudo mkdir -p "$BIN_DIR"
sudo chown root:root "$BIN_DIR"
sudo chmod 755 "$BIN_DIR"

# Download MinIO server
log "Downloading MinIO server..."
sudo curl -fsSL "$MINIO_RELEASE_URL" -o "$BIN_DIR/minio"
sudo chmod +x "$BIN_DIR/minio"

# Download MinIO client
log "Downloading MinIO client..."
sudo curl -fsSL "$MC_RELEASE_URL" -o "$BIN_DIR/mc"
sudo chmod +x "$BIN_DIR/mc"

# Set permissions
sudo chown root:root "$BIN_DIR/minio" "$BIN_DIR/mc"

# Show version for validation
log "MinIO server version:"
sudo "$BIN_DIR/minio" --version
log "MinIO client version:"
sudo "$BIN_DIR/mc" --version

# For LXD Snap: configure snap to use the custom path and restart LXD
if snap list | grep -qw lxd; then
    log "Configuring LXD Snap to use MinIO binaries in $BIN_DIR"
    sudo snap set lxd minio.path="$BIN_DIR"
    sudo snap restart lxd
    log "LXD Snap reloaded with MinIO support."
else
    warn "LXD not installed via Snap or snap not detected. Ensure MinIO binaries are in the PATH for LXD."
fi

log "✅ MinIO server and client installed for LXD S3 bucket support."

log "✅ For access web interface, execute: /opt/minio/minio server /data --console-address \":9001\""
log "✅ For MinIO client, use: /opt/minio/mc --config-dir /root/.minio --insecure alias set myminio http://localhost:9000 minioadmin minioadmin"
log "✅ To access MinIO web interface, open your browser and visit: http://<your-server-ip>:9000"
