#!/bin/bash

set -e  # Para o script em caso de erro

# set path
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc

install_dependencies() {
    echo "Instalando dependências..."
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y git gcc make wget curl g++ unzip python3 qemu-utils build-essential libncurses5-dev \
        bzip2 libssl-dev libelf-dev autoconf automake e2fsprogs        

    elif command -v yum &> /dev/null; then
        sudo yum install -y git gcc make wget curl g++ unzip python3 qemu-img make ncurses-devel \
        bzip2 openssl-devel elfutils-libelf-devel autoconf automake e2fsprogs
    else
        echo "Gerenciador de pacotes não suportado. Configure as dependências manualmente."
        exit 1
    fi
}

install_go() {
    echo "Instalando Go..."
    if ! command -v go &> /dev/null; then
        wget https://go.dev/dl/go1.20.6.linux-amd64.tar.gz -O /tmp/go.tar.gz
        sudo tar -C /usr/local -xzf /tmp/go.tar.gz
     
    else
        echo "Go já está instalado."
    fi
    go version
}

install_firecracker() {
    echo "Instalando Firecracker..."
    FIRECRACKER_VERSION="v1.10.1"
    if [ ! -f "/usr/local/bin/firecracker" ]; then
        wget https://github.com/firecracker-microvm/firecracker/releases/download/${FIRECRACKER_VERSION}/firecracker-${FIRECRACKER_VERSION}-x86_64.tgz -O firecracker.tgz
        tar -xvzf firecracker.tgz
        sudo mv release-static/firecracker /usr/local/bin/
        sudo mv release-static/vmlinux.bin /usr/local/bin/
        sudo chmod +x /usr/local/bin/firecracker
    else
        echo "Firecracker já está instalado."
    fi
}

setup_go_app() {
    echo "Configurando aplicação Go..."
    APP_DIR="$HOME/microvm-app"
    mkdir -p "$APP_DIR"
    cat > "$APP_DIR/main.go" <<EOF
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, MicroVM World!")
}

func main() {
    http.HandleFunc("/", handler)
    fmt.Println("Server running on :8080")
    http.ListenAndServe(":8080", nil)
}
EOF

    echo "Compilando aplicação Go..."
    cd "$APP_DIR"
    GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o app main.go
}

create_rootfs() {
    echo "Criando sistema de arquivos raiz..."
    ROOTFS_DIR="$HOME/rootfs"
    mkdir -p "$ROOTFS_DIR"
    cp "$HOME/microvm-app/app" "$ROOTFS_DIR/"

    echo "#!/bin/sh" > "$ROOTFS_DIR/init"
    echo "/app" >> "$ROOTFS_DIR/init"
    chmod +x "$ROOTFS_DIR/init"

    # Baixar e compilar o BusyBox sem interação
    cd "$HOME"
    wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
    tar xvjf busybox-1.36.1.tar.bz2
    cd busybox-1.36.1
    make defconfig
    sed -i 's/.*CONFIG_STATIC.*/CONFIG_STATIC=y/' .config
    sed -i 's/.*CONFIG_STATIC_LIBGCC.*/CONFIG_STATIC_LIBGCC=y/' .config

    make -j$(nproc)
    make install CONFIG_PREFIX="$ROOTFS_DIR"

    cd "$ROOTFS_DIR"
    mkdir -p dev proc sys tmp
    [ ! -e "$ROOTFS_DIR/dev/console" ] && sudo mknod "$ROOTFS_DIR/dev/console" c 5 1
    [ ! -e "$ROOTFS_DIR/dev/null" ] && sudo mknod "$ROOTFS_DIR/dev/null" c 1 3
    sudo chmod 600 "$ROOTFS_DIR/dev/console" "$ROOTFS_DIR/dev/null"

    cd "$HOME"
    dd if=/dev/zero of=rootfs.ext4 bs=1M count=128
    sudo mkfs.ext4 rootfs.ext4
        
    mkdir -p mnt
    sudo mount -o loop rootfs.ext4 mnt
    sudo cp -r "$ROOTFS_DIR/"* mnt/
    sudo umount mnt
}

run_firecracker() {
    echo "Executando MicroVM com Firecracker..."
    FIRECRACKER_DIR="$HOME/firecracker"
    mkdir -p "$FIRECRACKER_DIR"

    # Certifique-se de que o kernel está no local correto
    if [ ! -f "$FIRECRACKER_DIR/vmlinux.bin" ]; then
        echo "Kernel vmlinux.bin não encontrado no diretório $FIRECRACKER_DIR."
        exit 1
    fi

    cat > "$FIRECRACKER_DIR/config.json" <<EOF
{
    "boot-source": {
        "kernel_image_path": "$FIRECRACKER_DIR/vmlinux.bin",
        "boot_args": "console=ttyS0 reboot=k panic=1 pci=off init=/init"
    },
    "drives": [
        {
            "drive_id": "rootfs",
            "path_on_host": "$HOME/rootfs.ext4",
            "is_root_device": true,
            "is_read_only": false
        }
    ],
    "machine-config": {
        "vcpu_count": 1,
        "mem_size_mib": 128,
        "ht_enabled": false
    }
}
EOF

    sudo  firecracker --config-file "$FIRECRACKER_DIR/config.json"
}


# Execução do script
# install_dependencies
# install_go
# install_firecracker
# setup_go_app
# create_rootfs
run_firecracker
