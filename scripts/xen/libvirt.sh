#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: none
    Description: Script for set Xen Libvirt Environment
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
    libguestfs-tools \
    libvirt-daemon-driver-xen \
    libosinfo-bin

# Disable libvirt sockets for enable tcp connections
systemctl mask libvirtd.socket libvirtd-ro.socket libvirtd-admin.socket libvirtd-tls.socket libvirtd-tcp.socket

# Enable libvirt tcp connections
cp configs/xen/libvirt/libvirtd.conf /etc/libvirt/
cp configs/xen/libvirt/libvirtd /etc/default
systemctl restart libvirtd

# Add user to libvirt group
usermod -aG libvirt vagrant
usermod -aG libvirt-qemu vagrant
usermod -aG kvm vagrant
