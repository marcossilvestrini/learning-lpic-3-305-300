#!/bin/bash

# Configure  eth1 routes permanently
cp -f configs/network/configure-network-instance2.service  /etc/systemd/system/configure-network.service
systemctl daemon-reload
systemctl enable configure-network.service
systemctl start configure-network.service

# Create xen bridge network
cp -f configs/network/xenbr0-instance2  /etc/network/interfaces.d/xenbr0
