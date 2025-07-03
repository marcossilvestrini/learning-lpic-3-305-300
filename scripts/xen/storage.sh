#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: none
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

# clear lvm
echo "y" | lvremove lpic3-pv-guest-disk vg_xen > /dev/null 2>&1
echo "y" | lvremove lpic3-hvm-guest-disk vg_xen > /dev/null 2>&1
echo "y" | vgremove vg_xen > /dev/null 2>&1
echo "y" | pvremove "$DISK" > /dev/null 2>&1

# create pv
pvscan
pvcreate "$DISK" > /dev/null 2>&1

# create vg
vgscan
vgcreate vg_xen "$DISK" > /dev/null 2>&1

# create lv for hvm guest
# lvscan
lvcreate -L 60G -n lpic3-hvm-guest-disk vg_xen

# create lv for pv guest
#lvscan
lvcreate -L 60G -n lpic3-pv-guest-disk vg_xen

# activate vg and lvs if necessary
vgchange -ay vg_xen
lvchange -ay /dev/vg_xen/lpic3-hvm-guest-disk
lvchange -ay /dev/vg_xen/lpic3-pv-guest-disk
udevadm settle

# check lvs
lsblk