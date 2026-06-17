# Criando VMs Xen Remotamente com Libvirt

Este diretório contém exemplos de XML para criar domínios libvirt. O caso mais importante para o lab é criar uma VM HVM no host Xen usando `virsh` a partir de outro host, normalmente a VM `lpic3-topic-351-kvm`.

## Topologia do Lab

```text
lpic3-topic-351-kvm
  Cliente libvirt/virsh
  Usa URI xen+ssh://...
  Possui os XMLs em configs/kvm/libvirt/

lpic3-topic-351-xen
  Host Xen / Dom0
  Executa libvirtd com driver Xen
  Executa QEMU device model para VMs HVM
```

O fluxo é:

1. Preparar o host Xen com Xen, bridge `xenbr0`, libvirt e wrapper QEMU.
2. Preparar uma imagem QCOW2 específica para Xen/libvirt remoto.
3. Criar a VM a partir de `configs/kvm/libvirt/xen-debian-server01.xml`.
4. Acessar a VM por `virsh console` ou SSH.

## Arquivos Envolvidos

| Arquivo                                       | Função                                                       |
| --------------------------------------------- | ------------------------------------------------------------ |
| `scripts/xen/fix-libvirt-qemu.sh`             | Prepara ROMs e wrappers QEMU no host Xen                     |
| `scripts/xen/libvirt.sh`                      | Instala/configura libvirt no host Xen                        |
| `scripts/xen/network.sh`                      | Configura a bridge Xen `xenbr0`                              |
| `configs/kvm/libvirt/xen-debian-server01.xml` | XML do domínio Xen HVM criado remotamente com libvirt        |
| `scripts/kvm/libvirt.sh`                      | Instala/configura libvirt no host KVM cliente                |
| `scripts/kvm/storage.sh`                      | Configura storage pools locais no host KVM                   |
| `scripts/kvm/prepare-debian-xen-overlay.sh`   | Cria/customiza overlay QCOW2 para console serial, DHCP e SSH |
| `helps/libvirt_xen_fix.md`                    | Histórico do problema de QEMU/ROM/VNC e solução inicial      |

## Problema Resolvido

Ao criar uma VM Xen HVM remotamente com libvirt, o QEMU device model pode falhar com erros como:

```text
error: internal error: libxenlight failed to create new domain 'debian-server01'
qemu-system-i386: -device cirrus-vga,vgamem_mb=8: failed to find romfile "vgabios-cirrus.bin"
```

A causa é que o QEMU chamado pelo driver Xen/libvirt não encontra os ROMs de vídeo/rede no path esperado. Neste lab, `scripts/xen/fix-libvirt-qemu.sh` resolve isso copiando ROMs para `/usr/lib/xen/boot` e instalando wrappers que injetam:

```text
-L /usr/lib/xen/boot
```

O wrapper também remove `-vnc` para evitar erro de keymap/VNC no device model. Por isso o acesso principal à VM deve ser feito por console serial.

## Preparar o Host Xen

Execute no host Xen, normalmente `lpic3-topic-351-xen`:

```bash
cd /home/vagrant

sudo bash scripts/xen/network.sh
sudo bash scripts/xen/libvirt.sh
sudo bash scripts/xen/fix-libvirt-qemu.sh
```

Valide:

```bash
ip addr show xenbr0
systemctl status libvirtd --no-pager
ls -l /usr/lib/xen/boot
ls -l /usr/lib/xen/bin/qemu-system-i386
```

O wrapper grava um log simples em:

```bash
sudo tail -f /var/log/qemu-xen-wrapper.log
```

## Preparar o Host KVM Cliente

Execute no host que vai chamar o Xen remotamente, normalmente `lpic3-topic-351-kvm`:

```bash
cd /home/vagrant

sudo bash scripts/kvm/libvirt.sh
sudo bash scripts/kvm/storage.sh
```

Valide pools locais:

```bash
virsh pool-list --all
virsh vol-info --pool os-images Debian_12.0.0.qcow2
```

