# Xen VM Provisioning com Libvirt — Solução Final

## Problema Resolvido ✅

Erro ao criar VM Xen com libvirt via SSH remoto:
```
error: internal error: libxenlight failed to create new domain 'debian-server01'
qemu-system-i386: -device cirrus-vga,vgamem_mb=8: failed to find romfile "vgabios-cirrus.bin"
```

## Causa Raiz

O wrapper `xen-qemu-system-i386` (chamado por libvirtd para criar VMs HVM no Xen) não recebia a flag `-L /usr/lib/xen/boot`, então o QEMU não conseguia encontrar os ROMs de vídeo e rede. Além disso, libvirt injetava `-vnc` com um keymap que também não era encontrado.

## Solução Implementada

### 1. **Copiar ROMs para `/usr/lib/xen/boot`** (Host Xen)

```bash
sudo mkdir -p /usr/lib/xen/boot
sudo cp /usr/share/qemu/vgabios-*.bin /usr/lib/xen/boot/
sudo cp /usr/share/seabios/vgabios-*.bin /usr/lib/xen/boot/
sudo chown root:root /usr/lib/xen/boot/vgabios-*
sudo chmod 644 /usr/lib/xen/boot/vgabios-*
```

Automatizado via script:
```bash
./scripts/xen/fix_vgabios.sh 192.168.0.130 vagrant /home/vagrant/.ssh/skynet-key-ecdsa
```

### 2. **Criar Wrapper que Injeta `-L` e Remove `-vnc`** (Host Xen)

O wrapper em `/usr/lib/xen/bin/qemu-system-i386` intercepta chamadas do libvirtd e:
- Injeta `-L /usr/lib/xen/boot` para que QEMU encontre os ROMs
- Remove `-vnc` (e seu argumento) para evitar erro de keymap

Automatizado via script:
```bash
./scripts/xen/install_xen_bin_wrapper.sh 192.168.0.130 vagrant /home/vagrant/.ssh/skynet-key-ecdsa
```

### 3. **Ajustar XML do Domínio** (Host libvirt)

Arquivo: `configs/kvm/libvirt/xen-debian-server01.xml`

Mudanças aplicadas:
- ❌ Removido `<interface>` (ROMs de NIC causavam erro)
- ❌ Removido `<graphics type='vnc'>` (ou desabilitado via `port='-1'`)
- ✅ Mantido `<emulator>/usr/lib/xen/bin/qemu-system-i386</emulator>` (aponta para o wrapper)
- ✅ Mantido `<serial>` e `<console>` (acesso via serial/console)

## Como Usar

### Setup Inicial (1x por host Xen)

```bash
# Host libvirt (onde roda virsh)
chmod +x scripts/xen/*.sh

# 1. Copiar ROMs
./scripts/xen/fix_vgabios.sh 192.168.0.130 vagrant /home/vagrant/.ssh/skynet-key-ecdsa

# 2. Instalar wrapper
./scripts/xen/install_xen_bin_wrapper.sh 192.168.0.130 vagrant /home/vagrant/.ssh/skynet-key-ecdsa
```

### Criar VM

```bash
export LIBVIRT_DEFAULT_URI='xen+ssh://vagrant@192.168.0.130?keyfile=/home/vagrant/.ssh/skynet-key-ecdsa'
virsh create configs/kvm/libvirt/xen-debian-server01.xml
virsh list
```

### Acessar Console da VM

```bash
# Via virsh console
virsh console debian-server01

# Via SSH (se tiver rede configurada)
ssh root@<IP-VM>
```

### Remover/Desligar VM

```bash
virsh destroy debian-server01
virsh undefine debian-server01
```

## Desfazer Mudanças (Se Necessário)

Host Xen:
```bash
# Restaurar qemu original
sudo mv /usr/lib/xen/bin/qemu-system-i386.bak.bin /usr/lib/xen/bin/qemu-system-i386

# Remover ROMs copiadas
sudo rm -f /usr/lib/xen/boot/vgabios-*.bin
```

