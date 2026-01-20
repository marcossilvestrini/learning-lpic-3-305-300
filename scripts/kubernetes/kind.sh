#!/bin/bash

: <<'MULTILINE-COMMENT'
    📝 Requirements: Debian/Ubuntu-based system        
    📚 Description: Script to create and configure a Kind 
       Kubernetes cluster and generate a kubeconfig file.
       It performs the following actions:
        - Defines a unique name for the Kind cluster.
        - Dynamically determines the project's root directory.
        - Specifies the destination path for the generated kubeconfig file within the project.
        - Ensures the target directory for the kubeconfig file exists.
        - Initiates the creation of a Kind cluster.
        - Exports the kubeconfig for the new cluster.
        - Saves the configuration to the specified file.
        - Validates the cluster is accessible with the new kubeconfig.
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

set -e

# --- Configuration ---
# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Define the project root directory (2 levels up from the script directory)
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." &> /dev/null && pwd)"

# Define the cluster name
CLUSTER_NAME="lpic3"
clear

# Define the output path for the kubeconfig
KUBECONFIG_PATH="${PROJECT_ROOT}/configs/kubernetes/kubeconfig-kind-cluster.yaml"
# --- End Configuration ---

# Ensure the target directory for the kubeconfig exists
mkdir -p "$(dirname "$KUBECONFIG_PATH")"

# Create the kind cluster
echo "Creating kind cluster '$CLUSTER_NAME'..."
kind create cluster --name "$CLUSTER_NAME"

# Get the kubeconfig for the cluster and save it
echo "Generating kubeconfig and saving to $KUBECONFIG_PATH..."
kind get kubeconfig --name "$CLUSTER_NAME" > "$KUBECONFIG_PATH"

echo "✅ Kind cluster '$CLUSTER_NAME' created successfully."
echo "✅ Kubeconfig saved to $KUBECONFIG_PATH"

# Validate the cluster using the generated kubeconfig
echo "--------------------------------------------------"
echo "Validating cluster with the generated kubeconfig..."
echo "--------------------------------------------------"

# The context for a kind cluster is automatically set to 'kind-<cluster-name>'
CONTEXT_NAME="kind-$CLUSTER_NAME"

echo "Running 'kubectl cluster-info'..."
kubectl cluster-info --kubeconfig="$KUBECONFIG_PATH" --context="$CONTEXT_NAME"

echo -e "\nRunning 'kubectl get nodes'..."
kubectl get nodes --kubeconfig="$KUBECONFIG_PATH" --context="$CONTEXT_NAME"

echo -e "\n✅ Cluster validation successful. The cluster is ready."
