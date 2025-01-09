#!/bin/bash
set -e

# create pv
pvcreate /dev/sdb

# create vg
vgcreate xen-vg /dev/sdb

# check vg exists
vgs