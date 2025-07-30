#!/bin/bash

: <<'MULTILINE-COMMENT'
    Script Name: minio.sh
    Description: Install MinIO server and client, set up systemd unit for automatic service management (LXD S3 integration)
    Requirements: curl, sudo, Linux x86_64, LXD snap
    Author: Marcos Silvestrini + Linux Specialist AI
    Date: 24/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

BIN_DIR="/opt/minio"
DATA_DIR="/data"
SERVICE_USER="minio"
SERVICE_NAME="minio"
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
        error "Could not install curl. Please install it manually."
        exit 1
    fi
fi

# Create directory for MinIO binaries
sudo mkdir -p "$BIN_DIR"

# Download MinIO server binary
log "Downloading MinIO server..."
sudo curl -fsSL "$MINIO_RELEASE_URL" -o "$BIN_DIR/minio"
sudo chmod +x "$BIN_DIR/minio"

# Download MinIO client binary
log "Downloading MinIO client..."
sudo curl -fsSL "$MC_RELEASE_URL" -o "$BIN_DIR/mc"
sudo chmod +x "$BIN_DIR/mc"

# Set ownership
sudo chown root:root "$BIN_DIR/"*

# Display versions
log "MinIO server version:"
"$BIN_DIR/minio" --version
log "MinIO client version:"
"$BIN_DIR/mc" --version

# Create system user for MinIO if not exists
if ! id "$SERVICE_USER" &>/dev/null; then
    log "Creating system user '$SERVICE_USER'..."
    sudo useradd --system --home "$DATA_DIR" --shell /sbin/nologin "$SERVICE_USER"
fi

# Create data directory and assign proper ownership
sudo mkdir -p "$DATA_DIR"
sudo chown -R "$SERVICE_USER":"$SERVICE_USER" "$DATA_DIR"

# Create systemd unit file for MinIO
log "Creating systemd unit for MinIO..."
sudo tee /etc/systemd/system/${SERVICE_NAME}.service >/dev/null <<EOF
[Unit]
Description=MinIO S3-Compatible Object Storage Server
Documentation=https://docs.min.io
Wants=network-online.target
After=network-online.target

[Service]
User=${SERVICE_USER}
Group=${SERVICE_USER}
ExecStart=${BIN_DIR}/minio server ${DATA_DIR} --console-address ":9001"
Restart=always
LimitNOFILE=65536
Environment=MINIO_ROOT_USER=minioadmin
Environment=MINIO_ROOT_PASSWORD=minioadmin

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and enable/start MinIO service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now "$SERVICE_NAME"

# Configure LXD snap to recognize MinIO custom path (if applicable)
if snap list | grep -qw lxd; then
    log "Configuring LXD snap to use MinIO binaries from $BIN_DIR"
    sudo snap set lxd minio.path="$BIN_DIR"
    sudo snap restart lxd
fi

# Final messages
log "✅ MinIO server and client installed and running as systemd service."
log "✅ S3 API available on port 9000 | Web UI on port 9001"
log "➡️  Access via browser: http://<your-server-ip>:9001"
