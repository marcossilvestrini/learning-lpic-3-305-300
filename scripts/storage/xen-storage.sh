#!/bin/bash

<<'MULTILINE-COMMENT'
    Requirments: none
    Description: Script for set Storage Xen
    Author: Marcos Silvestrini
    Date: 09/01/2025
MULTILINE-COMMENT

# Set language/locale and encoding
export LANG=C

cd /home/vagrant || exit

echo "SET STORAGE FOR XEN..."

# Set Storage (device /dev/sdX)
CHECK_SDA=$(lsblk |grep  sda1)
if [[ $CHECK_SDA == "" ]];
then
    DISK="/dev/sda"
else
    DISK="/dev/sdb"
    
fi

# create pv
pvcreate "$DISK"

# create vg
vgcreate vg_xen "$DISK"

# create lv for hvm guest
#lvcreate -l +100%FREE -n lpic3-hvm-guest-disk  vg_xen
lvcreate -L 40G -n lpic3-hvm-guest-disk vg_xen
mkfs.ext4 /dev/vg_xen/lpic3-hvm-guest-disk

# validate user-data
cloud-init schema --config-file configs/xen/user-data

# generate ISO seed
cloud-localds -v isos/seed.iso configs/xen/user-data configs/xen/meta-data

# validate seed.iso
isoinfo -i isos/seed.iso -R -l
