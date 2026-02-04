#!/bin/bash

: <<'MULTILINE-COMMENT'
    📝 Requirements: none
    📚 Description: Script for set Network Packer Environment
    👤 Author: Marcos Silvestrini
    📅 Date: 03/02/2026
MULTILINE-COMMENT

# 🌐 Configure eth1 routes permanently - kubernetes
cp -f configs/Packer/network/configure-network.service  /etc/systemd/system/configure-network.service
systemctl daemon-reload
systemctl enable configure-network.service
systemctl start configure-network.service
