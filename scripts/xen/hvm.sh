#!/bin/bash

<<'MULTILINE-COMMENT'
    Requirments: none
    Description: Script for set Domains HVM Guest for Xen
    Author: Marcos Silvestrini
    Date: 05/02/2025
MULTILINE-COMMENT

# Set language/locale and encoding
export LANG=C

cd /home/vagrant || exit

echo "SET HVM CONFIGURATIONS FOR XEN..."

# generate HVM files for ubuntu
#cloud-init schema --config-file configs/xen/hvm/ubuntu/user-data --annotate
cloud-init schema --config-file configs/xen/hvm/ubuntu/autoinstall.yaml --annotate
#cloud-localds -v isos/ubuntu/seed.iso configs/xen/hvm/ubuntu/user-data configs/xen/hvm/ubuntu/meta-data
rm -f isos/ubuntu/seed.iso
cloud-localds -v isos/ubuntu/seed.iso configs/xen/hvm/ubuntu/autoinstall.yaml configs/xen/hvm/ubuntu/meta-data
isoinfo -i isos/ubuntu/seed.iso -R -l
cp -f configs/xen/hvm/ubuntu/lpic3-hvm-guest-ubuntu.cfg /etc/xen

# generate HVM files for debian
mkisofs -o isos/debian/seed.iso -J -R -V "cidata" configs/xen/hvm/debian/preseed.cfg
isoinfo -i isos/debian/seed.iso -R -l
cp -f configs/xen/hvm/debian/lpic3-hvm-guest-debian.cfg /etc/xen
