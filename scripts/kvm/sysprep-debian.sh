#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: libvirt
    Description: Script to configure Debian Domain
    Author: Marcos Silvestrini
    Date: 19/03/2025
MULTILINE-COMMENT

# Set system language and locale
export LANG=C

# lease ip address for ens3
/sbin/dhclient ens3
