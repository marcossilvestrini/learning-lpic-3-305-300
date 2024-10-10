#!/bin/bash

<<'MULTILINE-COMMENT'
    Requirments: none
    Description: Script for set environment for labs
    Author: Marcos Silvestrini
    Date: 20/02/2023
MULTILINE-COMMENT

# Set language/locale and encoding
export LANG=C

cd /home/vagrant || exit

# Get the contents of the release files
RELEASE_INFO=$(cat /etc/*release 2>/dev/null)

# Check Operation System
if echo "$RELEASE_INFO" | grep -q -i "debian\|ubuntu"; then
    # Debian and Ubuntu
    echo "This is a Debian or Ubuntu-based distribution."    
    ## Install packages
    sudo apt install -y  \
        dos2unix

    # Oracle Linux
    elif echo "$RELEASE_INFO" | grep -q -i "oracle"; then
    echo "This is an Oracle Linux distribution."    
    ## Install packages
    sudo dnf install -y \
        dos2unix

    # Rocky Linux
    elif echo "$RELEASE_INFO" | grep -q -i "rocky"; then
    echo "This is an Rocky Linux distribution."    
        
    ## Install packages
    sudo dnf install -y \
        dos2unix

    ## Clear vagrant settings
    if [ -f "/etc/ssh/sshd_config.d/50-redhat.conf" ]; then
        sudo rm /etc/ssh/sshd_config.d/50-redhat.conf
    fi
    if [ -f "/etc/ssh/sshd_config.d/90-redhat.conf" ]; then
        sudo rm /etc/ssh/sshd_config.d/90-redhat.conf
    fi    
else
    echo "This distribution is not Debian, Ubuntu,Rocky Linux or Oracle Linux."
fi

# Set dns\hosts
#sudo hostnamectl set-hostname novo-nome-host
sudo cp -f configs/commons/hosts /etc/

# Set custom ssh configs
sudo cp -f configs/commons/01-sshd-custom.conf /etc/ssh/sshd_config.d
sudo chmod 644 /etc/ssh/sshd_config.d/01-sshd-custom.conf
sudo systemctl restart sshd

# Set ssh
AUTHORIZED_KEYS_FILE=".ssh/authorized_keys"
PUBLIC_KEY_FILE="security/skynet-key-ecdsa.pub"
if grep -q -F -f "$PUBLIC_KEY_FILE" "$AUTHORIZED_KEYS_FILE"; then
    echo "The public key is present in the authorized_keys file."
else
    echo "The public key for ansible is not present in the authorized_keys file...Setting file..."
    cat security/skynet-key-ecdsa.pub >>.ssh/authorized_keys
fi
