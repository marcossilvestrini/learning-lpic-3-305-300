#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    Script Name: docker-layers.sh
    Requirements: root privileges, Docker Engine
    Description: Lab para demonstrar como funcionam as image layers (RO)
                 e a writable layer dos containers (COW - copy-on-write).
                 Baseado na doc: https://docs.docker.com/engine/storage/drivers/#images-and-layers
    Author: Marcos Silvestrini (lab style), implemented by Codex
    Date: 12/09/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'
LANG=C

# ======================
# Variáveis do Lab
# ======================
LAB_NAME="docker-layers-lab"
CONTEXT_DIR="/tmp/${LAB_NAME}"
IMAGE="layers-lab:v1"
IMAGE_COMMIT="layers-lab:commit"
BASE_IMAGE="alpine:3.19"
C1_NAME="layers-c1"
C2_NAME="layers-c2"

# ======================
# Utils
# ======================
log()   { echo -e "[INFO] $*"; }
warn()  { echo -e "[WARN] $*" >&2; }
abort() { echo -e "[ERROR] $*" >&2; exit 1; }

need_root() {
  if [[ ${EUID:-$(id -u)} -ne 0 ]]; then
    abort "Este script deve ser executado como root"
  fi
}

need_docker() {
  if ! command -v docker &>/dev/null; then
    abort "Docker não encontrado. Instale e tente novamente."
  fi
  if ! docker info &>/dev/null; then
    abort "Não foi possível falar com o daemon do Docker. Verifique permissões/serviço."
  fi
}

storage_driver() {
  docker info --format '{{.Driver}}' 2>/dev/null || echo "desconhecido"
}

# ======================
# Preparar contexto de build
# ======================
prepare_context() {
  log "Preparando contexto de build em: $CONTEXT_DIR"
  rm -rf "$CONTEXT_DIR"
  mkdir -p "$CONTEXT_DIR/files"

  cat >"$CONTEXT_DIR/Dockerfile" <<'EOF'
FROM alpine:3.19
LABEL maintainer="layers-lab" purpose="demo-layers"

# Cada RUN/COPY/ADD normalmente cria uma camada nova da imagem
RUN echo "layer1: criado na build" > /layer1.txt
RUN adduser -D appuser && echo "layer2: usuario appuser criado" > /layer2.txt
COPY files/app.sh /usr/local/bin/app.sh
RUN chmod +x /usr/local/bin/app.sh && echo "layer4: app.sh instalado" > /layer4.txt
ENV APP_ENV=lab-demo
CMD ["sh","-c","echo 'Container pronto. Dormindo...'; tail -f /dev/null"]
EOF

  cat >"$CONTEXT_DIR/files/app.sh" <<'EOF'
#!/bin/sh
echo "app.sh executado dentro da imagem"
EOF

  log "Contexto criado com Dockerfile e files/app.sh"
}

# ======================
# Build da imagem
# ======================
build_image() {
  log "Fazendo build da imagem $IMAGE (base: $BASE_IMAGE)"
  docker build -t "$IMAGE" "$CONTEXT_DIR"
  log "Build concluído"
}

# ======================
# Mostrar camadas da imagem
# ======================
show_image_layers() {
  log "Driver de armazenamento: $(storage_driver)"
  echo
  log "docker history (camadas da imagem - somente leitura)"
  docker history "$IMAGE" --no-trunc || true
  echo
  log "docker image inspect .RootFS.Layers (digests das camadas):"
  docker image inspect "$IMAGE" --format '{{json .RootFS.Layers}}' | jq || true
}

