#!/bin/bash

<<'MULTILINE-COMMENT'
    Requirements: none
    Description: Script to configure Xen Environment
    Author: Marcos Silvestrini
    Date: 09/01/2025
MULTILINE-COMMENT

# Set system language and locale
export LANG=C

# Change to vagrant home directory
cd /home/vagrant || exit

# Detect OS release information
RELEASE_INFO=$(cat /etc/*release 2>/dev/null)

# OS validation and package installation
if echo "$RELEASE_INFO" | grep -q -i "debian\|ubuntu"; then
    # Debian/Ubuntu distribution detected
    echo "This is a Debian or Ubuntu-based distribution."

    # Install required packages
    sudo apt update -y
    sudo apt install -y  \
        dos2unix \
        lvm2 \
        bridge-utils \
        tree \
        xfce4 xfce4-goodies \
        tightvncserver dbus-x11 \
        cloud-utils genisoimage cloud-init whois

    # Set user profile and bash/vim configuration
    sudo cp -f configs/commons/.bashrc_debian  .bashrc
    sudo cp -f configs/commons/.bashrc_debian  /root/.bashrc
    sudo cp -f configs/commons/profile_debian  /etc/profile.d/
    sudo chmod 644 /etc/profile.d/profile_debian
    sudo cp -f configs/commons/.vimrc  .vimrc
    sudo cp -f configs/commons/.vimrc  /root/.vimrc

    # Configure VNC server for vagrant user
    touch .Xresources  
    PASSWORD="vagrant"
    mkdir -p .vnc
    echo -e "$PASSWORD\n$PASSWORD" | vncpasswd -f > ~/.vnc/passwd
    chmod 600 ~/.vnc/passwd
    vncserver 
    vncserver -kill :1
    killall Xtightvnc  > /dev/null 2>&1      
    sudo cp configs/vnc/vncserver@.service /etc/systemd/system/vncserver@:1.service
    sudo systemctl daemon-reload
    sudo systemctl enable vncserver@:1.service
    sudo systemctl start vncserver@:1.service

elif echo "$RELEASE_INFO" | grep -q -i "oracle"; then
    # Oracle Linux detected
    echo "This is an Oracle Linux distribution."

    # Install base utilities
    sudo dnf install -y dos2unix

elif echo "$RELEASE_INFO" | grep -q -i "rocky"; then
    # Rocky Linux detected
    echo "This is a Rocky Linux distribution."

    # Install base utilities
    sudo dnf install -y dos2unix

    # Clean unwanted SSH configuration files
    if [ -f "/etc/ssh/sshd_config.d/50-redhat.conf" ]; then
        sudo rm /etc/ssh/sshd_config.d/50-redhat.conf
    fi
    if [ -f "/etc/ssh/sshd_config.d/90-redhat.conf" ]; then
        sudo rm /etc/ssh/sshd_config.d/90-redhat.conf
    fi

else
    # Unsupported OS detected
    echo "This distribution is not Debian, Ubuntu, Rocky Linux or Oracle Linux."
fi

# -------------------------------------------------
# Apply custom SSH server configuration
# -------------------------------------------------
sudo cp -f configs/commons/01-sshd-custom.conf /etc/ssh/sshd_config.d
sudo chmod 644 /etc/ssh/sshd_config.d/01-sshd-custom.conf

# -------------------------------------------------
# Copy SSH keys and ensure correct permissions
# -------------------------------------------------
AUTHORIZED_KEYS_FILE=".ssh/authorized_keys"
PUBLIC_KEY_FILE="security/skynet-key-ecdsa.pub"
PRIVATE_KEY_FILE="security/skynet-key-ecdsa"

cp -f $PRIVATE_KEY_FILE "$HOME/.ssh"
sudo chmod 600 "$HOME/.ssh/skynet-key-ecdsa"

cp -f $PUBLIC_KEY_FILE "$HOME/.ssh"
sudo chmod 644 "$HOME/.ssh/skynet-key-ecdsa.pub"

# Append public key to authorized_keys if not already present
if grep -q -F -f "$PUBLIC_KEY_FILE" "$AUTHORIZED_KEYS_FILE"; then
    echo "The public key is present in the authorized_keys file."
else
    echo "The public key for ansible is not present. Adding key to authorized_keys file..."
    cat "$PUBLIC_KEY_FILE" >> "$AUTHORIZED_KEYS_FILE"
fi

# Restart SSH service to apply changes
sudo systemctl restart sshd
sudo systemctl restart ssh

# -------------------------------------------------
# Set local hostname and DNS entries in /etc/hosts
# -------------------------------------------------
sudo cp -f configs/network/hosts /etc/
HOSTNAME=$(hostname)
IPV4=$(ip addr show | grep -oP '192\.168\.0\.\d{1,3}(?=/)')

if [ -z "$IPV4" ]; then
    echo "No IPv4 address matching 192.168.0.x found. Skipping hosts file update."
else
    if grep -q "$IPV4" /etc/hosts; then
        echo "An entry for $IPV4 already exists in /etc/hosts."
    else
        echo "$IPV4 $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
        echo "Added entry: $IPV4 $HOSTNAME"
    fi
fi