## Preparar a Imagem Overlay para Xen

Não altere a imagem base `Debian_12.0.0.qcow2`, pois ela pode ser usada por outros labs. Use um overlay:

```bash
sudo bash scripts/kvm/prepare-debian-xen-overlay.sh
```

Por padrão, o script usa:

```text
BASE_IMAGE=/home/vagrant/os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2
OVERLAY_IMAGE=/home/vagrant/os-images/Debian_12.0.0_VMM/Debian_12.0.0-xen-serial.qcow2
GUEST_IFACE=enX0
```

Ele configura no overlay:

- `console=tty0 console=ttyS0,115200n8` no GRUB.
- `serial-getty@ttyS0.service` para login via `virsh console`.
- Chaves de host SSH com `ssh-keygen -A`.
- `ssh.service` habilitado.
- DHCP automático na interface `enX0`.

Se o nome da interface mudar, rode com outro valor:

```bash
sudo GUEST_IFACE=eth0 bash scripts/kvm/prepare-debian-xen-overlay.sh
```

Importante: execute `virt-customize` somente com a VM desligada. Nunca customize um QCOW2 que está em uso por uma VM ativa.

## XML da VM Xen

O arquivo principal é:

```text
configs/kvm/libvirt/xen-debian-server01.xml
```

Pontos importantes:

```xml
<domain type='xen'>
```

Usa o driver Xen remoto.

```xml
<emulator>/usr/lib/xen/bin/qemu-system-i386</emulator>
```

Aponta para o wrapper preparado no host Xen.

```xml
<source file='/home/vagrant/os-images/Debian_12.0.0_VMM/Debian_12.0.0-xen-serial.qcow2'/>
```

Usa o overlay customizado, não a imagem base.

```xml
<interface type='bridge'>
  <mac address='52:54:00:35:10:01'/>
  <source bridge='xenbr0'/>
  <model type='e1000'/>
</interface>
```

Conecta a VM na bridge Xen `xenbr0`.

```xml
<serial type='pty'>
<console type='pty'>
```

Expõe console serial para `virsh console`.

```xml
<graphics type='vnc' port='-1' autoport='no'/>
```

O XML ainda contém graphics, mas o wrapper remove `-vnc` do comando real do QEMU. Use console serial como caminho principal.

## Criar a VM Remotamente

No host KVM cliente:

```bash
export LIBVIRT_DEFAULT_URI='xen+ssh://vagrant@192.168.0.130'
virsh create configs/kvm/libvirt/xen-debian-server01.xml
```

Se precisar informar chave SSH explicitamente:

```bash
export LIBVIRT_DEFAULT_URI='xen+ssh://vagrant@192.168.0.130?keyfile=/home/vagrant/.ssh/skynet-key-ecdsa'
virsh create configs/kvm/libvirt/xen-debian-server01.xml
```

Valide:

```bash
virsh list
virsh domstate debian-server01
virsh domiflist debian-server01
```

Resultado esperado para rede:

```text
Interface    Type     Source   Model   MAC
-----------------------------------------------------------
vifX.0-emu   bridge   xenbr0   e1000   52:54:00:35:10:01
```

No host Xen, também é possível conferir com:

```bash
sudo xl list
sudo tail -n 100 /var/log/qemu-xen-wrapper.log
sudo ls -l /var/log/xen/
```

## Acessar o Console

No host cliente:

```bash
virsh console debian-server01
```

Se conectar e a tela ficar parada, pressione `Enter`.

Para sair do console:

```text
Ctrl + ] ou Ctrl + 5
```

O login aparece em `ttyS0` quando o overlay foi preparado corretamente:

```text
Debian GNU/Linux 12 debian ttyS0

debian login:
```

## Validar Rede Dentro da VM

Dentro da VM:

```bash
ip link
ip addr
ip route
ping 1.1.1.1
ping google.com
```

Se a interface existir mas estiver `DOWN`, suba manualmente para teste:

