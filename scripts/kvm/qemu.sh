#!/bin/bash

<<'MULTILINE-COMMENT'
    Requirments: none
    Description: Script for set QEMU Environment
    Author: Marcos Silvestrini
    Date: 24/03/2025
MULTILINE-COMMENT

# Set language/locale and encoding
export LANG=C

# Set workdir
cd /home/vagrant || exit

# Install qemu
sudo apt install qemu-system-x86 -y