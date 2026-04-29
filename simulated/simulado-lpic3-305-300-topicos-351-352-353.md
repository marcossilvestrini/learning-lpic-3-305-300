# LPIC-3 305-300 Practice Exam (Topics 351, 352, 353)

Language: English  
Format: Multiple-choice + fill-in command questions  
Focus: Based on this repository README and topic docs (351/352/353)

---

## Section A - Topic 351 Full Virtualization

### 351.1 Concepts and Theory (Questions 1-12)

1. Which statement best describes a Type 1 hypervisor?  
A) It runs on top of a host operating system  
B) It runs directly on physical hardware  
C) It only supports paravirtualized guests  
D) It requires Docker to run VMs

2. Which item is commonly used to confirm hardware virtualization CPU flags?  
A) `/proc/net/dev`  
B) `/sys/class/net`  
C) `/proc/cpuinfo`  
D) `/etc/fstab`

3. What is P2V migration?  
A) Physical machine converted to a virtual machine  
B) VM converted to physical machine automatically  
C) Private cloud to virtual cloud migration  
D) Platform to VLAN migration

4. What is V2V migration?  
A) Copying a Vagrantfile to another host  
B) Moving a VM from one hypervisor format/platform to another  
C) Moving a VM from IPv4 to IPv6  
D) Converting VM to container

5. In HVM (hardware-assisted virtualization), guest operating systems are usually:  
A) Always modified for hypercalls  
B) Unmodified  
C) Required to be Linux only  
D) Required to use cgroups v2

6. A key trade-off of paravirtualization is:  
A) Better compatibility with unmodified guests than HVM  
B) No need for guest changes  
C) Guest OS modifications are required  
D) It cannot run on Xen

7. NUMA primarily affects:  
A) DNS service discovery  
B) Memory access latency patterns across CPUs  
C) VM disk image format conversion  
D) SSH key authentication

8. Which tool awareness appears in Topic 351 concepts?  
A) Open vSwitch  
B) kubeadm  
C) systemctl-networkd only  
D) cloud-initramfs-tools

9. Which statement about emulation is correct?  
A) It is always near-native speed  
B) It can run software built for other architectures with overhead  
C) It requires KVM in all cases  
D) It cannot run legacy systems

10. Type 2 hypervisors are generally:  
A) Better for bare-metal datacenter performance  
B) More common for desktop/lab hosted environments  
C) Unable to run multiple guests  
D) Managed only by libvirt

11. Which pair is correct?  
A) HVM: guest modified; PV: guest unmodified  
B) HVM: uses VT-x/AMD-V; PV: typically guest-aware/hypercalls  
C) HVM: no isolation; PV: hardware isolation only  
D) HVM: for containers only

12. `systemd-machined` is associated with:  
A) Managing VMs/containers metadata in systemd ecosystem  
B) Building qcow2 with snapshots  
C) Creating Xen domU kernels  
D) Parsing cloud-init user-data

### 351.2 Xen (Questions 13-24)

13. In Xen architecture, dom0 is:  
A) Unprivileged guest domain  
B) Privileged management domain  
C) Network namespace for guests  
D) A cloud-init datasource

14. domU refers to:  
A) Hypervisor boot firmware  
B) Guest domains managed by dom0  
C) Storage pool metadata  
D) Host kernel module

15. Xen supports which virtualization styles?  
A) Only containers  
B) PV and HVM  
C) Only full emulation without acceleration  
D) Only VM snapshots

16. Which utility is historically associated with Xen and still appears in exam awareness?  
A) xm  
B) qemu-img  
C) podman  
D) ctr

17. XenStore is primarily used for:  
A) DNS leases for libvirt default network  
B) Configuration/state exchange between Xen components/domains  
C) Virtual disk compaction  
D) Kubernetes secrets

18. Xen boot parameters are typically relevant to:  
A) Hypervisor and guest startup behavior  
B) Docker bridge creation  
C) Terraform state backend  
D) NTP synchronization only

