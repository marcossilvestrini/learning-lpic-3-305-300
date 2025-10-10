# Ubuntu Administration Guide

![Ubuntu](https://user-images.githubusercontent.com/62715900/95467421-cf501680-0953-11eb-92f9-3c5fce92fcfb.png)

Ubuntu builds on Debian with opinionated defaults, predictable releases, and
first-class commercial support. This guide captures the high-value tasks for
deploying and operating Ubuntu Server or Desktop in enterprise environments.

## Snapshot
- **Base family:** Debian (with Ubuntu archives and PPAs)
- **Release cadence:** LTS every 2 years (5+5 year support), interim releases
  every 6 months
- **Kernel:** GA (generic) and HWE (hardware enablement) kernels
- **Primary flavors:** Server, Desktop, cloud images (cloud-init enabled)
- **Package archives:** `main`, `restricted`, `universe`, `multiverse`

## Package Ecosystem
### Core Tools
- `apt` / `apt-get` — package management front-end for `.deb`.
- `dpkg` — low-level package operations.
- `snap` — transactional packages maintained by Canonical.
- `flatpak` (optional) — third-party application sandboxing.
- `software-properties-common` — manages PPAs (`add-apt-repository`).

### Daily Package Tasks
| Goal | Command | Notes |
| --- | --- | --- |
| Refresh indexes | `sudo apt update` | Cloud images run `apt-get update` via cloud-init on first boot. |
| Upgrade packages | `sudo apt upgrade` | For kernel/HWE jumps use `sudo apt full-upgrade`. |
| Enable unattended updates | `sudo apt install unattended-upgrades` and tweak `/etc/apt/apt.conf.d/50unattended-upgrades`. | |
| Install software | `sudo apt install pkg` | Append `:arch` for multi-arch (e.g., `:i386`). |
| Snap management | `snap find name`, `sudo snap install pkg`, `sudo snap refresh`. | |
| Work with PPAs | `sudo add-apt-repository ppa:user/ppa-name` → `sudo apt update`. | |

### Repository Hygiene
- Canonical livepatch for LTS kernels: `sudo snap install canonical-livepatch`.
- Pin phases with `/etc/apt/preferences.d/` to lock to `focal`, `jammy`, etc.
- Audit third-party keys under `/etc/apt/trusted.gpg.d/`.

## Base Configuration
1. Update and reboot: `sudo apt update && sudo apt full-upgrade && sudo reboot`.
2. Create admin accounts: `sudo adduser name && sudo usermod -aG sudo name`.
3. Harden SSH: disable password login or enforce MFA via `PAM`.
4. Enable firewall: `sudo ufw enable`, then allow required services
   (`sudo ufw allow OpenSSH`).
5. Configure time sync: `timedatectl set-timezone Region/City`; `systemd-timesyncd`
   is enabled by default on Server.

## System Management
### Services and Logs
- `systemctl status service`, `systemctl enable`, `systemctl restart`.
- Logs live in `journalctl`, `sudo journalctl -u service`, `sudo journalctl -b`.
- Desktop logs: inspect `gnome-logs` or `~/.cache/upstart/` on older releases.

### Hardware & Kernel
- List hardware: `lsblk`, `lspci`, `lsusb`, `lshw`.
- Kernel variants: `sudo apt install linux-generic-hwe-22.04` for HWE stack.
- Apply livepatch (LTS only): `sudo canonical-livepatch enable <token>`.

### Networking
- Netplan YAML definitions under `/etc/netplan/`. Apply with `sudo netplan apply`.
- Inspect state: `ip addr`, `networkctl status`.
- Cloud-init adjustments: drop customizations in `/etc/cloud/cloud.cfg.d/`.
- Firewall: `sudo ufw status numbered`, `sudo ufw delete <rule>`.

## Desktop Notes
- Default desktop: GNOME on Wayland (X.Org fallback).
- Productivity stack: Firefox (Snap), LibreOffice, Thunderbird.
- Recommended creative tools: GIMP, Inkscape, Blender, Audacity.
- Manage additional drivers via `software-properties-gtk` (`ubuntu-drivers` CLI).

## Server Role Playbooks
### Web Stack
- **Apache HTTP Server:** `sudo apt install apache2`; mods in
  `/etc/apache2/mods-enabled/`. Manage vhosts via `a2ensite` / `a2dissite`.
- **Nginx:** `sudo apt install nginx`; site configs in
  `/etc/nginx/sites-available/`. Check syntax with `sudo nginx -t`.
- **Certbot:** `sudo snap install --classic certbot`; run
  `sudo certbot --apache` or `--nginx` for TLS automation.

### Databases
- **MySQL / MariaDB:** `sudo apt install mysql-server` or `mariadb-server`.
  Harden with `sudo mysql_secure_installation`.
- **PostgreSQL:** add PGDG repo for new majors, then
  `sudo apt install postgresql`. Manage service: `sudo systemctl status postgresql`.
- Backup: `mysqldump`, `xtrabackup`, `pg_dump`, `pg_basebackup`.

### Filesystem & Sharing
- **NFS Server:** `sudo apt install nfs-kernel-server`; exports in `/etc/exports`.
- **NFS Client:** `sudo apt install nfs-common`; mount using `sudo mount server:/path /mnt`.
- **Samba:** `sudo apt install samba`; define shares in `/etc/samba/smb.conf`,
  add Samba users with `sudo smbpasswd -a user`, restart `smbd nmbd`.

### Directory Services
- **OpenLDAP:** `sudo apt install slapd ldap-utils`; reconfigure with
  `sudo dpkg-reconfigure slapd`. Test bind: `ldapwhoami -H ldap:// -x`.
- **phpLDAPadmin:** `sudo apt install phpldapadmin`; set base DN and friendly
  name in `/etc/phpldapadmin/config.php`.

## Monitoring and Troubleshooting
- Processes: `top`, `htop`, `systemd-cgls`, `systemd-cgtop`.
- Storage: `df -h`, `lsblk`, `sudo ncdu /`.
- Network: `ss -tulpen`, `sudo tcpdump -i any`, `mtr`, `nmap`.
- Security: `sudo apparmor_status`, `sudo aa-status`, `ufw status`.
- Package issues: `apt-cache policy pkg`, `sudo apt install -f`, `sudo dpkg -C`.

## Further Reading
- Ubuntu Documentation: <https://documentation.ubuntu.com/>
- Ubuntu Server Guide: <https://ubuntu.com/server/docs>
- Hardening Checklist: <https://ubuntu.com/security/certifications/docs>
- Cloud Images: <https://cloud-images.ubuntu.com/>

## Maintainer
- Marcos Silvestrini — marcos.silvestrini@gmail.com
