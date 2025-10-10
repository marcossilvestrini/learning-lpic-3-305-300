# Fedora Administration Guide

![Fedora](https://user-images.githubusercontent.com/62715900/159807707-b5c2ec6a-491d-49f1-ba17-77441b99ae68.png)

Fedora is the upstream innovation hub for the Red Hat ecosystem, delivering a
rapid six-month cadence and modern tooling. Use this guide to keep Fedora Workstation
and Server deployments consistent and maintainable.

## Snapshot
- **Base family:** Fedora Linux (Workstation, Server, IoT, Kinoite, Silverblue)
- **Release cadence:** ~6 months; each release supported for 13 months
- **Package formats:** RPM/DNF, Flatpak, OCI images (Toolbx, Podman)
- **Default desktop:** GNOME on Wayland (Workstation spin)
- **Installer:** Anaconda with kickstart automation support

## Package Ecosystem
### Core Tools
- `dnf` — package management with modular streams and groups.
- `rpm` — low-level querying, verification, and manual installs.
- `flatpak` — sandboxed desktop applications from Flathub/Fedora remotes.
- `toolbx` — containerized development environments backed by OCI images.

### Daily Package Tasks
| Goal | Command | Notes |
| --- | --- | --- |
| Refresh metadata | `sudo dnf makecache` | Fedora auto-refreshes when needed. |
| Upgrade workspace | `sudo dnf upgrade --refresh` | Recommended weekly; reboots pick up kernel updates. |
| Install packages | `sudo dnf install pkg` | Use `dnf group list` / `dnf group install` for comps. |
| Remove packages | `sudo dnf remove pkg` | `dnf autoremove` prunes orphans. |
| Query packages | `dnf info pkg`, `dnf repoquery --whatprovides /usr/bin/foo` | |
| Flatpak workflow | `flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo` → `flatpak install app` | |

### Fedora Repositories
- Official repos configured in `/etc/yum.repos.d/fedora*.repo`.
- Enable additional codecs via `rpmfusion-free`/`rpmfusion-nonfree`.
- Use `copr` for community builds: `sudo dnf install dnf-plugins-core`,
  then `sudo dnf copr enable user/project`.

## Base Configuration
1. Apply updates: `sudo dnf upgrade --refresh`.
2. Enable automatic updates (optional): `sudo systemctl enable --now dnf-automatic.timer`.
3. Configure firewall: `sudo firewall-cmd --permanent --add-service=ssh`.
4. Time sync via `chrony` (enabled by default).
5. User management: `sudo useradd -G wheel username`; set password with `passwd`.

## System Management
### Services and Logs
- Manage services: `systemctl status`, `systemctl enable`, `systemctl restart`.
- Logs: `journalctl -xe`, `journalctl -u service`.
- Inspect boot issues with `journalctl -b -1`.

### Storage
- Btrfs is default on Workstation; use `btrfs filesystem df` and snapshots with
  `snapper` (install via `sudo dnf install snapper`).
- For XFS/ext4 servers, leverage LVM (`lvm lvcreate`, `lvextend`) and `xfs_growfs`.

### Networking
- NetworkManager CLI: `nmcli device status`, `nmcli connection add`.
- Manage firewall zones: `firewall-cmd --get-active-zones`, `--change-interface`.
- SELinux enforcement: `sestatus`, `sudo secedit` (policycoreutils) for contexts.

### Containers & Dev
- `podman` for rootless containers (`podman run --rm -it image`).
- `buildah` builds OCI images; `skopeo` inspects/transfers images.
- Toolbox: `toolbox enter`, `toolbox create --release 39`.

## Server Role Playbooks
### Web & Application
- **Apache:** `sudo dnf install httpd`; configure in `/etc/httpd/conf.d/`.
- **Nginx:** `sudo dnf install nginx`; config in `/etc/nginx/conf.d/`.
- **Python apps:** `sudo dnf install python3-pip`, use `pipx` or virtualenv inside `toolbox`.

### Databases
- **MariaDB:** `sudo dnf install mariadb-server`; enable with
  `sudo systemctl enable --now mariadb`.
- **PostgreSQL:** module-based install, e.g. `sudo dnf install @postgresql:15/server`;
  initialize with `sudo postgresql-setup --initdb`.
- **SQLite:** included by default for lightweight storage.

### File & Directory Services
- **Samba:** `sudo dnf install samba samba-client`; configure `/etc/samba/smb.conf`,
  set SELinux contexts with `sudo setsebool -P samba_enable_home_dirs on`.
- **NFS:** `sudo dnf install nfs-utils`; manage exports via `/etc/exports`.
- **FreeIPA:** `sudo dnf install freeipa-server` for identity management labs.

## Monitoring and Troubleshooting
- Resource checks: `top`, `htop`, `bpytop`, `systemd-cgtop`.
- Security: `sudo auditctl -l`, `ausearch`, `sealert`.
- Networking: `ss`, `nmcli`, `nmtui`, `tcpdump`, `nmap`.
- Dracut rebuild for initramfs: `sudo dracut -f`.
- Kernel issues: `sudo journalctl -k`, install `kernel-debug` for advanced tracing.

## Further Reading
- Fedora Docs: <https://docs.fedoraproject.org/>
- Fedora Magazine (how-tos): <https://fedoramagazine.org/>
- Fedora Quick Docs: <https://docs.fedoraproject.org/en-US/quick-docs/>
- Fedora Security Guide: <https://docs.fedoraproject.org/en-US/Fedora_Security_Guide/>

## Maintainer
- Marcos Silvestrini — marcos.silvestrini@gmail.com
