# HVM Domain Debian Server

## Fully Automated Installation (no manual boot menu)

```sh
# 1) Extract installer kernel/initrd from Debian ISO (once)
sudo mkdir -p /var/lib/xen/boot/debian12 /mnt/debian-iso
sudo mount -o loop /home/vagrant/isos/debian/debian-12.8.0-amd64-DVD-1.iso /mnt/debian-iso
sudo cp -f /mnt/debian-iso/install.amd/vmlinuz /var/lib/xen/boot/debian12/
sudo cp -f /mnt/debian-iso/install.amd/initrd.gz /var/lib/xen/boot/debian12/
sudo umount /mnt/debian-iso

# 2) Start local HTTP server for preseed.cfg
cd configs/xen/hvm/debian
python3 -m http.server 8000

# 3) Create domain with unattended install profile
sudo xl create configs/xen/hvm/debian/lpic3-hvm-guest-debian-auto.cfg

# 4) Observe installation
sudo xl console <domain_id> # or VNC

# 5) After installation, boot with runtime profile (disk only)
sudo xl create configs/xen/hvm/debian/lpic3-hvm-guest-debian.cfg
sudo xl console <domain_id>
```

Notes:
- `lpic3-hvm-guest-debian-auto.cfg` uses HVM direct kernel boot plus:
  - `cmdline = "auto=true priority=critical preseed/url=http://192.168.0.130:8000/preseed.cfg ..."`
- `lpic3-hvm-guest-debian.cfg` is runtime-only and boots from disk (`boot = "c"`).
