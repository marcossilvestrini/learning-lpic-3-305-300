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
lvcreate -l +20%FREE -n lpic3-hvm-guest-disk  vg_xen

# # format lv with filesystem xfs
# mkfs.ext4 -L xen-storage /dev/mapper/vg_xen-lv_xen
