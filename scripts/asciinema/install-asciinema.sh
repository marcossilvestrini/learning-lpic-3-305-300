#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    Script Name: install-asciinema.sh
    Requirements: acesso à internet, ambiente compatível com bash, Vagrant (ou ambiente Linux Debian-like)
    Description: Automatiza a instalação da versão 3.x do asciinema (reescrita em Rust),
                 incluindo a instalação do compilador Rust, clonagem do repositório oficial,
                 build em modo release e disponibilização do binário no PATH do usuário.
    Author: Marcos Silvestrini
    Date: 03/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

INSTALL_DIR="$HOME/.local/bin"
REPO_DIR="$HOME/asciinema"
BIN="$INSTALL_DIR/asciinema"

echo "🔧 [1/5] Preparando ambiente..."

if ! command -v cargo &>/dev/null; then
  echo "📦 Rust não encontrado. Instalando via rustup..."
  curl https://sh.rustup.rs -sSf | sh -s -- -y
  source "$HOME/.cargo/env"
else
  echo "✅ Rust já instalado."
fi

mkdir -p "$INSTALL_DIR"

if [ ! -d "$REPO_DIR/.git" ]; then
  echo "⬇️  Clonando asciinema v3 do GitHub..."
  git clone https://github.com/asciinema/asciinema.git "$REPO_DIR"
else
  echo "🔁 Repositório já existe, atualizando..."
  git -C "$REPO_DIR" pull --ff-only origin main
fi

echo "⚙️  [2/5] Compilando asciinema..."
cd "$REPO_DIR"
cargo build --release

echo "📥 [3/5] Instalando binário em $BIN"
cp -f target/release/asciinema "$BIN"

export PATH="$INSTALL_DIR:$PATH"

echo "🔍 [4/5] Verificando versão instalada:"
"$BIN" --version

echo "✅ [5/5] Instalação concluída. Use: asciinema auth && asciinema stream"
