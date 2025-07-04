#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    Script Name: uninstall-asciinema.sh
    Requirements: nenhum requisito especial além de permissões de usuário comum
    Description: Remove completamente o ambiente do asciinema v3 instalado via build Rust.
                 Remove binário, repositório clonado, ambiente Rust e possíveis referências no .bashrc.
    Author: Marcos Silvestrini
    Date: 03/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

echo "🧹 Iniciando processo de remoção de asciinema v3..."

deactivate 2>/dev/null || true

rm -f ~/.local/bin/asciinema
echo "🗑️  Binário removido de ~/.local/bin"

rm -rf ~/asciinema
echo "🗑️  Repositório ~/asciinema removido"

rm -rf ~/.cargo ~/.rustup
echo "🗑️  Ambiente Rust removido (~/.cargo e ~/.rustup)"

# Remover PATH exportado via linha específica, se existir
sed -i '/export PATH="\$HOME\/.local\/bin:\$PATH"/d' ~/.bashrc || true
echo "🧼 PATH limpo de ~/.bashrc (se aplicável)"

echo "✅ Teardown concluído com sucesso."
