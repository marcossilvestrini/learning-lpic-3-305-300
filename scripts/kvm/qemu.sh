#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: none
    Description: Script for set QEMU Environment
    Author: Marcos Silvestrini
    Date: 24/03/2025
MULTILINE-COMMENT

# Set language/locale and encoding
export LANG=C

# Set workdir
cd /home/vagrant || exit

# Install qemu
apt update -y
apt install qemu-system-x86 -y

# Configure network bridge
cp -f configs/kvm/network/qemubr0 /etc/network/interfaces.d/
mkdir -p /etc/qemu
echo "allow qemubr0" | sudo tee /etc/qemu/bridge.conf
chmod u+s /usr/lib/qemu/qemu-bridge-helper

# bash completion

# Download qemu bash completion script
curl -o /etc/bash_completion.d/qemu \
  https://raw.githubusercontent.com/GArik/bash-completion/master/completions/qemu

# Set execution permission
chmod +x /etc/bash_completion.d/qemu

# Enable qemu completion for vagrant user if not already set
grep -qxF 'source /etc/bash_completion.d/qemu' /home/vagrant/.bashrc || \
echo 'source /etc/bash_completion.d/qemu' | tee -a /home/vagrant/.bashrc > /dev/null

# Enable qemu completion for root user if not already set
grep -qxF 'source /etc/bash_completion.d/qemu' /root/.bashrc || \
echo 'source /etc/bash_completion.d/qemu' | tee -a /root/.bashrc > /dev/null
