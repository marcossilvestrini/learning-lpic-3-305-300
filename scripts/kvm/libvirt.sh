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

# Install libvirt
apt update -y
apt install -y \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    virt-manager \
    virtinst \
    libguestfs-tools   

# Configure libvirt uri for remote connection
#echo "export LIBVIRT_DEFAULT_URI=qemu:///system" >> /home/vagrant/.bashrc
#echo "export LIBVIRT_DEFAULT_URI=qemu:///system" >> /home/vagrant/.bash_profile
#echo "export LIBVIRT_DEFAULT_URI=qemu:///system" >> /home/vagrant/.profile
#echo "export LIBVIRT_DEFAULT_URI=qemu:///system" >> /home/vagrant/.bash_login
cp configs/kvm/libvirt/libvirt.conf /etc/libvirt/
systemctl restart libvirtd


# Add user to libvirt group
usermod -aG libvirt vagrant
usermod -aG libvirt-qemu vagrant
usermod -aG kvm vagrant