```bash
sudo ip link set enX0 up
sudo dhclient enX0
```

Depois de aplicar `scripts/kvm/prepare-debian-xen-overlay.sh`, a interface deve subir automaticamente via `/etc/network/interfaces.d/enX0.cfg`.

## Validar SSH

Dentro da VM:

```bash
sudo systemctl status ssh --no-pager
sudo journalctl -u ssh -b --no-pager
sudo sshd -t
```

Se aparecer:

```text
sshd: no hostkeys available -- exiting.
```

gere as chaves:

```bash
sudo ssh-keygen -A
sudo systemctl reset-failed ssh
sudo systemctl restart ssh
```

O script `scripts/kvm/prepare-debian-xen-overlay.sh` já executa `ssh-keygen -A` no overlay.

## Desligar e Recriar

Para destruir uma VM transitória criada com `virsh create`:

```bash
virsh destroy debian-server01
```

Para recriar:

```bash
virsh create configs/kvm/libvirt/xen-debian-server01.xml
```

Se ela tiver sido definida persistentemente:

```bash
virsh undefine debian-server01
```

## Troubleshooting

### `failed to find romfile "vgabios-cirrus.bin"`

Rode no host Xen:

```bash
sudo bash scripts/xen/fix-libvirt-qemu.sh
```

Valide:

```bash
ls -l /usr/lib/xen/boot/vgabios-*
```

### `virsh console` conecta mas parece congelado

Isso ocorre quando a VM HVM não envia saída para `ttyS0`. Prepare o overlay:

```bash
virsh destroy debian-server01
sudo bash scripts/kvm/prepare-debian-xen-overlay.sh
virsh create configs/kvm/libvirt/xen-debian-server01.xml
virsh console debian-server01
```

### XML mostra VNC, mas não abre console gráfico

O wrapper remove `-vnc` do comando real do QEMU. Isso foi feito para evitar erro de keymap/VNC no device model Xen. Use `virsh console`.

Confira o comando real:

```bash
sudo tail -n 20 /var/log/qemu-xen-wrapper.log
```

Você deve ver algo parecido com:

```text
-display none -serial pty ... -machine xenfv ...
```

### A VM só mostra `lo` em `ip link`

O XML não criou NIC ou a VM foi criada com uma versão antiga do XML. Confira:

```bash
virsh domiflist debian-server01
```

O XML deve conter:

```xml
<interface type='bridge'>
  <source bridge='xenbr0'/>
  <model type='e1000'/>
</interface>
```

### A NIC existe, mas vem `DOWN`

Teste manual:

```bash
sudo ip link set enX0 up
sudo dhclient enX0
```

Depois prepare o overlay para persistir DHCP:

```bash
virsh destroy debian-server01
sudo bash scripts/kvm/prepare-debian-xen-overlay.sh
virsh create configs/kvm/libvirt/xen-debian-server01.xml
```

### `pool has no config file`

Isso acontece quando um pool foi criado com `virsh pool-create`, que cria pool transitório. Para pool persistente:

```bash
virsh pool-destroy default
virsh pool-define --file configs/kvm/libvirt/storage-pool-default.xml
virsh pool-start default
virsh pool-autostart default
```

Não use `--overwrite` em pool `type='dir'`, porque isso força caminho de formatação e o libvirt passa a esperar um source device.

## Estado Esperado

Com tudo configurado, estes comandos devem funcionar:

```bash
virsh create configs/kvm/libvirt/xen-debian-server01.xml
virsh list
virsh domiflist debian-server01
virsh console debian-server01
```

Dentro da VM:

```bash
ip addr
ping 1.1.1.1
ping google.com
systemctl status ssh --no-pager
```

Resultado final esperado:

- VM `debian-server01` em estado `running`.
- Console serial funcional em `ttyS0`.
- Interface `enX0` ligada ao bridge `xenbr0`.
- DHCP funcional.
- SSH com host keys geradas e serviço ativo.
