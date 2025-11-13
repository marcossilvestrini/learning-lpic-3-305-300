#!/bin/bash

: <<'MULTILINE-COMMENT'
    📝 Requirements: none
    📚 Description: Script for set Network Kubernetes Environment
    👤 Author: Marcos Silvestrini
    📅 Date: 12/11/2025
MULTILINE-COMMENT

# 🌐 Configure eth1 routes permanently - kubernetes
cp -f configs/kubernetes/network/configure-network.service  /etc/systemd/system/configure-network.service
systemctl daemon-reload
systemctl enable configure-network.service
systemctl start configure-network.service
