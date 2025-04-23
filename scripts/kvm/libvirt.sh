#!/bin/bash

<<'MULTILINE-COMMENT'
    Requirments: none
    Description: Script for set Libvirt Environment
    Author: Marcos Silvestrini
    Date: 22/04/2025
MULTILINE-COMMENT

# Set language/locale and encoding
export LANG=C

# Set workdir
cd /home/vagrant || exit

# Install qemu
apt update -y
apt install -y \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    virt-manager \
    virtinst \
    libguestfs-tools   

# Add user to libvirt group
usermod -aG libvirt vagrant
usermod -aG libvirt-qemu vagrant
usermod -aG kvm vagrant