19. A practical Xen troubleshooting step is:  
A) `docker node ls`  
B) Validate domain config and inspect dom0 logs/tools  
C) `kubectl describe node`  
D) `packer inspect`

20. Which statement is true about Xen in cloud history?  
A) It was never used by major cloud providers  
B) It has been widely used in cloud environments  
C) It only runs on BSD  
D) It replaces libvirt completely

21. In Xen terms, PV guests:  
A) Require no guest-awareness of hypervisor  
B) Are always slower than emulation  
C) Use guest-hypervisor cooperation (hypercalls)  
D) Cannot use virtual networking

22. HVM guests on Xen typically need:  
A) VT-x/AMD-V hardware support  
B) `runc` runtime  
C) cgroup freezer subsystem only  
D) OpenStack Swift

23. Which command family is central for Xen domain management in modern setups?  
A) `virsh` (with Xen URI)  
B) `helm`  
C) `podman`  
D) `terraform`

24. Xen networking and storage understanding in exam context means:  
A) Ignore virtual bridge design  
B) Know basic domain-to-network and domain-to-storage mappings  
C) Use only NAT in all labs  
D) Avoid troubleshooting tools

### 351.3 QEMU (Questions 25-34)

25. `qemu-system-x86_64` with no display options on a headless server may fail due to:  
A) Missing Kubernetes CRI  
B) GTK display initialization issues  
C) Invalid qcow2 always  
D) No DNS resolver

26. For headless access, a robust QEMU display option is:  
A) `-display vnc=:2`  
B) `-display gtk` only  
C) `-display cocoa` on Linux  
D) `-display curses` for all installers

27. `-monitor stdio` does what?  
A) Exposes QEMU monitor on terminal stdio  
B) Enables SSH forwarding  
C) Disables VM logging  
D) Creates libvirt XML

28. Which command in QEMU monitor pauses a VM?  
A) `pausevm`  
B) `stop`  
C) `freeze`  
D) `sleep`

29. Which command resumes a paused VM in QEMU monitor?  
A) `resume`  
B) `start`  
C) `cont`  
D) `run`

30. Guest agent channel in QEMU is commonly exposed with:  
A) `-chardev socket ...` plus `virtserialport`  
B) `-smbios type=1` only  
C) `-nodefaults` only  
D) `-boot once=d`

31. `-netdev user,...,hostfwd=tcp::2222-:22` provides:  
A) L2 bridge to physical LAN directly  
B) User-mode NAT with host port forwarding to guest SSH  
C) SR-IOV passthrough  
D) Open vSwitch integration by default

32. For bridge networking in QEMU, this is commonly used:  
A) `-netdev bridge,id=net0,br=qemubr0`  
B) `-netdev dnsmasq`  
C) `-netdev ovs` only  
D) `-netdev veth,master=br0`

33. If VNC `:1` is already used, QEMU may return:  
A) Unsupported CPU model  
B) Failed to find available port / address in use  
C) Invalid firmware signature  
D) No such monitor command

34. A practical way to verify command wrapping/alias issues is:  
A) `man qemu` only  
B) `type qemu-system-x86_64`  
C) `ps -ef` only  
D) `whereis gtk`

### 351.4 Libvirt (Questions 35-50)

35. `LIBVIRT_DEFAULT_URI=qemu:///system` targets:  
A) User session daemonless mode  
B) System-wide QEMU libvirt instance  
C) XenStore backend  
D) Docker socket

36. `virsh list --all` shows:  
A) Running domains only  
B) Defined and running/stopped domains  
C) Storage pools  
D) Networks only

37. Which command shows domain XML?  
A) `virsh domxml`  
B) `virsh dumpxml <domain>`  
C) `virsh getxml <domain>`  
D) `virsh showxml <domain>`

