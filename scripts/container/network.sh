#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: none
    Description: Script for set Network Container Environment
    Author: Marcos Silvestrini
    Date: 05/06/2025
MULTILINE-COMMENT

# Configure  eth1 routes permanently
cp -f configs/container/network/configure-network.service  /etc/systemd/system
systemctl daemon-reload
systemctl enable configure-network.service
systemctl start configure-network.service