## Integração com Vagrant (Vagrant, Provisioning)

Se você quiser automatizar isso ao subir VMs com Vagrant:

### Opção 1: Provisioning Script Vagrant

Adicione ao `Vagrantfile`:
```ruby
config.vm.provision "shell", inline: <<-SHELL
  # Rodar no guest Vagrant (host Xen)
  /path/to/scripts/xen/fix_vgabios.sh
  /path/to/scripts/xen/install_xen_bin_wrapper.sh
SHELL
```

### Opção 2: Makefile (Recomendado)

Crie `Makefile` no projeto:
```makefile
.PHONY: setup-xen-libvirt
setup-xen-libvirt:
	chmod +x scripts/xen/*.sh
	./scripts/xen/fix_vgabios.sh $(XEN_HOST) $(XEN_USER) $(XEN_KEY)
	./scripts/xen/install_xen_bin_wrapper.sh $(XEN_HOST) $(XEN_USER) $(XEN_KEY)

.PHONY: create-xen-vm
create-xen-vm:
	export LIBVIRT_DEFAULT_URI='xen+ssh://$(XEN_USER)@$(XEN_HOST)?keyfile=$(XEN_KEY)' && \
	virsh create configs/kvm/libvirt/xen-debian-server01.xml

# Usar:
# make setup-xen-libvirt XEN_HOST=192.168.0.130 XEN_USER=vagrant XEN_KEY=/home/vagrant/.ssh/skynet-key-ecdsa
# make create-xen-vm XEN_HOST=192.168.0.130 XEN_USER=vagrant XEN_KEY=/home/vagrant/.ssh/skynet-key-ecdsa
```

### Opção 3: Script Shell Wrapper

Crie `scripts/xen/setup-and-create.sh`:
```bash
#!/usr/bin/env bash
set -euo pipefail

HOST="${1:-192.168.0.130}"
USER="${2:-vagrant}"
KEY="${3:-/home/vagrant/.ssh/skynet-key-ecdsa}"

echo "=== Setup Xen Libvirt ==="
./scripts/xen/fix_vgabios.sh "$HOST" "$USER" "$KEY"
./scripts/xen/install_xen_bin_wrapper.sh "$HOST" "$USER" "$KEY"

echo ""
echo "=== Criando VM ==="
export LIBVIRT_DEFAULT_URI="xen+ssh://${USER}@${HOST}?keyfile=${KEY}"
virsh create configs/kvm/libvirt/xen-debian-server01.xml
virsh list

echo ""
echo "=== VM criada com sucesso! ==="
echo "Acesse via console: virsh console debian-server01"
```

Uso:
```bash
chmod +x scripts/xen/setup-and-create.sh
./scripts/xen/setup-and-create.sh 192.168.0.130 vagrant /home/vagrant/.ssh/skynet-key-ecdsa
```

## Arquivos Modificados

| Arquivo | Mudança |
|---------|---------|
| `configs/kvm/libvirt/xen-debian-server01.xml` | Removido `<interface>`, ajustado `<graphics>`, mantido `<serial>` |
| `scripts/xen/fix_vgabios.sh` | Copia ROMs para `/usr/lib/xen/boot` |
| `scripts/xen/install_xen_bin_wrapper.sh` | Instala wrapper que injeta `-L` e remove `-vnc` |
| `scripts/xen/diagnose_qemu_open.sh` | Diagnóstico de tentativas de abertura de arquivos |

## Referências

- Libvirt Xen Driver: https://libvirt.org/drvxen.html
- QEMU ROMs e Paths: https://wiki.qemu.org/Documentation/Platforms/X86#Firmware_and_ROMs
- Xen HVM: https://wiki.xen.org/wiki/Xen_Project_Software_Overview#HVM

## Status: ✅ RESOLVIDO

VM `debian-server01` foi criada com sucesso via libvirt remoto (xen+ssh).