38. Graceful shutdown command for a domain is:  
A) `virsh stop <domain>`  
B) `virsh poweroff <domain>`  
C) `virsh shutdown <domain>`  
D) `virsh kill <domain>`

39. Force-off equivalent in libvirt is:  
A) `virsh destroy <domain>`  
B) `virsh undefine <domain>`  
C) `virsh suspend <domain>`  
D) `virsh net-destroy default`

40. Which command removes domain definition and attached storage in one step?  
A) `virsh undefine <domain>`  
B) `virsh destroy <domain> --all-storage`  
C) `virsh undefine <domain> --remove-all-storage`  
D) `virsh wipe <domain>`

41. Snapshot list command:  
A) `virsh snapshot-list <domain>`  
B) `virsh list-snapshots <domain>`  
C) `virsh domsnapshots <domain>`  
D) `virsh snap-list <domain>`

42. Which command lists storage pools with details?  
A) `virsh pool-list --details`  
B) `virsh storage-list --all`  
C) `virsh vol-list --details`  
D) `virsh pool-info --all`

43. Which command creates a qcow2 volume in pool `default`?  
A) `virsh vol-create default disk1 qcow2 10G`  
B) `virsh vol-create-as default --format qcow2 disk1 10G`  
C) `virsh vol-new default disk1 10G`  
D) `virsh pool-vol-create default disk1`

44. `virsh net-dhcp-leases default` is used to:  
A) Edit bridge MTU  
B) View DHCP leases from libvirt default network  
C) Disable dnsmasq  
D) Create static routes

45. `virsh domiflist <domain>` helps with:  
A) Filesystem inode usage  
B) VM interface mapping/virtual NIC details  
C) CPU pinning masks  
D) Snapshot metadata only

46. `virt-host-validate` is useful to:  
A) Validate host virtualization support and setup  
B) Convert VMDK to qcow2  
C) Format VM disks  
D) Inspect cloud-init logs

47. `virt-install --import` is typically used when:  
A) Installing from ISO interactively only  
B) Booting an existing disk image as a domain  
C) Creating a cloud-init datasource  
D) Building packer templates

48. `virsh vcpupin` configures:  
A) Guest disk bus  
B) vCPU affinity to host CPUs  
C) Network MAC filtering  
D) DNS resolver for guests

49. `virsh setmaxmem` affects:  
A) Domain maximum memory setting  
B) Host swap partition  
C) Pool metadata  
D) `dnsmasq` memory only

50. Awareness of `virtlogd` and `virtlockd` relates to:  
A) VM log handling and disk lock coordination  
B) Kubernetes audit pipeline  
C) OpenStack identity service  
D) SSH tunnel setup

### 351.5 Disk Image Management (Questions 51-60)

51. Which tool inspects image metadata/format/size?  
A) `qemu-img info`  
B) `virsh dominfo`  
C) `lsblk -f`  
D) `virt-top`

52. Which format is generally sparse/copy-on-write capable?  
A) raw  
B) qcow2  
C) ext4  
D) tar

53. Convert VMDK to qcow2 command family:  
A) `virt-v2v` only  
B) `qemu-img convert -f vmdk -O qcow2 ...`  
C) `virsh vol-clone` only  
D) `dd if=vmdk of=qcow2`

54. `guestmount` allows you to:  
A) Start a VM with no hypervisor  
B) Mount guest filesystem from an image/domain on host  
C) Change VM CPU topology  
D) Build OVF package

55. `virt-filesystems` is commonly used to:  
A) List partitions/filesystems inside VM images/domains  
B) Start libvirt network  
C) Configure cloud-init users  
D) Create cgroups

56. `virt-copy-in` does what?  
A) Copies file from guest to host  
B) Copies file from host into guest image  
C) Clones storage pool  
D) Imports Vagrant box

57. `virt-copy-out` does what?  
A) Copies file from host to guest image  
B) Copies file from guest image to host  
C) Exports libvirt XML  
D) Converts disk format

