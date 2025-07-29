#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: none
    Description: Script to configure Container Environment (LXD via Snap)
    Author: Marcos Silvestrini
    Date: 06/06/2025
MULTILINE-COMMENT

# Export environment variables
export LANG=C
export DEBIAN_FRONTEND=noninteractive

# Script execution settings
set -euo pipefail
IFS=$'\n\t'

# Change to vagrant home directory
cd /home/vagrant || exit

# Detect OS release information
RELEASE_INFO=$(cat /etc/*release 2>/dev/null)

# Check for supported OS and install required packages
if echo "$RELEASE_INFO" | grep -q -i "debian\|ubuntu"; then
    echo "Debian/Ubuntu distribution detected."

    # Predefine answers for Postfix to avoid interactive prompts
    echo "postfix postfix/main_mailer_type string 'No configuration'" | sudo debconf-set-selections
    echo "postfix postfix/mailname string localhost" | sudo debconf-set-selections

    # Update and upgrade system packages
    sudo apt update -yqq && sudo apt -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confold" upgrade -yqq

    # Install required packages
    sudo apt \
        -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confold" \
        install -yqq \
        dos2unix \
        lvm2 \
        btrfs-progs \
        tree whois \
        xfce4 xfce4-goodies \
        tightvncserver dbus-x11 \
        bridge-utils \
        stress-ng \
        libcap-ng-utils \
        tcpdump \
        jq \
        git \
        debootstrap \
        cgroup-tools \
        runc \
        snapd \
        lxc

    # Enable and start snap service
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap || true

    # Remove old LXD versions (APT)
    sudo apt remove --purge -y lxd lxd-client || true

    # Install latest LXD from Snap
    sudo snap install lxd --channel=latest/stable

    # Add user 'vagrant' to 'lxd' group
    sudo usermod -aG lxd vagrant

    # Copy default shell and editor configs
    sudo cp -f configs/commons/.bashrc_debian .bashrc
    sudo cp -f configs/commons/.bashrc_debian /root/.bashrc
    sudo cp -f configs/commons/profile_debian /etc/profile.d/
    sudo chmod 644 /etc/profile.d/profile_debian
    sudo cp -f configs/commons/.vimrc .vimrc
    sudo cp -f configs/commons/.vimrc /root/.vimrc

    # Configure VNC for vagrant user
    touch .Xresources
    PASSWORD="vagrant"
    mkdir -p .vnc
    echo -e "$PASSWORD\n$PASSWORD" | vncpasswd -f >~/.vnc/passwd
    chmod 600 ~/.vnc/passwd
    vncserver
    vncserver -kill :1
    killall Xtightvnc >/dev/null 2>&1
    sudo cp configs/vnc/vncserver@.service /etc/systemd/system/vncserver@:1.service
    sudo systemctl daemon-reload
    sudo systemctl enable vncserver@:1.service
    sudo systemctl start vncserver@:1.service

elif echo "$RELEASE_INFO" | grep -q -i "oracle"; then
    echo "Oracle Linux distribution detected."
    sudo dnf install -y dos2unix

elif echo "$RELEASE_INFO" | grep -q -i "rocky"; then
    echo "Rocky Linux distribution detected."
    sudo dnf install -y dos2unix
    [ -f "/etc/ssh/sshd_config.d/50-redhat.conf" ] && sudo rm /etc/ssh/sshd_config.d/50-redhat.conf
    [ -f "/etc/ssh/sshd_config.d/90-redhat.conf" ] && sudo rm /etc/ssh/sshd_config.d/90-redhat.conf

else
    echo "Unsupported distribution."
fi

# -------------------------------------------------
# Apply persistent sysctl configuration
# -------------------------------------------------
SYSCTL_CONF="/etc/sysctl.conf"

# Ensure net.ipv4.ip_forward=1
if grep -q '^net.ipv4.ip_forward' "$SYSCTL_CONF"; then
    sudo sed -i 's|^net.ipv4.ip_forward=.*|net.ipv4.ip_forward=1|' "$SYSCTL_CONF"
else
    echo "net.ipv4.ip_forward=1" | sudo tee -a "$SYSCTL_CONF"
fi

# Apply sysctl changes immediately
sudo sysctl -p "$SYSCTL_CONF"

# -------------------------------------------------
# SSH key configuration
# -------------------------------------------------
AUTHORIZED_KEYS_FILE=".ssh/authorized_keys"
PUBLIC_KEY_FILE="security/skynet-key-ecdsa.pub"
PRIVATE_KEY_FILE="security/skynet-key-ecdsa"

cp -f $PRIVATE_KEY_FILE "$HOME/.ssh"
sudo chmod 600 "$HOME/.ssh/skynet-key-ecdsa"

cp -f $PUBLIC_KEY_FILE "$HOME/.ssh"
sudo chmod 644 "$HOME/.ssh/skynet-key-ecdsa.pub"

if grep -q -F -f "$PUBLIC_KEY_FILE" "$AUTHORIZED_KEYS_FILE"; then
    echo "The public key is present in the authorized_keys file."
else
    echo "The public key is not present. Adding key to authorized_keys file..."
    cat "$PUBLIC_KEY_FILE" >> "$AUTHORIZED_KEYS_FILE"
fi

# Restart SSH services
sudo systemctl restart sshd
sudo systemctl restart ssh
