#!/bin/bash

: <<'MULTILINE-COMMENT'
    📝 Requirements: Debian/Ubuntu-based system        
    📚 Description: Script to create and configure a Minikube 
       Kubernetes cluster with a specified number of nodes and generate a kubeconfig file.
       It performs the following actions:
        - Defines a unique name for the Minikube cluster to avoid conflicts.
        - Specifies the destination path for the generated kubeconfig file.
        - Ensures the target directory for the kubeconfig file exists, creating it if necessary.
        - Initiates the creation of a Minikube cluster with two nodes: one control plane and one worker.
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
set -e

# Define the cluster name
CLUSTER_NAME="lpic3"
clear

# Define user-specific paths
HOME_DIR=$(getent passwd "$USER" | cut -d: -f6)
if [ -z "$HOME_DIR" ]; then
    echo "🔴 Could not determine home directory for user '$USER'. Skipping."    
fi

# Define the output path for the kubeconfig, relative to the script's location
KUBECONFIG_PATH="$HOME_DIR/configs/kubernetes/kubeconfig-minikube-cluster.yaml"

# Ensure the target directory for the kubeconfig exists
mkdir -p "$(dirname "$KUBECONFIG_PATH")"

# Clear any existing Minikube cluster with the same name
minikube delete --all --purge
docker ps -aq | xargs -r docker rm -f
docker system prune -af

# Start the minikube cluster with 2 nodes (1 control-plane, 1 worker)
echo "Creating Minikube cluster '$CLUSTER_NAME' with 2 nodes..."
minikube start \
  --nodes=2 \
  -p "$CLUSTER_NAME" \
  --wait=all \
  --wait-timeout=5m


# Set the kubectl context to the new cluster
minikube update-context -p "$CLUSTER_NAME"

# Generate the kubeconfig with admin access and save it to the specified file
echo "Generating kubeconfig and saving to $KUBECONFIG_PATH..."
kubectl config view --context="$CLUSTER_NAME" --flatten --raw > "$KUBECONFIG_PATH"

echo "✅ Minikube cluster '$CLUSTER_NAME' created successfully."
echo "✅ Kubeconfig with admin access saved to $KUBECONFIG_PATH"

# Display the status of the cluster
echo "Cluster status:"
#minikube status -p "$CLUSTER_NAME"
minikube profile list