58. `virt-sparsify` is used to:  
A) Increase CPU count  
B) Reduce image footprint by removing empty blocks  
C) Encrypt image metadata  
D) Create qcow2 snapshots only

59. `virt-v2v` is aimed at:  
A) Physical to virtual conversion  
B) Virtual to virtual conversion  
C) Kubernetes image scanning  
D) cloud-init schema validation

60. OVF/OVA awareness primarily means:  
A) Proprietary format for one hypervisor only  
B) Standardized VM packaging/interoperability format  
C) Linux kernel module  
D) Cgroup policy file

---

## Section B - Topic 352 Container Virtualization

### 352.1 Concepts, Namespaces, Cgroups, Security (Questions 61-78)

61. Containers differ from VMs because containers:  
A) Always include their own kernel  
B) Share the host kernel  
C) Require hardware VT-x per container  
D) Cannot isolate processes

62. Which command enters namespaces of an existing process?  
A) `unshare`  
B) `nsenter`  
C) `chroot`  
D) `setcap`

63. Which command creates new namespaces for a process?  
A) `nsenter`  
B) `setns`  
C) `unshare`  
D) `pivot_root`

64. Which pseudo-filesystem path is key for cgroup controls?  
A) `/proc/cgroup`  
B) `/sys/fs/cgroup`  
C) `/etc/cgroups`  
D) `/var/lib/cgroup`

65. Namespaces mainly provide:  
A) Resource accounting and quotas  
B) Isolation of resource views  
C) Encrypted image layers  
D) Package dependency resolution

66. cgroups mainly provide:  
A) Isolation of PID namespace  
B) Resource limits/accounting  
C) Filesystem mounts  
D) Hypervisor CPU flags

67. Linux capabilities are used to:  
A) Replace kernel modules  
B) Split root privileges into fine-grained permissions  
C) Build OCI images  
D) Resolve DNS in containers

68. A highly privileged capability with broad impact is:  
A) `CAP_CHOWN`  
B) `CAP_SYS_ADMIN`  
C) `CAP_NET_BIND_SERVICE`  
D) `CAP_FOWNER`

69. seccomp in container context is used to:  
A) Restrict syscalls  
B) Mount volumes  
C) Route overlay traffic  
D) Set CPU quota

70. SELinux/AppArmor in container context are:  
A) Network plugins  
B) MAC security mechanisms  
C) Log collectors  
D) Init systems

71. Which statement about `chroot` is correct?  
A) Full container-equivalent isolation by itself  
B) Changes apparent root directory, but is not full security boundary  
C) Requires cgroup v2 only  
D) Replaces namespaces

72. Which path helps inspect namespace links for a process?  
A) `/proc/<pid>/ns`  
B) `/run/ns/<pid>`  
C) `/sys/ns/<pid>`  
D) `/var/ns/<pid>`

73. OCI specifications are associated with:  
A) DNS SRV records  
B) Runtime and image standards for containers  
C) VM snapshot metadata  
D) Terraform providers

74. CRI in Kubernetes stands for:  
A) Container Routing Interface  
B) Cluster Runtime Integration  
C) Container Runtime Interface  
D) Cloud Registry Interface

75. containerd and CRI-O are best described as:  
A) Hypervisors  
B) Container runtimes (CRI ecosystem)  
C) Log shippers  
D) VM image builders

76. Which is a system container technology in this context?  
A) LXC  
B) Helm  
C) Packer  
D) cloud-init

77. Podman/Buildah/Skopeo are mentioned as:  
A) Legacy Xen toolchain  
B) Additional container ecosystem tools  
C) QEMU monitor commands  
D) Vagrant plugins

78. Best short summary:  
A) namespaces control resources; cgroups isolate views  
B) namespaces isolate views; cgroups control resources  
C) capabilities replace seccomp entirely  
D) AppArmor provides cgroup hierarchy

### 352.2 LXC, 352.3 Docker, 352.4 Orchestration (Questions 79-95)

