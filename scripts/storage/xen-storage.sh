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
pvcreate "$DISK" > /dev/null 2>&1

# create vg
vgcreate vg_xen "$DISK" > /dev/null 2>&1

# create lv for hvm guest
echo "y" | lvremove lpic3-hvm-guest-disk vg_xen > /dev/null 2>&1
lvcreate -L 100G -n lpic3-hvm-guest-disk vg_xen
# echo "y"| mkfs.ext4 /dev/vg_xen/lpic3-hvm-guest-disk

# generate ISO seed for ubuntu
cloud-init schema --config-file configs/xen/hvm/ubuntu/user-data
cloud-localds -v isos/ubuntu/seed.iso configs/xen/hvm/ubuntu/user-data configs/xen/hvm/ubuntu/meta-data
isoinfo -i isos/ubuntu/seed.iso -R -l

# generate ISO seed for debian
mkisofs -o isos/debian/seed.iso -J -R -V "cidata" configs/xen/hvm/debian/preseed.cfg
isoinfo -i isos/debian/seed.iso -R -l
