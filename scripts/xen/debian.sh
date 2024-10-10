#!/bin/bash

# Atualiza a lista de pacotes
sudo apt-get update

# Instala o hypervisor Xen e ferramentas necessárias
sudo apt-get install -y xen-hypervisor-amd64 xen-tools xen-utils-common xenstore-utils

# Configura o GRUB para inicializar no Xen por padrão
# sudo sed -i 's/^GRUB_DEFAULT=.*/GRUB_DEFAULT=0/' /etc/default/grub
# sudo update-grub

echo "Instalação e configuração do Xen concluídas. Por favor, reinicie o sistema para inicializar no Xen."
