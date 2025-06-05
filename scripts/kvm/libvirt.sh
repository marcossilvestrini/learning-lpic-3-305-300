#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: none
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
    libguestfs-tools \
    libosinfo-bin \
    virt-v2v

# Add user to libvirt group
usermod -aG libvirt vagrant
usermod -aG libvirt-qemu vagrant
usermod -aG kvm vagrant

# -------------------------------------------------
# Set libvirt default URI for vagrant user
# -------------------------------------------------

# Use environment variable LIBVIRT_DEFAULT_URI
# Uncomment the following lines if you want to set the environment variable in the user's shell configuration files

#echo "export LIBVIRT_DEFAULT_URI=qemu:///system" >> /home/vagrant/.bashrc
#echo "export LIBVIRT_DEFAULT_URI=qemu:///system" >> /home/vagrant/.bash_profile
#echo "export LIBVIRT_DEFAULT_URI=qemu:///system" >> /home/vagrant/.profile
#echo "export LIBVIRT_DEFAULT_URI=qemu:///system" >> /home/vagrant/.bash_login

# Use configuration file

# Create the configuration directory if it does not exist
if [ ! -d /home/vagrant/.config/libvirt ]; then
    mkdir -p /home/vagrant/.config/libvirt 
fi

# Create the libvirt configuration file

# qemu KVM local
tee /home/vagrant/.config/libvirt/libvirt.conf > /dev/null <<EOF
uri_default = "qemu:///system"
EOF

# for xen server remote, uncomment the first block
#cp configs/kvm/libvirt/libvirt-xen.conf /etc/libvirt/libvirt.conf
#tee /home/vagrant/.config/libvirt/libvirt.conf > /dev/null <<EOF
#uri_default = "xen+ssh://vagrant@192.168.0.130"
#EOF

# set permissions for the configuration directory
chown -R vagrant:vagrant /home/vagrant/.config/libvirt
chmod +x /home/vagrant

# restart libvirt service
systemctl restart libvirtd

# enable libvirt network
virsh net-start default
virsh net-autostart default
