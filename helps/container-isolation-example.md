# Container Isolation Architecture: Defense in Depth

This document details the exact process of how the low-level orchestrator (`runc`) builds the isolation and security layers in the Linux Kernel before executing a container.

## Overview: The OCI "Recipe" (`config.json`)

Before triggering any *syscall* (system call), `containerd` generates a file called `config.json` (the OCI specification). This file contains the entire isolation matrix: which namespaces to create, which RAM limits to apply, which syscalls to block, and which AppArmor profile to load. `runc` reads this file and starts building the environment.

---

## The Isolation Stack (Assembly Sequence)

### 1. Namespaces (The Visual Boundary)
* **What it does:** Prevents the container from seeing the host's resources.
* **How it's added:** `runc` executes the `unshare()` or `clone()` syscall, passing flags like `CLONE_NEWPID` and `CLONE_NEWNET`. From that moment on, the process is blind to the outside world.

### 2. Cgroups (The Resource Boundary)
* **What it does:** Prevents the container from consuming all of the machine's CPU or RAM.
* **How it's added:** The Kernel exposes Cgroups as a filesystem at `/sys/fs/cgroup`. `runc` creates a directory for the container, registers the PID in `cgroup.procs`, and writes the resource limits into files like `memory.max`.

### 3. Capabilities (Breaking the Root User)
* **What it does:** The root inside the container is UID 0, but it is a "fake root". Linux divides root powers into about 40 *capabilities*. Docker strips most of them from the container.
* **How it's added:** `runc` uses the `capset()` or `prctl()` syscall to drop critical privileges (e.g., `CAP_SYS_ADMIN`). Thus, even as root, an attacker cannot modify the real Kernel.

### 4. Seccomp (The Communication Filter)
* **What it does:** Restricts the language the container can use to talk to the Kernel. Blocks unauthorized *syscalls*.
* **How it's added:** `runc` compiles a BPF (Berkeley Packet Filter) filter with the default profile and injects it using `prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, ...)`. Attempts to use forbidden syscalls (like `reboot`) are blocked instantly.

### 5. AppArmor / SELinux (Mandatory Access Control - MAC)
* **What it does:** It is the last line of defense. Verifies access rules for specific file paths or networks.
* **How it's added:** `runc` writes the profile name (e.g., `docker-default`) into the magic file `/proc/self/attr/exec` (or `attr/apparmor/exec`). The LSM (Linux Security Modules) module forces the process to obey this profile.

### The End of the Line: `execve()`
Only after successfully applying all these five layers does `runc` call the `execve()` syscall to replace its own running code with the final container binary (e.g., `/bin/bash` or the target service).

---

## Practical Lab: Tracing Isolation in the Kernel

To watch Defense in Depth being built in real-time, we will use `strace` to intercept the calls that `containerd` and `runc` make to the Kernel.

### Execution (Requires 2 Terminals)

**In Terminal 1 (The Tracker):**
Execute the command below as root. It will attach to the daemon, wait for a container creation, and filter only the isolation and security syscalls:

```bash
sudo strace -f -p $(pidof containerd) -e trace=clone,clone3,unshare,mount,capset,prctl,execve,openat,write 2>&1 | grep -E "unshare|mount|capset|PR_SET_SECCOMP|apparmor|execve"
```

**In Terminal 2 (The Trigger):**
Trigger the creation of a simple new container:

```bash
docker run --rm alpine echo "Complete Isolation"
```

Strace Log Analysis
When executing the command in Terminal 2, Terminal 1 will capture the exact sequence described in the theory. Below is the commented output of the captured calls:

```plaintext
# 1. NAMESPACES: The Kernel isolates the process from the host
[pid 6725] unshare(CLONE_NEWTIME|CLONE_NEWNS|CLONE_NEWCGROUP|CLONE_NEWUTS|CLONE_NEWIPC|CLONE_NEWPID|CLONE_NEWNET) = 0

# 2. CGROUPS AND FILESYSTEM: OverlayFS mount and resource limits
[pid 6726] mount("cgroup", "/sys/fs/cgroup", "cgroup2", ...) = 0
[pid 6726] mount("", "/var/lib/docker/rootfs/overlayfs/...", ...) = 0

# 3. CAPABILITIES: The fake root loses full Kernel privileges
[pid 6726] capset({version=_LINUX_CAPABILITY_VERSION_3, pid=0}, {effective=1<<CAP_CHOWN|1<<CAP_DAC_OVERRIDE..., permitted=..., inheritable=0}) = 0

# 4. SECCOMP: Applying the BPF filter to block dangerous syscalls
[pid 6726] prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, {len=119, filter=0x55f9e8a9b000}) = 0

# 5. APPARMOR: Injecting the Docker security profile into the process
[pid 6726] openat(AT_FDCWD, "/proc/self/attr/apparmor/exec", O_WRONLY|O_CLOEXEC) = 3
[pid 6726] write(3, "exec docker-default", 19) = 19

# 6. EXECVE: The environment is secure. The original process is replaced by the container binary
[pid 6726] execve("/bin/echo", ["echo", "Complete Isolation"], 0xc0000a6000 /* 13 vars */) = 0
```
