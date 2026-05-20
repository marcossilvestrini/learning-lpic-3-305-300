#!/usr/bin/env bash
set -euo pipefail

CHROOT=/mnt/myenv

# create chroot environment
sudo mkdir -p "$CHROOT"/{bin,etc,lib,lib64,usr,dev,proc,sys,run,tmp}
sudo chmod 1777 "$CHROOT/tmp"

# copy bash
sudo cp -v --parents /bin/bash "$CHROOT"

# copy required libraries, including dynamic loader
ldd /bin/bash \
  | awk '
      $2 == "=>" { print $3 }
      $1 ~ /^\// { print $1 }
    ' \
  | sort -u \
  | xargs sudo cp -v --parents -t "$CHROOT"

# minimal files
sudo cp -v --parents /etc/passwd /etc/group /etc/nsswitch.conf "$CHROOT" 2>/dev/null || true
sudo cp -v --parents /etc/hosts /etc/resolv.conf "$CHROOT" 2>/dev/null || true

# mount pseudo-filesystems
sudo mountpoint -q "$CHROOT/dev"  || sudo mount --bind /dev "$CHROOT/dev"
sudo mountpoint -q "$CHROOT/proc" || sudo mount -t proc proc "$CHROOT/proc"
sudo mountpoint -q "$CHROOT/sys"  || sudo mount -t sysfs sys "$CHROOT/sys"
sudo mountpoint -q "$CHROOT/run"  || sudo mount -t tmpfs tmpfs "$CHROOT/run"

# copy additional commands: ls, cat, id, env
# for bin in /bin/ls /bin/cat /usr/bin/id /usr/bin/env; do
#   sudo cp -v --parents "$bin" /mnt/myenv
#   ldd "$bin" \
#     | awk '$2 == "=>" { print $3 } $1 ~ /^\// { print $1 }' \
#     | sort -u \
#     | xargs sudo cp -v --parents -t /mnt/myenv
# done

# enter chroot
sudo chroot "$CHROOT" /bin/bash