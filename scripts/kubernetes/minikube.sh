#!/bin/bash

: <<'MULTILINE-COMMENT'
    📝 Requirements: Debian/Ubuntu-based system        
    📚 Description: Script to create and configure a Minikube
       Kubernetes cluster for labs using kvm2 and containerd by default.
       It performs the following actions:
        - Defines a unique name for the Minikube cluster to avoid conflicts.
        - Validates libvirt/KVM when using the kvm2 driver.
        - Specifies the destination path for the generated kubeconfig file.
        - Ensures the target directory for the kubeconfig file exists, creating it if necessary.
        - Deletes the managed Minikube profile before creation for idempotent Vagrant runs.
        - Initiates the creation of a configurable Minikube cluster.
        - Enables common lab addons, including MetalLB with a Layer 2 IP pool.
        - Sets the kubectl context to point to the newly created cluster.
        - Extracts the flattened and raw kubeconfig, which includes all necessary credentials and cluster information.
        - Saves the extracted configuration to the specified file, making it portable and ready for use.
        - Provides feedback on the successful creation of the cluster and the location of the kubeconfig file.
        - Displays the current status of the cluster for immediate verification.  
    👤 Author: Marcos Silvestrini
    📅 Date: 17/11/2025
MULTILINE-COMMENT

# ===========================
# Global non-interactive mode
# ===========================
export LANG=C
export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
export NEEDRESTART_MODE=a
# ===========================

# Script variables
set -euo pipefail

log()   { echo "🔷 $*"; }
warn()  { echo "🟡 $*" >&2; }
abort() { echo "🔴 $*" >&2; exit 1; }

# Define the cluster settings
CLUSTER_NAME="${CLUSTER_NAME:-lpic3}"
MINIKUBE_DRIVER="${MINIKUBE_DRIVER:-kvm2}"
CONTAINER_RUNTIME="${CONTAINER_RUNTIME:-containerd}"
MINIKUBE_MEMORY="${MINIKUBE_MEMORY:-32600}"
MINIKUBE_CPUS="${MINIKUBE_CPUS:-8}"
MINIKUBE_NODES="${MINIKUBE_NODES:-1}"
MINIKUBE_WAIT_TIMEOUT="${MINIKUBE_WAIT_TIMEOUT:-5m}"
RESET_CLUSTER="${RESET_CLUSTER:-true}"
CLEAN_DOCKER_HOST="${CLEAN_DOCKER_HOST:-false}"
MINIKUBE_ADDONS="${MINIKUBE_ADDONS:-metrics-server dashboard ingress portainer metallb}"
METALLB_IP_RANGE="${METALLB_IP_RANGE:-}"
export LIBVIRT_DEFAULT_URI="${LIBVIRT_DEFAULT_URI:-qemu:///system}"

# Define user-specific paths
HOME_DIR=$(getent passwd "$USER" | cut -d: -f6)
if [ -z "$HOME_DIR" ]; then
    abort "Could not determine home directory for user '$USER'."
fi

# Define the output path for the kubeconfig, relative to the script's location
KUBECONFIG_PATH="$HOME_DIR/configs/kubernetes/kubeconfig-minikube-cluster.yaml"

# Ensure the target directory for the kubeconfig exists
mkdir -p "$(dirname "$KUBECONFIG_PATH")"

validate_kvm2() {
    if [ "$MINIKUBE_DRIVER" != "kvm2" ]; then
        return 0
    fi

    command -v virsh >/dev/null || abort "virsh not found. Install libvirt-clients/libvirt-daemon-system/qemu-kvm."
    grep -E -q 'vmx|svm' /proc/cpuinfo || abort "CPU virtualization flags not found. Enable nested virtualization in the outer hypervisor."
    [ -e /dev/kvm ] || abort "/dev/kvm not found. Check nested virtualization and KVM kernel modules."

    sudo systemctl enable --now libvirtd.service >/dev/null 2>&1 || \
        sudo systemctl enable --now libvirtd.socket >/dev/null 2>&1 || \
        abort "Failed to start libvirt."

    for group in libvirt kvm; do
        if ! getent group "$group" | grep -Eq "(^|[:,])$USER(,|$)"; then
            warn "Adding user '$USER' to group '$group'. A new login session may be required."
            sudo usermod -aG "$group" "$USER" || abort "Failed to add '$USER' to group '$group'."
        fi

        if ! id -nG | grep -qw "$group"; then
            warn "Current SSH session does not include group '$group'. Continuing because libvirt system access is validated below."
        fi
    done

    virsh -c "$LIBVIRT_DEFAULT_URI" domcapabilities --virttype kvm >/dev/null || abort "libvirt does not report KVM capabilities via $LIBVIRT_DEFAULT_URI."
}

