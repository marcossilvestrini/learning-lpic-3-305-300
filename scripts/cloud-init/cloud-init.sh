#!/bin/bash

: <<'MULTILINE-COMMENT'
    📝 Requirements: none
    📚 Description: Script to configure Cloud environment and install ZFS on Debian/Ubuntu systems
    👤 Author: Marcos Silvestrini
    📅 Date: 17/03/2026
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
      jq \
      bridge-utils \
      cloud-init

  # Cloud init
  sudo systemctl start cloud-init
  sudo systemctl enable cloud-init

  # yq installation (latest release)
  sudo wget -q https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
  sudo chmod +x /usr/bin/yq

  # User environment
  sudo cp -f configs/commons/.bashrc_debian .bashrc
  sudo cp -f configs/commons/.bashrc_debian /root/.bashrc
  sudo cp -f configs/commons/profile_debian /etc/profile.d/
  sudo chmod 644 /etc/profile.d/profile_debian
  sudo cp -f configs/commons/.vimrc .vimrc
  sudo cp -f configs/commons/.vimrc /root/.vimrc
  
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
sudo mkdir -p /etc/ssh/sshd_config.d
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
Host 192.168.0.133
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

# ===========================
# cloud-init configuration 
# ===========================
# sudo cp -f configs/cloud-init/9_hostname.cfg /etc/cloud/cloud.cfg.d
# sudo cp -f configs/cloud-init/10_commands.cfg /etc/cloud/cloud.cfg.d
# sudo cp -f configs/cloud-init/11_packages.cfg /etc/cloud/cloud.cfg.d
# sudo cp -f configs/cloud-init/12_users.cfg /etc/cloud/cloud.cfg.d
# sudo cp -f configs/cloud-init/99_fake-cloud.cfg /etc/cloud/cloud.cfg.d
# sudo chmod 644 /etc/cloud/cloud.cfg.d/*.cfg

# ===========================
# Finalization
# ===========================
echo "✅ Cloud-init configuration and environment setup complete."
# End of script