79. Docker image layers are generally:  
A) Mutable after container starts only  
B) Read-only layers with writable container layer on top  
C) Block devices only  
D) Stored only in `/tmp`

80. `docker ps` shows:  
A) Images only  
B) Running containers  
C) Volume metadata only  
D) Swarm services only

81. `docker compose up -d` does what?  
A) Stops and removes containers  
B) Starts/recreates services in detached mode  
C) Displays compose schema  
D) Builds only and exits always

82. `docker compose down -v` additionally removes:  
A) Host kernel modules  
B) Named volumes created by compose project  
C) Docker binary  
D) Swarm configs only

83. In Swarm, manager nodes are responsible for:  
A) Running no workloads  
B) Cluster state/scheduling/desired-state management  
C) DNS only  
D) cgroup driver selection

84. Command to initialize a swarm:  
A) `docker swarm create`  
B) `docker swarm init`  
C) `docker node init`  
D) `docker service init`

85. Command to list nodes in swarm:  
A) `docker swarm ls`  
B) `docker node ls`  
C) `docker cluster nodes`  
D) `docker service nodes`

86. Command to scale service replicas:  
A) `docker service update --replicas 5 web` only syntax  
B) `docker service scale web=5`  
C) `docker compose scale web=5` (v2 native equivalent)  
D) `docker node scale web=5`

87. Kubernetes smallest deployable object is:  
A) Deployment  
B) Pod  
C) Service  
D) Namespace

88. Kubernetes object for stable service exposure is:  
A) StatefulSet  
B) Service  
C) CronJob  
D) Secret

89. Declarative rollout and replica management is typically done by:  
A) DaemonSet only  
B) Deployment  
C) ConfigMap  
D) IngressClass

90. `kubectl get nodes` shows:  
A) Container image list  
B) Cluster node status/list  
C) Namespace quotas only  
D) Service endpoints only

91. Helm is best described as:  
A) Linux kernel scheduler  
B) Kubernetes package manager (charts/releases)  
C) Docker network plugin  
D) VM disk converter

92. `helm install my-release stable/mysql` creates:  
A) A chart repository  
B) A release from a chart  
C) A kubelet plugin  
D) A CRI runtime

93. Minikube is commonly used to:  
A) Run local Kubernetes clusters for testing  
B) Convert VMDK to qcow2  
C) Manage Xen domU  
D) Replace kube-apiserver in production

94. Which command validates stack compose file in swarm mode workflow?  
A) `docker stack config --compose-file docker-compose.yml`  
B) `docker service validate`  
C) `docker swarm lint`  
D) `docker compose check`

95. A key Swarm concept:  
A) Task is the scheduler binary  
B) Service defines desired state; tasks are running containers  
C) Node cannot be manager and worker roles  
D) Swarm uses no internal load balancing

---

## Section C - Topic 353 Deployment and Provisioning

### 353.1 Cloud, 353.2 Packer, 353.3 cloud-init, 353.4 Vagrant (Questions 96-120)

96. IaaS primarily provides:  
A) End-user business applications only  
B) Virtualized infrastructure resources  
C) Source code repositories  
D) Only DNS and CDN

97. PaaS primarily provides:  
A) Managed app platform/runtime services  
B) Raw block devices only  
C) VM hypervisor firmware  
D) Bare-metal BIOS management

98. SaaS primarily provides:  
A) Application software delivered as a service  
B) Hypervisor control APIs  
C) Kernel namespace tooling  
D) VM disk snapshots

99. OpenStack is best mapped to:  
A) IaaS cloud platform with modular services  
B) Container runtime only  
C) Linux distro package manager  
D) Terraform backend only

100. Terraform key concept `state` means:  
A) Runtime memory dump  
B) Tracked mapping of real infra to declared config  
C) Cloud-init cache  
D) VM snapshot chain

101. Typical Terraform flow includes:  
A) `terraform init`, `plan`, `apply`  
B) `terraform build`, `push`, `run`  
C) `terraform compose up`  
D) `terraform snapshot`

