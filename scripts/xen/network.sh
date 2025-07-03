#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: none
    Description: Script for set Network Xen
    Author: Marcos Silvestrini
    Date: 09/01/2025
MULTILINE-COMMENT

# Set language/locale and encoding
export LANG=C

# Configure  eth1 routes permanently
cp -f configs/xen/network/configure-network.service  /etc/systemd/system
systemctl daemon-reload
systemctl enable configure-network.service
systemctl start configure-network.service

# Create xen bridge network
cp -f configs/xen/network/xenbr0  /etc/network/interfaces.d
