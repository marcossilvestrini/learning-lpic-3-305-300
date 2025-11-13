#!/bin/bash

: <<'MULTILINE-COMMENT'
    📝 Requirements: Debian/Ubuntu-based system
    📚 Description: Script to install and configure Zsh, Oh My Zsh, and plugins for the Kubernetes environment for specified users.
    👤 Author: Marcos Silvestrini
    📅 Date: 12/11/2025
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
# ===========================
USERS_TO_CONFIGURE=("root" "vagrant")

# ===========================
# OS detection
# ===========================
if ! grep -qiE "debian|ubuntu" /etc/*release 2>/dev/null; then
  echo "🔴 This script is intended for Debian or Ubuntu distributions. Aborting."
  exit 1
fi

echo "🟢 Detected Debian or Ubuntu distribution."

# ===========================
# Install dependencies
# ===========================
echo "🔷 Installing dependencies: zsh, curl, git..."
sudo apt-get update -yqq
sudo apt-get install -yqq zsh curl git

# =======================================
# Loop through users to set up Zsh
# =======================================
for user in "${USERS_TO_CONFIGURE[@]}"; do
  echo "==========================================="
  echo "🔷 Starting Zsh setup for user: $user"
  echo "==========================================="

  # Check if user exists
  if ! id "$user" &>/dev/null; then
    echo "🟡 User '$user' not found. Skipping."
    continue
  fi

  # Define user-specific paths
  HOME_DIR=$(getent passwd "$user" | cut -d: -f6)
  if [ -z "$HOME_DIR" ]; then
    echo "🔴 Could not determine home directory for user '$user'. Skipping."
    continue
  fi
  ZSH_CUSTOM_DIR="$HOME_DIR/.oh-my-zsh/custom"

  # ===========================
  # Install Oh My Zsh
  # ===========================
  if [ -d "$HOME_DIR/.oh-my-zsh" ]; then
    echo "🟡 Oh My Zsh is already installed for $user. Skipping installation."
  else
    echo "🔷 Installing Oh My Zsh for $user..."
    sudo -u "$user" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi

  # ===========================
  # Install Zsh Plugins
  # ===========================
  echo "🔷 Installing Zsh plugins for $user..."
  sudo -u "$user" mkdir -p "${ZSH_CUSTOM_DIR}/plugins"
  sudo -u "$user" mkdir -p "${ZSH_CUSTOM_DIR}/themes"

  # zsh-autosuggestions
  if [ -d "${ZSH_CUSTOM_DIR}/plugins/zsh-autosuggestions" ]; then
    echo "🟡 zsh-autosuggestions plugin already exists for $user. Skipping."
  else
    echo "  -> Cloning zsh-autosuggestions for $user..."
    sudo -u "$user" git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM_DIR}/plugins/zsh-autosuggestions"
  fi

  # powerlevel10k theme
  if [ -d "${ZSH_CUSTOM_DIR}/themes/powerlevel10k" ]; then
    echo "🟡 powerlevel10k theme already exists for $user. Skipping."
  else
    echo "  -> Cloning powerlevel10k for $user..."
    sudo -u "$user" git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM_DIR}/themes/powerlevel10k"
  fi

  # ===========================
  # Configure Zsh and MOTD
  # ===========================
  echo "🔷 Configuring .zshrc and motd for $user..."

  # Copy zshrc configuration
  sudo cp -f "configs/kubernetes/zshrc" "$HOME_DIR/.zshrc"
  sudo chown "$user:$user" "$HOME_DIR/.zshrc"

  # Copy motd
  sudo cp -f "configs/kubernetes/motd" "$HOME_DIR/motd"
  sudo chown "$user:$user" "$HOME_DIR/motd"

  # ===========================
  # Set Zsh as default shell
  # ===========================
  if [ "$(getent passwd "$user" | cut -d: -f7)" != "/bin/zsh" ]; then
    echo "🔷 Changing default shell for $user to /bin/zsh..."
    sudo chsh -s /bin/zsh "$user"
  else
    echo "🟡 Default shell for $user is already /bin/zsh."
  fi

  echo "✅ Zsh setup for user $user is complete."
done

echo "==========================================="
echo "✅ Zsh and Oh My Zsh configuration is complete for all specified users."

# =======================================
# Install Kubernetes Tools
# =======================================
echo "🔷 Installing Kubernetes tools..."

# Install prerequisites for Minikube
echo "  -> Installing prerequisites for Minikube (socat, conntrack)..."
sudo apt-get install -yqq socat conntrack

# Install kubectl
echo "  -> Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Install kubecolor
echo "  -> Installing kubecolor..."
KUBECOLOR_VERSION="v0.5.3"
curl -LO "https://github.com/hidetatz/kubecolor/releases/download/${KUBECOLOR_VERSION}/kubecolor_${KUBECOLOR_VERSION}_Linux_x86_64.tar.gz"
tar -zxvf "kubecolor_${KUBECOLOR_VERSION}_Linux_x86_64.tar.gz"
sudo install -o root -g root -m 0755 kubecolor /usr/local/bin/kubecolor
rm "kubecolor_${KUBECOLOR_VERSION}_Linux_x86_64.tar.gz" kubecolor

# Install Minikube
echo "  -> Installing Minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# Install Kind
echo "  -> Installing Kind..."
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Install Helm
echo "  -> Installing Helm..."
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh

echo "✅ Kubernetes tools installation is complete."

echo "ℹ️ Please log out and log back in to use the new shell."

