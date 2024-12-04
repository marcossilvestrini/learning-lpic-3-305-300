#!/bin/bash

# Função para verificar e instalar pacotes
install_package() {
    PACKAGE=$1
    if ! command -v $PACKAGE &> /dev/null
    then
        echo "$PACKAGE não está instalado. Instalando..."
        sudo apt-get update
        sudo apt-get install -y $PACKAGE
    else
        echo "$PACKAGE já está instalado."
    fi
}

# Função para detectar distribuição e versão
get_distro() {
    DISTRO=$(cat /etc/*release | grep ^ID= | cut -d= -f2 | tr -d '"')
    VERSION=$(cat /etc/*release | grep VERSION_ID= | cut -d= -f2 | tr -d '"')
    echo "$DISTRO $VERSION"
}

# Função para instalar VirtualBox
install_virtualbox() {
    DISTRO=$(get_distro)
    
    if [[ "$DISTRO" == "ubuntu" ]] || [[ "$DISTRO" == "debian" ]]; then
        echo "Instalando VirtualBox para Ubuntu/Debian..."

        # Baixar e adicionar a chave pública do repositório do VirtualBox
        wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor

        # Adicionar o repositório do VirtualBox
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -c | awk '{print $2}') contrib" | sudo tee -a /etc/apt/sources.list

        # Atualizar repositórios
        sudo apt-get update
        
        # Instalar o VirtualBox
        sudo apt-get install -y virtualbox-7.1

        # Baixar e instalar o VirtualBox Extension Pack
        wget https://download.virtualbox.org/virtualbox/7.1.4/Oracle_VM_VirtualBox_Extension_Pack-7.1.4.vbox-extpack
        sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-7.1.4.vbox-extpack
        
    elif [[ "$DISTRO" == "centos" ]] || [[ "$DISTRO" == "fedora" ]]; then
        echo "Instalando VirtualBox para CentOS/Fedora..."
        sudo dnf install -y VirtualBox
    else
        echo "Distribuição não reconhecida para instalação automática do VirtualBox. Instale manualmente."
    fi
}

# Função para instalar o Go (Golang)
install_go() {
    if ! command -v go &> /dev/null
    then
        echo "Go não está instalado. Instalando Go..."
        wget https://go.dev/dl/go1.20.6.linux-amd64.tar.gz
        sudo tar -C /usr/local -xzf go1.20.6.linux-amd64.tar.gz
        echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
        source ~/.bashrc
    else
        echo "Go já está instalado."
    fi
}

# Função para instalar o Git
install_git() {
    if ! command -v git &> /dev/null
    then
        echo "Git não está instalado. Instalando Git..."
        sudo apt-get install -y git
    else
        echo "Git já está instalado."
    fi
}

# Função para instalar o UniK
install_unik() {
    if ! command -v unik &> /dev/null
    then
        echo "UniK não encontrado. Baixando UniK diretamente..."
        
        # Baixar e instalar UniK
        wget https://github.com/solo-io/unik/releases/download/0.0/unik_linux -O unik
        sudo chmod +x unik
        sudo mv unik /usr/local/bin/unik
        
        echo "UniK instalado com sucesso!"
    else
        echo "UniK já está instalado."
    fi
}

# Diretórios de configuração do UniK
UNIK_DIR="$HOME/.unik/virtualbox"
STATE_JSON="$UNIK_DIR/state.json"
IMAGES_DIR="$UNIK_DIR/images"
INSTANCES_DIR="$UNIK_DIR/instances"
VOLUMES_DIR="$UNIK_DIR/volumes"

# Diretório do projeto Go
GO_PROJECT_DIR="$HOME/go_projects/go-unikernel"

# Definir nome do Unikernel
UNIKERNEL_NAME="go-unikernel"

# Criar o diretório do projeto Go
echo "Criando o diretório do projeto Go..."
mkdir -p "$GO_PROJECT_DIR"
cd "$GO_PROJECT_DIR"

# Criar um exemplo de código Go
echo "Criando o código Go..."
cat > main.go <<EOF
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, Unikernel World!")
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8080", nil)
}
EOF

# Instalar Virtualbox,Go, Git e UniK
install_virtualbox
install_go
install_git
install_unik

# Criar o arquivo daemon-config.yaml para configurar o VirtualBox no UniK
echo "Criando o arquivo de configuração do VirtualBox..."
mkdir -p "$HOME/.unik"
cat > "$HOME/.unik/daemon-config.yaml" <<EOF
providers:
  virtualbox:
    - name: my-vbox
      adapter_name: "en0: Wi-Fi (AirPort)"
      adapter_type: bridged
EOF

# Criar a imagem do Unikernel com UniK
echo "Gerando a imagem do Unikernel..."
unik build --path="$GO_PROJECT_DIR" --name=$UNIKERNEL_NAME --provider=virtualbox

# Inicializar o VirtualBox com o Unikernel
echo "Iniciando a máquina virtual com VirtualBox..."
unik run --imageName=$UNIKERNEL_NAME --instanceName=$UNIKERNEL_NAME --provider=virtualbox

# Verificar o estado do Unikernel
echo "Verificando o estado do Unikernel..."
unik list

echo "Acesse o Unikernel na VM (verifique o IP com VirtualBox ou utilizando a rede configurada)."