102. Packer is mainly used to:  
A) Provision running clusters only  
B) Build reusable machine/container images from templates  
C) Replace cloud-init entirely  
D) Manage Kubernetes releases

103. In Packer templates, builders define:  
A) Post-processing archive format only  
B) Target platform/image creation method  
C) Linux kernel boot args  
D) SSH key policies only

104. Packer provisioners are used to:  
A) Customize image during build  
B) Configure only DNS zones  
C) Create terraform state  
D) Patch running Kubernetes node

105. `packer validate template.pkr.hcl` does:  
A) Creates image  
B) Validates template syntax/config  
C) Pushes image to registry  
D) Initializes cloud-init

106. `packer build template.pkr.hcl` does:  
A) Lists providers  
B) Builds image artifacts from template  
C) Deletes old images automatically  
D) Validates Vagrantfile

107. cloud-init user-data commonly includes:  
A) Linux kernel source patches  
B) User accounts/SSH keys/packages/commands  
C) VM binary translation settings  
D) Terraform module graph

108. cloud-init key runtime data path is:  
A) `/var/lib/cloud/`  
B) `/var/lib/libvirt/`  
C) `/etc/vagrant/`  
D) `/opt/packer/state/`

109. cloud-init logs are commonly found in:  
A) `/var/log/cloud-init.log` and `cloud-init-output.log`  
B) `/var/log/libvirt/qemu/` only  
C) `/var/log/vagrant/` only  
D) `/tmp/cloud.log` only

110. Module that runs commands near end of cloud-init process:  
A) `bootcmd`  
B) `runcmd`  
C) `write_files`  
D) `users`

111. `cloud-init clean` is used to:  
A) Remove old cloud-init state/logs for re-run scenarios  
B) Reset libvirt storage pools  
C) Compact qcow2 images  
D) Remove Vagrant plugins

112. Vagrantfile primarily defines:  
A) Kubernetes manifests  
B) VM environment configuration and provisioning  
C) cloud-init datasource only  
D) Terraform resource graph

113. `vagrant up` does:  
A) Destroy VM  
B) Create/start VM environment  
C) Suspend VM  
D) Export OVA

114. `vagrant reload --provision` does:  
A) Reboot and rerun provisioners  
B) Remove box and plugins  
C) Only validate syntax  
D) Force halt without startup

115. `vagrant destroy -f` does:  
A) Forces VM environment destruction without prompt  
B) Rebuilds VM image  
C) Restarts guest services only  
D) Creates snapshot

116. `vagrant ssh` does:  
A) Opens SSH session into Vagrant guest  
B) Enables cloud-init user-data  
C) Starts libvirtd  
D) Generates host keypair automatically

117. A Vagrant provider is:  
A) A cloud-init module  
B) Backend virtualization engine integration (VirtualBox/VMware/etc.)  
C) A storage plugin for qcow2  
D) A Packer post-processor

118. Vagrant shell provisioner is typically used to:  
A) Run shell commands/scripts in guest provisioning  
B) Add Docker swarm nodes automatically only  
C) Build Linux kernel modules  
D) Configure host BIOS

119. Which command helps inspect how a command is resolved (alias/function/binary)?  
A) `type <command>`  
B) `route -n`  
C) `journalctl -b`  
D) `uname -a`

120. In a headless SSH lab, if QEMU GUI fails with GTK/X11 errors, best practical approach is:  
A) Use `-display vnc:<N>` or `-display none` as needed  
B) Disable KVM permanently  
C) Recompile qemu every run  
D) Remove SSH package

---

## Section D - Fill-in Command Questions (Hands-on style)

Complete each command with the correct argument/flag.

121. List all libvirt domains, including stopped ones:  
`virsh list ______`

122. Show libvirt connection URI:  
`virsh ______`

123. Display VM XML definition:  
`virsh ______ rocky9-server01`

