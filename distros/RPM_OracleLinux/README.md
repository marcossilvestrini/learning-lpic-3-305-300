# Oracle Linux Administration Guide

![Oracle Linux](https://user-images.githubusercontent.com/62715900/120249678-08762780-c252-11eb-8756-529136b9e546.png)

Oracle Linux provides an enterprise-grade platform built on RHEL sources with
optional Unbreakable Enterprise Kernel (UEK), Ksplice zero-downtime updates,
and tight Oracle Cloud integration. This guide outlines day-to-day operations
for Oracle Linux environments.

## Snapshot
- **Base family:** RHEL-compatible (Oracle Linux, UEK & Red Hat Compatible Kernel)
- **Support model:** Free to use and distribute; paid support adds Ksplice/OCM
- **Release cadence:** Aligns with RHEL minor releases; UEK updates more frequent
- **Primary targets:** Oracle Cloud Infrastructure (OCI), Oracle DB workloads,
  enterprise virtualization

## Package Ecosystem
### Core Tools
- `dnf` and `yum` — primary package managers (Oracle Linux 8+ uses `dnf`).
- `rpm` — low-level package queries and verification.
- ULN (Unbreakable Linux Network) — subscription repos for Oracle customers.
- Additional repos under `/etc/yum.repos.d/oracle*.repo` (CodeReady, EPEL, etc.).

### Daily Package Tasks
| Goal | Command | Notes |
| --- | --- | --- |
| Sync repositories | `sudo dnf makecache` | ULN-enabled systems use `uln-yum-mirror`. |
| Apply updates | `sudo dnf update` | Combine with `sudo ksplice uptrack-upgrade` for live patching. |
| Install software | `sudo dnf install pkg` | Add `--enablerepo=ol8_codeready_builder` etc. when needed. |
| Remove software | `sudo dnf remove pkg` | `dnf autoremove` cleans dependencies. |
| Work with RPMs | `sudo rpm -ivh package.rpm`, `rpm -qi pkg` | Validate with `rpm -K package.rpm`. |

### Repository Notes
- Register with ULN: `sudo uln_register`.
- Add UEK channels: enable `ol8_UEKR7` (or version-specific) repo.
- Third-party packages: enable `EPEL` via `sudo dnf install oracle-epel-release`.

## Base Configuration
1. Update base system: `sudo dnf update -y && sudo reboot`.
2. Select kernel at boot: `sudo grubby --set-default /boot/vmlinuz-<kernel>`.
3. Enable Ksplice (subscription): `sudo ksplice uptrack-install`.
4. Configure firewall: `sudo systemctl enable --now firewalld`;
   allow services with `sudo firewall-cmd --permanent --add-service=ssh`.
5. Harden SSH and add administrative users (`wheel` group).

## System Management
### Services & Logs
- systemd operations: `systemctl status`, `systemctl enable`, `systemctl restart`.
- Logs: `journalctl -u service`, `/var/log/messages`, `/var/log/secure`.
- SELinux: Enforcing by default; check with `sestatus` and manage booleans using
  `sudo setsebool -P`.

### Storage
- OCFS2/ASM for Oracle DB: packages under `oraclelinux-developer-release`.
- LVM workflows (`pvcreate`, `vgcreate`, `lvcreate`, `lvextend`), filesystem
  growth via `xfs_growfs` or `resize2fs`.
- iSCSI utilities: `sudo dnf install iscsi-initiator-utils`.

### Networking
- Network scripts: `/etc/sysconfig/network-scripts/ifcfg-*`.
- NetworkManager CLI: `nmcli connection show`, `nmcli connection add`.
- FirewallD zones: `firewall-cmd --get-zones`, adjust per interface.
- High availability: leverage `corosync`, `pacemaker`, and Oracle Clusterware.

## Server Role Playbooks
### Oracle Database Hosts
- Install prerequisites: `sudo dnf install oracle-database-preinstall-19c`.
- Configure hugepages, shared memory, and ASM disks per install guides.
- Use `oracleasm configure` and `oracleasm createdisk` for ASM storage.

### Web & Application Servers
- **Apache:** `sudo dnf install httpd`; config under `/etc/httpd/conf.d`.
- **Nginx:** enable EPEL/CodeReady, `sudo dnf install nginx`.
- **Tomcat/Java:** `sudo dnf install tomcat`, manage with `systemctl`.

### Filesystem & Shares
- **NFS:** `sudo dnf install nfs-utils`; exports in `/etc/exports`.
- **Samba:** `sudo dnf install samba samba-client`; configure `/etc/samba/smb.conf`,
  adjust SELinux contexts (`sudo chcon -t samba_share_t /share`).
- **iSCSI target:** `sudo dnf install targetcli-fb`; configure via `sudo targetcli`.

### Management & Monitoring
- **Oracle Enterprise Manager agents:** install via OEM console packages.
- **OCI CLI/SDK:** `sudo dnf install oraclelinux-oci-cli`.
- **Glance** at metrics with `dnf install sysstat`, `pcp`, `netdata`.

## Troubleshooting Toolkit
- Kernel issues: `journalctl -k`, `sudo ksplice diagnose`.
- Performance: `tuned-adm profile throughput-performance`, `perf top`.
- Security: `sudo ausearch -m avc`, `sudo sealert -a /var/log/audit/audit.log`.
- Package drift: `rpm -Va`, `sudo dnf history list`, `sudo dnf history undo <id>`.

## Further Reading
- Oracle Linux Documentation: <https://docs.oracle.com/en/operating-systems/oracle-linux/>
- Ksplice User Guide: <https://docs.oracle.com/cd/E37670_01/>
- Oracle Database on Linux: <https://docs.oracle.com/en/database/>
- Oracle Linux Yum Server: <https://yum.oracle.com/>

## Maintainer
- Marcos Silvestrini — marcos.silvestrini@gmail.com