validate_kvm2

reset_minikube_profile() {
    log "Deleting existing Minikube profile '$CLUSTER_NAME' if present..."
    minikube delete -p "$CLUSTER_NAME" || true

    if [ "$CLEAN_DOCKER_HOST" = "true" ]; then
        warn "CLEAN_DOCKER_HOST=true: removing all Docker containers and pruning Docker system."
        docker ps -aq | xargs -r docker rm -f
        docker system prune -af
    fi
}

# Keep Vagrant provisioning idempotent: remove the previous managed profile
# before creating it again. Docker cleanup is optional because kvm2 does not
# use Docker as the Minikube provider.
if [ "$RESET_CLUSTER" = "true" ]; then
    reset_minikube_profile
fi

# Start the minikube cluster.
log "Creating Minikube cluster '$CLUSTER_NAME' with driver=$MINIKUBE_DRIVER runtime=$CONTAINER_RUNTIME..."
MINIKUBE_DRIVER_ARGS=()
if [ "$MINIKUBE_DRIVER" = "kvm2" ]; then
  MINIKUBE_DRIVER_ARGS+=(--kvm-qemu-uri="$LIBVIRT_DEFAULT_URI")
fi

minikube start \
  -p "$CLUSTER_NAME" \
  --bootstrapper=kubeadm \
  --cni=bridge \
  --driver="$MINIKUBE_DRIVER" \
  --container-runtime="$CONTAINER_RUNTIME" \
  --memory="$MINIKUBE_MEMORY" \
  --cpus="$MINIKUBE_CPUS" \
  --nodes="$MINIKUBE_NODES" \
  "${MINIKUBE_DRIVER_ARGS[@]}" \
  --wait=all \
  --wait-timeout="$MINIKUBE_WAIT_TIMEOUT"

# Set the kubectl context before addon post-configuration uses kubectl.
minikube update-context -p "$CLUSTER_NAME"

configure_metallb() {
    local minikube_ip ip_prefix ip_range

    minikube_ip="$(minikube ip -p "$CLUSTER_NAME")"
    ip_prefix="$(echo "$minikube_ip" | awk -F. '{print $1 "." $2 "." $3}')"
    ip_range="${METALLB_IP_RANGE:-${ip_prefix}.240-${ip_prefix}.250}"

    log "Configuring MetalLB IP range: $ip_range"

    kubectl --context "$CLUSTER_NAME" wait --for=condition=Ready pods --all -n metallb-system --timeout=120s || \
        warn "MetalLB pods are not all ready yet. Applying configuration anyway."

    if kubectl --context "$CLUSTER_NAME" get crd ipaddresspools.metallb.io l2advertisements.metallb.io >/dev/null 2>&1; then
        kubectl --context "$CLUSTER_NAME" apply -f - <<EOF
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: lpic3-pool
  namespace: metallb-system
spec:
  addresses:
    - ${ip_range}
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: lpic3-l2
  namespace: metallb-system
spec:
  ipAddressPools:
    - lpic3-pool
EOF
    else
        kubectl --context "$CLUSTER_NAME" apply -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: lpic3-pool
      protocol: layer2
      addresses:
      - ${ip_range}
EOF
    fi
}

enable_addons() {
    local addon

    for addon in $MINIKUBE_ADDONS; do
        log "Enabling Minikube addon: $addon"
        minikube addons enable "$addon" -p "$CLUSTER_NAME"

        if [ "$addon" = "metallb" ]; then
            configure_metallb
        fi
    done
}

enable_addons

# Generate the kubeconfig with admin access and save it to the specified file
echo "Generating kubeconfig and saving to $KUBECONFIG_PATH..."
kubectl config view --context="$CLUSTER_NAME" --flatten --raw > "$KUBECONFIG_PATH"

echo "✅ Minikube cluster '$CLUSTER_NAME' created successfully."
echo "✅ Kubeconfig with admin access saved to $KUBECONFIG_PATH"

# Display the status of the cluster
echo "Cluster status:"
minikube status -p "$CLUSTER_NAME"
kubectl --context "$CLUSTER_NAME" get nodes -o wide
minikube profile list