124. Gracefully stop a domain:  
`virsh ______ rocky9-server01`

125. Force-stop a domain:  
`virsh ______ rocky9-server01`

126. Create qcow2 volume `disk1` 10G in default pool:  
`virsh vol-create-as default --format qcow2 disk1 ______`

127. Show qcow2 metadata:  
`qemu-img ______ os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2`

128. Convert VMDK to qcow2 (fill output format):  
`qemu-img convert -f vmdk -O ______ input.vmdk output.qcow2`

129. Start QEMU monitor in terminal:  
`qemu-system-x86_64 -monitor ______`

130. Start VM with VNC display number 2:  
`qemu-system-x86_64 ... -display ______`

131. Enter all namespaces of PID 1234 and run shell:  
`nsenter -t 1234 -a ______`

132. Create network namespace `ns-lab1`:  
`ip netns ______ ns-lab1`

133. Show cgroup membership for current process:  
`cat /proc/self/______`

134. Initialize swarm on manager node:  
`docker swarm ______`

135. List swarm nodes:  
`docker node ______`

136. Scale service `web` to 5 replicas:  
`docker service ______ web=5`

137. Show Kubernetes nodes:  
`kubectl get ______`

138. Apply deployment manifest file:  
`kubectl ______ -f nginx-deployment.yaml`

139. Initialize Packer plugins in current folder:  
`packer ______ .`

140. Validate Packer template:  
`packer ______ template.pkr.hcl`

141. Build image from Packer template:  
`packer ______ template.pkr.hcl`

142. Clear cloud-init state/logs:  
`sudo cloud-init ______`

143. Start Vagrant environment:  
`vagrant ______`

144. Reboot and reprovision Vagrant guests:  
`vagrant ______ --provision`

145. Force destroy Vagrant guest(s):  
`vagrant destroy ______`

---

## Answer Key

1-B, 2-C, 3-A, 4-B, 5-B, 6-C, 7-B, 8-A, 9-B, 10-B, 11-B, 12-A  
13-B, 14-B, 15-B, 16-A, 17-B, 18-A, 19-B, 20-B, 21-C, 22-A, 23-A, 24-B  
25-B, 26-A, 27-A, 28-B, 29-C, 30-A, 31-B, 32-A, 33-B, 34-B  
35-B, 36-B, 37-B, 38-C, 39-A, 40-C, 41-A, 42-A, 43-B, 44-B, 45-B, 46-A, 47-B, 48-B, 49-A, 50-A  
51-A, 52-B, 53-B, 54-B, 55-A, 56-B, 57-B, 58-B, 59-B, 60-B  
61-B, 62-B, 63-C, 64-B, 65-B, 66-B, 67-B, 68-B, 69-A, 70-B, 71-B, 72-A, 73-B, 74-C, 75-B, 76-A, 77-B, 78-B  
79-B, 80-B, 81-B, 82-B, 83-B, 84-B, 85-B, 86-B, 87-B, 88-B, 89-B, 90-B, 91-B, 92-B, 93-A, 94-A, 95-B  
96-B, 97-A, 98-A, 99-A, 100-B, 101-A, 102-B, 103-B, 104-A, 105-B, 106-B, 107-B, 108-A, 109-A, 110-B, 111-A, 112-B, 113-B, 114-A, 115-A, 116-A, 117-B, 118-A, 119-A, 120-A  
121 `--all`  
122 `uri`  
123 `dumpxml`  
124 `shutdown`  
125 `destroy`  
126 `10G`  
127 `info`  
128 `qcow2`  
129 `stdio`  
130 `vnc=:2`  
131 `bash`  
132 `add`  
133 `cgroup`  
134 `init`  
135 `ls`  
136 `scale`  
137 `nodes`  
138 `apply`  
139 `init`  
140 `validate`  
141 `build`  
142 `clean`  
143 `up`  
144 `reload`  
145 `-f`

