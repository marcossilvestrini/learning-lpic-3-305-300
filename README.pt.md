<h1><a name="readme-top"></a></h1>

[![Create Release](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml)
[![Translate README](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml)
[![Generate HTML and PDF](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml)
[![Deploy Webpage](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/deploy-webpage.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/deploy-webpage.yml)
[![Generate GitBook Docs](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-docs.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-docs.yml)
[![PSScriptAnalyzer](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml)
[![Slack Notification](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml)

---

[MIT License][license-url]
[Forks][forks-url]
[Stargazers][stars-url]
[Contributors][contributors-url]
[Issues][issues-url]
[LinkedIn][linkedin-url]

---

# APRENDENDO LPIC-3 305-300 - TESTE TRADUÇÃO 02/07/2025

![LPIC3-305-300](images/lpic3-305-300.jpg)

<p align="center">
<strong>Explore a documentação »</strong></a>
    <br />
    <a href="https://marcossilvestrini.github.io/learning-lpic-3-305-300/">Site</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300">Página do Código</a>
    -
    <a href="https://skynet-8.gitbook.io/learning-lpic-3-305-300">Gitbook</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">Reportar Bug</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">Solicitar Recurso</a>
</p>

---

## Resumo

<details>
  <summary><b>TABELA DE CONTEÚDO</b></summary>
  <ol>
    <li>
      <a href="#about-the-project">Sobre o Projeto</a>
    </li>
    <li>
      <a href="#getting-started">Introdução</a>
      <ul>
        <li><a href="#prerequisites">Pré-requisitos</a></li>
        <li><a href="#installation">Instalação</a></li>
      </ul>
    </li>
    <li><a href="#usage">Uso</a></li>
    <li><a href="#roadmap">Roteiro</a></li>
    <li><a href="#freedoms">Quatro Liberdades Essenciais</a></li>
    <li>
      <a href="#topic-351">Tópico 351: Virtualização Completa</a>
      <ul>
        <li><a href="#topic-351.1">351.1 Conceitos e Teoria da Virtualização </a></li>
        <li><a href="#topic-351.2">351.2 Xen</a></li>
        <li><a href="#topic-351.3">351.3 QEMU</a></li>
        <li><a href="#topic-351.4">351.4 Gerenciamento de Máquinas Virtuais Libvirt</a></li>
        <li><a href="#topic-351.5">351.5 Gerenciamento de Imagens de Disco de Máquinas Virtuais</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-352">Tópico 352: Virtualização de Contêineres</a>
      <ul>
        <li><a href="#topic-352.1">352.1 Conceitos de Virtualização de Contêineres</a></li>
        <li><a href="#topic-352.2">352.2 LXC</a></li>
        <li><a href="#topic-352.3">352.3 Docker</a></li>
        <li><a href="#topic-352.4">352.4 Plataformas de Orquestração de Contêineres</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-353">Tópico 353: Implantação e Provisionamento de VM</a>
      <ul>
        <li><a href="#topic-353.1">353.1 Ferramentas de Gerenciamento de Nuvem</a></li>
        <li><a href="#topic-353.2">353.2 Packer</a></li>
        <li><a href="#topic-353.3">353.3 cloud-init</a></li>
        <li><a href="#topic-353.4">353.4 Vagrant</a></li>
      </ul>
    </li>
    <li><a href="#license">Licença</a></li>
    <li><a href="#contact">Contato</a></li>
    <li><a href="#acknowledgments">Agradecimentos</a></li>
  </ol>
</details><br>

---

<a name="about-the-project"></a>

## Sobre o Projeto

> Este projeto tem como objetivo ajudar estudantes ou profissionais a aprender os principais conceitos do GNULinux
> e software livre
> Algumas distribuições do GNULinux, como Debian e RPM, serão abordadas
> A instalação e configuração de alguns pacotes também serão abordadas
> Ao fazer isso, você pode dar a toda a comunidade a chance de se beneficiar de suas mudanças.
> O acesso ao código-fonte é uma pré-condição para isso.
> Use o vagrant para subir máquinas e executar laboratórios e conteúdos práticos neste artigo.
> Eu publiquei na pasta Vagrant um Vagrantfile com o que é necessário
> para você subir um ambiente para estudos

---

<p align="right">(<a href="#readme-top">voltar ao topo</a>)</p>

<a name="getting-started"></a>

## Introdução

Para começar a aprendizagem, veja a documentação acima.

<a name="prerequisites"></a>

### Pré-requisitos

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [VMware Workstation](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
* [Vagrant VMWare Utility](https://developer.hashicorp.com/vagrant/install/vmware)
* [Vagrant](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### Instalação

Clone o repositório

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

Personalize um template *Vagrantfile-topic-XXX*. Este arquivo contém uma configuração de vms para laboratórios. Exemplo:

* Arquivo [Vagrantfile-topic-351](vagrant/Vagrantfile-topic-351)
  * vm.clone_directory = "<your_driver_letter>:\\`<folder>`\\<to_machine>\\#{VM_NAME}-instance-1"
    Exemplo: vm.clone_directory = "E:\\Servers\\VMWare\\#{VM_NAME}-instance-1"
  * vm.vmx["memsize"] = ""
  * vm.vmx["numvcpus"] = ""
  * vm.vmx["cpuid.coresPerSocket"] = ""

Personalize a configuração de rede nos arquivos [configs/network](configs/network/).

---

<a name="usage"></a>

## Uso

Use este repositório para aprender sobre o exame LPIC-3 305-300

### Para subir e descer

Troque um template *Vagrantfile-topic-xxx* e copie para um novo arquivo com o nome *Vagrantfile*

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### Para reiniciar vms

```sh
cd vagrant && vagrant reload
```

**Importante:**
*Se você reiniciar vms sem vagrant, a pasta compartilhada não será montada após a inicialização.*

### Use powershell para subir e descer

Se você usar a plataforma Windows, eu criei um script powershell para subir e descer vms.

```powershell
vagrant/up.ps1
vagrant/destroy.ps1
```

### Esquema de Infraestrutura Tópico 351

![topic-351](images/infraestructure-topic-351.png)

<p align="right">(<a href="#readme-top">voltar ao topo</a>)</p>

---

<a name="roadmap"></a>

## Roteiro

* [X] Criar repositório
* [X] Criar scripts para provisionamento de laboratórios
* [X] Criar exemplos sobre o Tópico 351
* [X] Criar exemplos sobre o Tópico 352
* [ ] Criar exemplos sobre o Tópico 353
* [ ] Fazer upload de simulado itexam

---

<a name="freedoms"></a>

## Quatro Liberdades Essenciais

> 0.A liberdade de executar o programa como você desejar, para qualquer propósito (liberdade 0).
> 1.A liberdade de estudar como o programa funciona e mudá-lo para que faça
> sua computação como você desejar (liberdade 1).
> O acesso ao código-fonte é uma pré-condição para isso.
> 2.A liberdade de redistribuir cópias para que você possa ajudar outros (liberdade 2).
> 3.liberdade de distribuir cópias de suas versões modificadas para outros (liberdade 3).

---

## Comandos de Inspeção

```sh
type COMMAND
apropos COMMAND
whatis COMMAND --long
whereis COMMAND
COMMAND --help, --h
man COMMAND
```

<p align="right">(<a href="#readme-top">voltar ao topo</a>)</p>

---

<a name="topic-351"></a>

## Tópico 351: Virtualização Completa

![LPIC3-305-300](images/virtualization-351.png)

---

<a name="topic-351.1"></a>

### 351.1 Conceitos e Teoria da Virtualização

**Peso:** 6

**Descrição:** Os candidatos devem conhecer e entender os conceitos gerais, teoria e terminologia da virtualização. Isso inclui a terminologia do Xen, QEMU e libvirt.

**Áreas de Conhecimento Chave:**

* 🖥️ Entender a terminologia de virtualização
* ⚖️ Entender os prós e contras da virtualização
* 🛠️ Entender as várias variações de Hypervisors e Monitores de Máquinas Virtuais
* 🔄 Entender os principais aspectos da migração de máquinas físicas para virtuais
* 🚀 Entender os principais aspectos da migração de máquinas virtuais entre sistemas host
* 📸 Entender as características e implicações da virtualização para uma máquina virtual, como instantâneas, pausa, clonagem e limites de recursos
* 🌐 Consciência de oVirt, Proxmox, systemd-machined e VirtualBox
* 🔗 Consciência de Open vSwitch

#### 351.1 Objetos Citados

```sh
Hypervisor
Máquina Virtual Baseada em Hardware (HVM)
Paravirtualização (PV)
Emulação e Simulação
Flags de CPU
/proc/cpuinfo
Migração (P2V, V2V)
```

#### Hypervisors

##### Hypervisor Tipo 1 (Hypervisor Bare-Metal)

###### Definição Tipo 1

Executa diretamente no hardware físico do host, fornecendo uma camada base para gerenciar VMs sem a necessidade de um sistema operacional host.

###### Características Tipo 1

* ⚡ Alto desempenho e eficiência.
* ⏱️ Menor latência e sobrecarga.
* 🏢 Frequentemente usado em ambientes empresariais e data centers.

###### Exemplos Tipo 1

* VMware ESXi: Um hypervisor robusto e amplamente utilizado em ambientes empresariais.
* Microsoft Hyper-V: Integrado ao Windows Server, oferecendo forte desempenho e recursos de gerenciamento.
* Xen: Um hypervisor de código aberto usado por muitos provedores de serviços em nuvem.
* KVM (Máquina Virtual Baseada em Kernel): Integrado ao kernel Linux, proporcionando alto desempenho para sistemas baseados em Linux.

##### Hypervisor Tipo 2 (Hypervisor Hospedado)

###### Definição Tipo 2

Executa sobre um sistema operacional convencional, dependendo do OS host para gerenciamento de recursos e suporte a dispositivos.

###### Características Tipo 2

* 🛠️ Mais fácil de configurar e usar, especialmente em computadores pessoais.
* 🔧 Mais flexível para desenvolvimento, teste e implantações em menor escala.
* 🐢 Tipicamente menos eficiente do que hypervisores Tipo 1 devido à sobrecarga adicional do OS host.

###### Exemplos Tipo 2

* VMware Workstation: Um hypervisor poderoso para executar vários sistemas operacionais em um único desktop.
* Oracle VirtualBox: Um hypervisor de código aberto conhecido por sua flexibilidade e facilidade de uso.
* Parallels Desktop: Projetado para usuários de Mac executarem Windows e outros sistemas operacionais ao lado do macOS.
* QEMU (Quick EMUlator): Um emulador e virtualizador de código aberto, frequentemente usado em conjunto com KVM.

##### Principais Diferenças Entre Hypervisores Tipo 1 e Tipo 2

* Ambiente de Implantação:
  * Hypervisores Tipo 1 são comumente implantados em data centers e ambientes empresariais devido à sua interação direta com o hardware e alto desempenho.
  * Hypervisores Tipo 2 são mais adequados para uso pessoal, desenvolvimento, teste e tarefas de virtualização em pequena escala.
* Desempenho:
  * Hypervisores Tipo 1 geralmente oferecem melhor desempenho e menor latência porque não dependem de um OS host.
  * Hypervisores Tipo 2 podem experimentar alguma degradação de desempenho devido à sobrecarga de execução sobre um OS host.
* Gerenciamento e Facilidade de Uso:
  * Hypervisores Tipo 1 requerem configuração e gerenciamento mais complexos, mas fornecem recursos avançados e escalabilidade para implantações em larga escala.
  * Hypervisores Tipo 2 são mais fáceis de instalar e usar, tornando-os ideais para usuários individuais e projetos menores.

##### Tipos de Migração

No contexto de hypervisores, que são tecnologias usadas para criar e gerenciar máquinas virtuais, os termos migração P2V e migração V2V são comuns em ambientes de virtualização.
Eles se referem a processos de migração de sistemas entre diferentes tipos de plataformas.

##### P2V - Migração de Física para Virtual

A migração P2V refere-se ao processo de migração de um servidor físico para uma máquina virtual. Em outras palavras, um sistema operacional e seus aplicativos, executando em hardware físico dedicado, são "convertidos" e movidos para uma máquina virtual que roda em um hypervisor (como VMware, Hyper-V, KVM, etc.).

* Exemplo: Você tem um servidor físico executando um sistema Windows ou Linux, e deseja movê-lo para um ambiente virtual, como uma infraestrutura em nuvem ou um servidor de virtualização interno.
  O processo envolve copiar todo o estado do sistema, incluindo o sistema operacional, drivers e dados, para criar uma máquina virtual equivalente que pode ser executada como se estivesse no hardware físico.

##### V2V  - Migração de Virtual para Virtual

A migração V2V refere-se ao processo de migração de uma máquina virtual de um hypervisor para outro. Neste caso, você já tem uma máquina virtual rodando em um ambiente virtualizado (como VMware), e deseja movê-la para outro ambiente virtualizado (por exemplo, para Hyper-V ou para um novo servidor VMware).

* Exemplo: Você tem uma máquina virtual rodando em um servidor de virtualização VMware, mas decide migrá-la para uma plataforma Hyper-V. Neste caso, a migração V2V converte a máquina virtual de um formato ou hypervisor para outro, garantindo que ela possa continuar a ser executada corretamente.

#### HVM e Paravirtualização

##### Virtualização Assistida por Hardware (HVM)

###### Definição HVM

HVM aproveita as extensões de hardware fornecidas por CPUs modernas para virtualizar hardware, permitindo a criação e gerenciamento de VMs com mínima sobrecarga de desempenho.

###### Características Chave do HVM

* 🖥️ **Suporte de Hardware**: Requer suporte da CPU para extensões de virtualização, como Intel VT-x ou AMD-V.
* 🛠️ **Virtualização Completa:** VMs podem executar sistemas operacionais convidados não modificados, pois o hypervisor fornece uma emulação completa do ambiente de hardware.
* ⚡ **Desempenho:** Geralmente oferece desempenho quase nativo devido à execução direta do código convidado na CPU.
* 🔒 **Isolamento:** Proporciona forte isolamento entre VMs, uma vez que cada VM opera como se tivesse seu próprio hardware dedicado.

###### Exemplos de HVM

VMware ESXi, Microsoft Hyper-V, KVM (Máquina Virtual Baseada em Kernel).

###### Vantagens do HVM

* ✅ **Compatibilidade:**