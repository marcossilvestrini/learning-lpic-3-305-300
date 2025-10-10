# CentOS Stream Administration Guide

![CentOS](https://user-images.githubusercontent.com/62715900/96582746-2047ff00-12b2-11eb-82e4-bd121ae654e1.png)

CentOS Stream tracks just ahead of Red Hat Enterprise Linux (RHEL), making it
ideal for previewing upcoming enterprise updates while maintaining API
stability. This guide summarizes the workflows required to run CentOS in
production-like environments.

## Snapshot
- **Base family:** RHEL rolling preview (Stream 8/9)
- **Kernel:** Enterprise Linux kernel with backported fixes
- **Release cadence:** Continuous minor updates; point-in-time ISOs available
- **Primary targets:** Application servers, CI/CD validation, homelabs
- **Subscription:** No subscription required; integrates seamlessly with RHEL

## Package Ecosystem
### Core Tools
- `dnf` — primary package manager with modularity support.
- `yum` — compatibility wrapper (points to `dnf` on CentOS Stream 8+).
- `rpm` — low-level tooling to query and verify individual packages.
- Repositories live in `/etc/yum.repos.d/*.repo`.

### Daily Package Tasks
| Goal | Command | Notes |
| --- | --- | --- |
| Refresh metadata | `sudo dnf makecache` | `sudo dnf clean all` clears stale caches. |
| Apply updates | `sudo dnf update` | Use `--security` to limit to errata. |
| Install software | `sudo dnf install pkg` | Add `--enablerepo=<repo>` for optional channels. |
| Remove software | `sudo dnf remove pkg` | `autoremove` prunes unused dependencies. |
| Query packages | `dnf info pkg`, `dnf list installed` | `dnf provides /path/file` resolves owning package. |
| Work with RPMs | `sudo rpm -ivh package.rpm`, `rpm -ql pkg` | Verify signatures: `rpm -K package.rpm`. |

### Repository Hygiene
- Enable AppStream modules: `sudo dnf module list`, `sudo dnf module enable postgresql:14`.
- Install EPEL: `sudo dnf install epel-release`.
- Mirror locally using `createrepo_c` and `dnf reposync`.

## Base Configuration
1. Update first: `sudo dnf update -y && sudo reboot`.
2. Configure SELinux (default enforcing). Status via `sestatus`.
3. Time sync with `chrony`: `sudo timedatectl set-timezone`, `chronyc sources`.
4. Enable firewall: `sudo systemctl enable --now firewalld`, manage with
   `sudo firewall-cmd --permanent --add-service=http`.
5. Add administrative users: `sudo useradd --groups wheel name`
   and `sudo passwd name`.

## System Management
### Services and Logs
- `systemctl status service`, `systemctl enable`, `systemctl restart`.
- Logs: `journalctl -u service`, `journalctl --since "yesterday"`.
- Persistent logs enabled by default in `/var/log/journal/`.

### Storage
- Manage partitions with `parted` or `gdisk`; filesystems via `mkfs.xfs`,
  `mkfs.ext4`.
- LVM workflow: `pvcreate`, `vgcreate`, `lvcreate`, `lvextend`, `xfs_growfs`.
- Automount via `/etc/fstab`; test with `sudo mount -a`.

### Networking
- Configuration files: `/etc/NetworkManager/system-connections/` (nmcli) or
  `/etc/sysconfig/network-scripts/` (legacy).
- Commands: `nmcli device status`, `nmcli connection modify`.
- Firewall: `firewall-cmd --list-services`, `--add-rich-rule`.
- SELinux ports: `sudo semanage port -l`, `sudo semanage port -a`.

## Server Role Playbooks
### Web Stack
- **Apache HTTP Server:** `sudo dnf install httpd`; config in `/etc/httpd/conf`
  with vhosts under `/etc/httpd/conf.d/`. Manage service with
  `sudo systemctl enable --now httpd`.
- **Nginx:** enable EPEL, then `sudo dnf install nginx`. Server blocks in
  `/etc/nginx/conf.d/`. Validate config: `sudo nginx -t`.
- **TLS:** `sudo dnf install certbot python3-certbot-apache|nginx`, request
  certs with `sudo certbot --apache`.

### Databases
- **MariaDB:** `sudo dnf install mariadb-server`; secure with
  `sudo mysql_secure_installation`.
- **PostgreSQL:** enable desired module (`postgresql:13`, `postgresql:14`), then
  `sudo dnf install @postgresql:14`. Initialize with `sudo postgresql-setup --initdb`.
- **Backup:** `mysqldump`, `mariabackup`, `pg_dump`, `pg_basebackup`.

### Filesystem & Sharing
- **NFS Server:** `sudo dnf install nfs-utils`; exports in `/etc/exports`,
  apply with `sudo exportfs -ra`, manage services `nfs-server`, `rpcbind`.
- **NFS Client:** `sudo dnf install nfs-utils`; mount with
  `sudo mount -t nfs server:/share /mnt/share`.
- **Samba:** `sudo dnf install samba samba-common`; configure `/etc/samba/smb.conf`.
  Create users via `sudo smbpasswd -a user`, set SELinux context with
  `sudo chcon -t samba_share_t /share`.

### Directory Services
- **FreeIPA client:** `sudo dnf install freeipa-client`, enroll with
  `sudo ipa-client-install`.
- **OpenLDAP:** `sudo dnf install openldap-servers openldap-clients`;
  start `slapd`, configure using `ldapmodify` and LDIF files.

## Monitoring and Troubleshooting
- Resource usage: `top`, `htop`, `dstat`, `glances`.
- SELinux troubleshooting: `sudo sealert -a /var/log/audit/audit.log`.
- Network: `ss -tulpn`, `sudo tcpdump`, `nmap`, `chronyc tracking`.
- Package verification: `rpm -Va`, `dnf repoquery --duplicates`.
- System snapshots: `sudo dnf install timeshift` (desktop) or leverage LVM
  snapshots/Btrfs (Stream 9 default).

## References
- CentOS Stream Docs: <https://centos.org/centos-stream/>
- RHEL System Roles: <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/>
- SELinux Project: <https://selinuxproject.org/>
- EPEL Overview: <https://fedoraproject.org/wiki/EPEL>

## Maintainer
- Marcos Silvestrini — marcos.silvestrini@gmail.com
