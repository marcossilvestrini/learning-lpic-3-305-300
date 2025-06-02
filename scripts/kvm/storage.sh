#!/bin/bash

<<'MULTILINE-COMMENT'
    Requirements: none
    Description: Idempotent Script to set Storage for Libvirt KVM Client (XFS version)
    Author: Marcos Silvestrini
    Date: 13/05/2025
MULTILINE-COMMENT

export LANG=C
cd /home/vagrant || exit

echo "SET STORAGE FOR LIBVIRT KVM CLIENT (XFS)..."

# Detect secondary disk
echo "Detecting secondary disk..."
CHECK_SDA=$(lsblk | grep sda1)
if [[ -z "$CHECK_SDA" ]]; then
    DISK="/dev/sda"
else
    DISK="/dev/sdb"
fi

echo "Selected disk for storage: $DISK"
[ ! -b "$DISK" ] && { echo "ERROR: $DISK not found."; exit 1; }

# Check if VG already exists
if sudo vgdisplay vg_libvirt > /dev/null 2>&1; then
    echo "Volume group vg_libvirt already exists. Skipping LVM creation."
else
    echo "Creating LVM structure on $DISK..."
    sudo pvcreate "$DISK"
    sudo vgcreate vg_libvirt "$DISK"
    sudo lvcreate -L 100G -n lpic3-libvirt-guest-disk vg_libvirt
fi

# Activate volumes
sudo vgchange -ay vg_libvirt
sudo lvchange -ay /dev/vg_libvirt/lpic3-libvirt-guest-disk
sudo udevadm settle

# Check if mounted
if mount | grep -q "/var/lib/libvirt/images"; then
    echo "/var/lib/libvirt/images already mounted. Skipping format and mount."
else
    echo "Formatting and mounting volume..."

    # Force mkfs only if filesystem is missing
    sudo mkfs.xfs -f /dev/vg_libvirt/lpic3-libvirt-guest-disk
    sudo mkdir -p /var/lib/libvirt/images
    chown -R vagrant:vagrant /var/lib/libvirt/images
    sudo mount /dev/vg_libvirt/lpic3-libvirt-guest-disk /var/lib/libvirt/images

    # Avoid duplicate fstab entry
    grep -q "/var/lib/libvirt/images" /etc/fstab || \
    echo "/dev/vg_libvirt/lpic3-libvirt-guest-disk /var/lib/libvirt/images xfs defaults 0 0" | sudo tee -a /etc/fstab
fi

# Check if libvirt pool default exists
if virsh pool-list --all | grep -q "default"; then
    echo "Libvirt storage pool 'default' already exists. Skipping creation."
else
    echo "Creating libvirt storage pool 'default'..."
    virsh pool-define-as --name default --type dir --target /var/lib/libvirt/images
    virsh pool-autostart default
fi

# Ensure pool default is started
virsh pool-start default > /dev/null 2>&1 || echo "Libvirt pool 'default' is already active."

# Check if libvirt pool os-images exists
if virsh pool-list --all | grep -q "os-images"; then
    echo "Libvirt storage pool 'os-images' already exists. Skipping creation."
else
    echo "Creating libvirt storage pool 'os-images'..."
    virsh pool-define-as --name os-images --type dir --target /home/vagrant/os-images/Debian_12.0.0_VMM
    virsh pool-autostart os-images
fi

# Ensure pool os-images is started
virsh pool-start os-images > /dev/null 2>&1 || echo "Libvirt pool 'os-images' is already active."

# Final report
echo "Storage configuration completed:"
lsblk
virsh pool-list
