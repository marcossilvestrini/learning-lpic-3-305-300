#!/bin/bash

: <<'MULTILINE-COMMENT'
    📝 Requirements: none
    📚 Description: Script to configure Cloud environment and install ZFS on Debian/Ubuntu systems
    👤 Author: Marcos Silvestrini
    📅 Date: 27/02/2026
MULTILINE-COMMENT

# ===========================
# Global non-interactive mode
# ===========================
export LANG=C
export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
export NEEDRESTART_MODE=a

# ===========================
# Working directory
# ===========================
cd /home/vagrant || exit 1
clear

# ===========================
# OS detection
# ===========================
RELEASE_INFO=$(cat /etc/*release 2>/dev/null)

# -------------------------------------------------
# Helper: ensure "contrib" in APT sources (idempotent)
# - Adds "contrib" right after "main" only when missing
# - Backs up files with .BAK once (harmless if repeated)
# -------------------------------------------------
ensure_contrib() {
  local file="$1"
  [ -f "$file" ] || return 0
  sudo sed -r -i'.BAK' \
    '/^\s*deb\s/ {
       /contrib/! {
         /apt\.releases\.hashicorp\.com|packages\.opentofu\.org/! s/(\bmain\b)([[:space:]].*)?/\1 contrib\2/
       }
     }' "$file"
}

# -------------------------------------------------
# Debian/Ubuntu path
# -------------------------------------------------
if echo "$RELEASE_INFO" | grep -qiE "debian|ubuntu"; then
  echo "🟢 Detected Debian or Ubuntu distribution."

  # Base utilities (quiet, non-interactive)
  sudo apt update -yqq
  sudo apt install -yqq \
      dos2unix \
      lvm2 \
      btrfs-progs \
      tree whois \
      ca-certificates curl gnupg lsb-release \
      cgroup-tools \
      jq yq \
      bridge-utils

  # User environment
  sudo cp -f configs/commons/.bashrc_debian .bashrc
  sudo cp -f configs/commons/.bashrc_debian /root/.bashrc
  sudo cp -f configs/commons/profile_debian /etc/profile.d/
  sudo chmod 644 /etc/profile.d/profile_debian
  sudo cp -f configs/commons/.vimrc .vimrc
  sudo cp -f configs/commons/.vimrc /root/.vimrc

  # ----------------------
  # ZFS (contrib-only, non-interactive)
  # ----------------------
  echo "🔷 Enabling 'contrib' and installing ZFS (zfs-dkms) without backports..."

  # Ensure contrib is present in all sources (idempotent)
  ensure_contrib "/etc/apt/sources.list"
  for f in /etc/apt/sources.list.d/*.list; do
    [ -e "$f" ] && ensure_contrib "$f"
  done

  # Refresh indexes
  sudo apt update -yqq

  # Preseed license and DKMS build prompts to suppress blue screens
  echo "zfs-dkms zfs-dkms/always_build_with_dkms boolean true" | sudo debconf-set-selections
  echo "zfs-dkms zfs-dkms/always_build_module boolean true" | sudo debconf-set-selections
  echo "zfs-dkms zfs-dkms/enable_license_prompt boolean false" | sudo debconf-set-selections
  echo "zfs-dkms zfs-dkms/disable_license_prompt boolean true" | sudo debconf-set-selections

  # Force dpkg to skip interactive ncurses dialogs
  sudo DEBIAN_FRONTEND=noninteractive \
    APT_LISTCHANGES_FRONTEND=none \
    NEEDRESTART_MODE=a \
    TERM=dumb \
    apt-get install -y -o=Dpkg::Use-Pty=0 -o=Dpkg::Options::="--force-confdef" -o=Dpkg::Options::="--force-confold" zfs-dkms zfsutils-linux

  # Try to load module immediately (non-blocking)
  if sudo modprobe zfs 2>/dev/null; then
    echo "✅ ZFS module successfully loaded."
  else
    echo "INFO: DKMS may require a reboot to complete. The module will load on next boot."
  fi

  # Enable ZFS services (idempotent)
  sudo systemctl enable zfs-import-cache zfs-import-scan zfs-mount zfs.target >/dev/null 2>&1 || true

  # --------------------------
  # Terraform & Packer
  # --------------------------
  echo "🔷 Installing  Terraform and Packer..."

  # Add key GPG of HashiCorp non-interactively
  wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
  
  # Verify the GPG key's fingerprint.
  gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

  # Add HashiCorp repository
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

  # Refresh indexes
  sudo apt update -yqq

  # Install Terraform and Packer
  echo "Install Terraform and Packer..."
  sudo apt install -yqq terraform packer

  # ----------------------
  # OpenTofu
  # ----------------------
  echo "🔷 Installing OpenTofu..."

  # Add OpenTofu keys non-interactively
  sudo install -m 0755 -d /etc/apt/keyrings

  # Principal key for the repo
  curl -fsSL https://get.opentofu.org/opentofu.gpg \
    | sudo tee /etc/apt/keyrings/opentofu.gpg >/dev/null

  # Repository signing key
  curl -fsSL https://packages.opentofu.org/opentofu/tofu/gpgkey \
    | sudo gpg --no-tty --batch --dearmor \
    -o /etc/apt/keyrings/opentofu-repo.gpg >/dev/null

  # Set permissions
  sudo chmod a+r /etc/apt/keyrings/opentofu.gpg /etc/apt/keyrings/opentofu-repo.gpg

  # Add OpenTofu repository
  cat <<EOF | sudo tee /etc/apt/sources.list.d/opentofu.list >/dev/null
  deb [signed-by=/etc/apt/keyrings/opentofu.gpg,/etc/apt/keyrings/opentofu-repo.gpg] https://packages.opentofu.org/opentofu/tofu/any/ any main
  deb-src [signed-by=/etc/apt/keyrings/opentofu.gpg,/etc/apt/keyrings/opentofu-repo.gpg] https://packages.opentofu.org/opentofu/tofu/any/ any main
EOF

  # Refresh indexes
  sudo apt update -yqq

  # Pre-install tofu to avoid conflicts
  sudo apt install -yqq tofu

  # Log installation results
  echo "✅ Verifying IaC tools installation:"
  for tool in terraform tofu packer; do
    if command -v $tool &> /dev/null; then
      echo "  - $tool: Installed ($(command -v $tool))"
    else
      echo "  - $tool: Installation failed"
    fi
  done

  # ===========================
  # Install Docker Engine
  # ===========================
  echo "🔷 Installing Docker Engine..."

  # ----------------------
  # Docker repository/key
  # ----------------------
  sudo rm -f /usr/share/keyrings/docker-archive-keyring.gpg 2>/dev/null || true
  sudo install -m 0755 -d /etc/apt/keyrings

  # Download key only if missing; avoid overwrite prompt
  if [ ! -s /etc/apt/keyrings/docker.gpg ]; then
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod 0644 /etc/apt/keyrings/docker.gpg
  fi

  # Ensure repository line exists exactly once
  sudo rm -f /etc/apt/sources.list.d/docker.list
  sudo sed -i '/download\.docker\.com\/linux\/debian/d' /etc/apt/sources.list || true
  CODENAME=$(. /etc/os-release && echo "$VERSION_CODENAME")
  ARCH=$(dpkg --print-architecture)
  echo "deb [arch=${ARCH} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian ${CODENAME} stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

  sudo apt-get update -y -o=Dpkg::Use-Pty=0
  sudo apt-get install -y -o=Dpkg::Use-Pty=0 \
      docker-ce \
      docker-ce-cli \
      containerd.io \
      docker-buildx-plugin \
      docker-compose-plugin \
      gnupg software-properties-common

  sudo systemctl enable docker.service containerd.service
  sudo systemctl start docker.service containerd.service

  sudo groupadd docker 2>/dev/null || true
  sudo usermod -aG docker vagrant || true
  # IMPORTANT: do not run "newgrp docker" (it spawns a subshell and can appear to hang)
  echo "INFO: 'newgrp docker' skipped to avoid subshell. Re-login to apply group membership."

  # Clean up APT
  sudo apt clean
  sudo apt autoremove -yqq

# -------------------------------------------------
# Oracle Linux
# -------------------------------------------------
elif echo "$RELEASE_INFO" | grep -qi "oracle"; then
  echo "🟡 Detected Oracle Linux distribution."
  sudo dnf install -y dos2unix

# -------------------------------------------------
# Rocky Linux
# -------------------------------------------------
elif echo "$RELEASE_INFO" | grep -qi "rocky"; then
  echo "🟡 Detected Rocky Linux distribution."
  sudo dnf install -y dos2unix
  [ -f "/etc/ssh/sshd_config.d/50-redhat.conf" ] && sudo rm /etc/ssh/sshd_config.d/50-redhat.conf
  [ -f "/etc/ssh/sshd_config.d/90-redhat.conf" ] && sudo rm /etc/ssh/sshd_config.d/90-redhat.conf

# -------------------------------------------------
# Unsupported
# -------------------------------------------------
else
  echo "🔴 Unsupported distribution detected. Supported: Debian, Ubuntu, Rocky, Oracle Linux."
fi

# ===========================
# Sysctl configuration
# ===========================
SYSCTL_CONF="/etc/sysctl.conf"

# Ensure net.ipv4.ip_forward=1
if grep -q '^net.ipv4.ip_forward' "$SYSCTL_CONF"; then
  sudo sed -i 's|^net.ipv4.ip_forward=.*|net.ipv4.ip_forward=1|' "$SYSCTL_CONF"
else
  echo "net.ipv4.ip_forward=1" | sudo tee -a "$SYSCTL_CONF"
fi

sudo sysctl -p "$SYSCTL_CONF"

# ===========================
# SSH server configuration
# ===========================
sudo cp -f configs/commons/01-sshd-custom.conf /etc/ssh/sshd_config.d
sudo chmod 644 /etc/ssh/sshd_config.d/01-sshd-custom.conf

# ===========================
# SSH keys for vagrant user
# ===========================
AUTHORIZED_KEYS_FILE=".ssh/authorized_keys"
PUBLIC_KEY_FILE="security/skynet-key-ecdsa.pub"
PRIVATE_KEY_FILE="security/skynet-key-ecdsa"

cp -f "$PRIVATE_KEY_FILE" "$HOME/.ssh"
sudo chmod 600 "$HOME/.ssh/skynet-key-ecdsa"

cp -f "$PUBLIC_KEY_FILE" "$HOME/.ssh"
sudo chmod 644 "$HOME/.ssh/skynet-key-ecdsa.pub"

# Append public key if not already present
if grep -q -F -f "$PUBLIC_KEY_FILE" "$AUTHORIZED_KEYS_FILE"; then
  echo "SSH public key already present in authorized_keys."
else
  echo "Adding SSH public key to authorized_keys..."
  cat "$PUBLIC_KEY_FILE" >> "$AUTHORIZED_KEYS_FILE"
fi

# Restart SSH services
sudo systemctl restart sshd
sudo systemctl restart ssh || true

# Pre-accept SSH host key with timeout to avoid blocking
ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=accept-new -i /home/vagrant/.ssh/skynet-key-ecdsa vagrant@192.168.0.131 exit || true

# ===========================
# SSH client configuration
# ===========================
mkdir -p /home/vagrant/.ssh
tee /home/vagrant/.ssh/config > /dev/null <<EOF
Host 192.168.0.131
    User vagrant
    IdentityFile /home/vagrant/.ssh/skynet-key-ecdsa
    StrictHostKeyChecking accept-new
    UserKnownHostsFile /home/vagrant/.ssh/known_hosts
EOF

chown vagrant:vagrant /home/vagrant/.ssh/config
chmod 600 /home/vagrant/.ssh/config

# ===========================
# /etc/hosts synchronization
# ===========================
sudo cp -f configs/network/hosts /etc/
HOSTNAME=$(hostname)
IPV4=$(ip addr show | grep -oP '192\.168\.0\.\d{1,3}(?=/)')

if [ -z "$IPV4" ]; then
  echo "No IPv4 address found in 192.168.0.x range. Skipping /etc/hosts update."
else
  if grep -q "$IPV4" /etc/hosts; then
    echo "Entry for $IPV4 already exists in /etc/hosts."
  else
    echo "$IPV4 $HOSTNAME" | sudo tee -a /etc/hosts >/dev/null
    echo "Added entry: $IPV4 $HOSTNAME"
  fi
fi
# End of script
