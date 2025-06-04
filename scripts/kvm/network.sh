#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: none
    Description: Script for set Network KVM QEMU
    Author: Marcos Silvestrini
    Date: 19/03/2025
MULTILINE-COMMENT

# Configure  eth1 routes permanently
cp -f configs/kvm/network/configure-network.service  /etc/systemd/system
systemctl daemon-reload
systemctl enable configure-network.service
systemctl start configure-network.service
