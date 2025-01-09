#!/bin/bash

# Update the package list
apt-get update

# Install the Xen hypervisor and necessary tools
apt-get install -y xen-hypervisor-amd64 xen-tools xen-utils-common xenstore-utils

# Add configuration to GRUB
if grep -q "GRUB_CMDLINE_XEN_DEFAULT" /etc/default/grub; then
  sed -i 's|^GRUB_CMDLINE_XEN_DEFAULT=.*|GRUB_CMDLINE_XEN_DEFAULT="dom0_max_vcpus=1 dom0_mem=1024M,max:1024M"|' /etc/default/grub
else
  echo 'GRUB_CMDLINE_XEN_DEFAULT="dom0_max_vcpus=1 dom0_mem=1024M,max:1024M"' >> /etc/default/grub
fi

# Update GRUB
update-grub

# Inform the user
echo "Xen installation and configuration completed. Please reboot the system to boot into Xen."