# ======================
# Rodar containers e demonstrar writable layer
# ======================
run_containers_and_demo() {
  log "Subindo dois containers a partir da imagem: $IMAGE"
  for n in "$C1_NAME" "$C2_NAME"; do
    if docker ps -a --format '{{.Names}}' | grep -qx "$n"; then
      log "Container $n já existe; removendo para um estado limpo"
      docker rm -f "$n" >/dev/null 2>&1 || true
    fi
  done

  docker run -d --name "$C1_NAME" "$IMAGE" >/dev/null
  docker run -d --name "$C2_NAME" "$IMAGE" >/dev/null
  log "Containers ativos: $C1_NAME e $C2_NAME"

  log "Criando arquivos exclusivos em cada container (camada gravável)"
  docker exec "$C1_NAME" sh -lc 'mkdir -p /writable && echo c1-data > /writable/from-c1.txt'
  docker exec "$C2_NAME" sh -lc 'mkdir -p /writable && echo c2-data > /writable/from-c2.txt'

  log "Alterando um arquivo da imagem para disparar copy-on-write (/layer1.txt) em cada container"
  docker exec "$C1_NAME" sh -lc 'echo "(editado no c1)" >> /layer1.txt'
  docker exec "$C2_NAME" sh -lc 'echo "(editado no c2)" >> /layer1.txt'

  echo
  log "docker diff (mudanças na writable layer - A=Added, C=Changed, D=Deleted)"
  echo "Container: $C1_NAME"
  docker diff "$C1_NAME" || true
  echo "Container: $C2_NAME"
  docker diff "$C2_NAME" || true

  echo
  log "Inspecionando paths da writable layer (GraphDriver.Data.UpperDir)"
  for n in "$C1_NAME" "$C2_NAME"; do
    drv=$(docker inspect -f '{{.GraphDriver.Name}}' "$n" 2>/dev/null || true)
    upper=$(docker inspect -f '{{index .GraphDriver.Data "UpperDir"}}' "$n" 2>/dev/null || true)
    lower=$(docker inspect -f '{{index .GraphDriver.Data "LowerDir"}}' "$n" 2>/dev/null || true)
    merged=$(docker inspect -f '{{index .GraphDriver.Data "MergedDir"}}' "$n" 2>/dev/null || true)
    echo "Container: $n"
    echo "  Driver:  ${drv:-desconhecido}"
    echo "  Upper:   ${upper:-n/d}   (camada gravável exclusiva do container)"
    echo "  Lower:   ${lower:-n/d}   (camadas RO da imagem empilhadas)"
    echo "  Merged:  ${merged:-n/d}  (view unificada apresentada ao container)"
  done
}

# ======================
# Commit do container -> nova imagem com nova camada
# ======================
commit_container() {
  if ! docker ps -a --format '{{.Names}}' | grep -qx "$C1_NAME"; then
    abort "Container $C1_NAME não encontrado. Execute a opção de demo primeiro."
  fi
  log "Comitando $C1_NAME em nova imagem: $IMAGE_COMMIT"
  docker commit -m "commit da writable layer do $C1_NAME" "$C1_NAME" "$IMAGE_COMMIT" >/dev/null
  log "Imagem criada: $IMAGE_COMMIT"
  echo
  log "Comparando history entre $IMAGE e $IMAGE_COMMIT"
  echo "Container: $IMAGE"
  docker history "$IMAGE" --no-trunc || true
  echo "Container: $IMAGE_COMMIT"
  docker history "$IMAGE_COMMIT" --no-trunc || true
}

# ======================
# Limpeza
# ======================
remove_containers() {
  for n in "$C1_NAME" "$C2_NAME"; do
    if docker ps -a --format '{{.Names}}' | grep -qx "$n"; then
      log "Removendo container: $n"
      docker rm -f "$n" >/dev/null || true
    fi
  done
}

cleanup_all() {
  log "Limpando containers, imagens e contexto do lab"
  remove_containers
  if docker image inspect "$IMAGE_COMMIT" &>/dev/null; then
    docker rmi "$IMAGE_COMMIT" || true
  fi
  if docker image inspect "$IMAGE" &>/dev/null; then
    docker rmi "$IMAGE" || true
  fi
  rm -rf "$CONTEXT_DIR"
  log "Cleanup concluído"
}

# ======================
# Menu/Entry point
# ======================
main_menu() {
  clear
  echo "==============================="
  echo "  Docker Layers Lab"
  echo "   By Silvestrini style"
  echo "==============================="
  echo "Driver de armazenamento: $(storage_driver)"
  echo "Imagem alvo: $IMAGE"
  echo "Containers: $C1_NAME / $C2_NAME"
  echo "==============================="
  echo "1. Preparar contexto de build"
  echo "2. Build da imagem"
  echo "3. Mostrar camadas da imagem"
  echo "4. Rodar demo da writable layer (2 containers)"
  echo "5. Commit do $C1_NAME para nova imagem"
  echo "8. Remover apenas containers"
  echo "9. Limpar tudo (containers, imagens, contexto)"
  echo "0. Sair"
  echo "==============================="
}

entrypoint() {
  need_root
  need_docker
  while true; do
    main_menu
    read -rp "Escolha [0,1,2,3,4,5,8,9]: " CHOICE
    case "${CHOICE:-}" in
      1) prepare_context ;;
      2) build_image ;;
      3) show_image_layers ;;
      4) run_containers_and_demo ;;
      5) commit_container ;;
      8) remove_containers ;;
      9) cleanup_all ;;
      0) echo "Até mais!"; exit 0 ;;
      *) echo "Opção inválida" ;;
    esac
    read -rp $'\nPressione Enter para voltar ao menu...'
  done
}

entrypoint "$@"

