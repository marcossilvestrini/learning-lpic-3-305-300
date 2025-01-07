#!/bin/bash

# Atualiza a lista de pacotes
sudo apt-get update

# Instala o hypervisor Xen e ferramentas necessárias
sudo apt-get install -y xen-hypervisor-amd64 xen-tools xen-utils-common xenstore-utils

echo "Instalação e configuração do Xen concluídas. Por favor, reinicie o sistema para inicializar no Xen."
