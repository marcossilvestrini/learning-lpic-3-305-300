#!/bin/bash

<<'MULTILINE-COMMENT'
    Requirments: none
    Description: Script for set Network Xen
    Author: Marcos Silvestrini
    Date: 09/01/2025
MULTILINE-COMMENT

# Set language/locale and encoding
export LANG=C

# Configure  eth1 routes permanently
cp -f configs/network/configure-network-instance1.service  /etc/systemd/system/configure-network.service
systemctl daemon-reload
systemctl enable configure-network.service
systemctl start configure-network.service

# Create xen bridge network
cp -f configs/network/xenbr0-instance1  /etc/network/interfaces.d/xenbr0
