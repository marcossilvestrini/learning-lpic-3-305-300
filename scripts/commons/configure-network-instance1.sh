#!/bin/bash
sudo cp -f  configs/commons/configure-network-instance1.service  /etc/systemd/system/configure-network.service
sudo systemctl daemon-reload
sudo systemctl enable configure-network.service
sudo systemctl start configure-network.service
