<h1><a name="readme-top"></a></h1>

[![Create Release](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml)[![Translate README](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml)[![Generate HTML and PDF](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml)[![Deploy Webpage](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/deploy-webpage.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/deploy-webpage.yml)[![Generate GitBook Docs](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-docs.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-docs.yml)[![PSScriptAnalyzer](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml)[![Slack Notification](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml)

* * *

[Minha licença][license-url][Garfos][forks-url][Observadores das estrelas][stars-url][Colaboradores][contributors-url][Problemas][issues-url]

## [LinkedIn][linkedin-url]

# 📚 APRENDIZAGEM LPIC-3 305-300

[![English](https://img.shields.io/badge/lang-English-blue?logo=readme&logoColor=white)](./README.md)[![Português](https://img.shields.io/badge/lang-Português-green?logo=readme&logoColor=white)](README_pt.md)

![LPIC3-305-300](images/lpic3-305-300.jpg)

<p align="center">
<strong>Explore the docs »</strong></a>
    <br />
    <a href="https://marcossilvestrini.github.io/learning-lpic-3-305-300/">Web Site</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300">Code Page</a>
    -
    <a href="https://skynet-8.gitbook.io/learning-lpic-3-305-300">Gitbook</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">Report Bug</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">Request Feature</a>
</p>

* * *

## Resumo Resumo

<details>
  <summary><b>TABLE OF CONTENT</b></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#freedoms">Four Essential Freedoms</a></li>
    <li>
      <a href="#topic-351">Topic 351: Full Virtualization</a>
      <ul>
        <li><a href="#topic-351.1">351.1 Virtualization Concepts and Theory </a></li>
        <li><a href="#topic-351.2">351.2 Xen</a></li>
        <li><a href="#topic-351.3">351.3 QEMU</a></li>
        <li><a href="#topic-351.4">351.4 Libvirt Virtual Machine</a></li>
        <li><a href="#topic-351.5">351.5 Virtual Machine Disk Image Management</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-352">Topic 352: container Virtualization</a>
      <ul>
        <li><a href="#topic-352.1">352.1 container Virtualization Concepts</a></li>
        <li><a href="#topic-352.2">352.2 LXC</a></li>
        <li><a href="#topic-352.3">352.3 Docker</a></li>
        <li><a href="#topic-352.4">352.4 container Orchestration Platforms</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-353">Topic 353: VM Deployment and Provisioning</a>
      <ul>
        <li><a href="#topic-353.1">353.1 Cloud Management Tools</a></li>
        <li><a href="#topic-353.2">353.2 Packer</a></li>
        <li><a href="#topic-353.3">353.3 cloud-init</a></li>
        <li><a href="#topic-353.4">353.4 Vagrant</a></li>
      </ul>
    </li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details><br>

* * *

<a name="about-the-project"></a>

## 📖 Sobre o Projeto

> Este projeto visa ajudar estudantes ou profissionais a aprender os principais conceitos do GNULinux
> e software livre
> Algumas distribuições GNULinux como Debian e RPM serão abordadas
> A instalação e configuração de alguns pacotes também serão abordadas
> Ao fazer isso, você pode dar a toda a comunidade a chance de se beneficiar de suas mudanças.
> O acesso ao código-fonte é uma pré-condição para isso.
> Use o vagrant para atualizar máquinas e executar laboratórios e praticar o conteúdo deste artigo.
> Publiquei na pasta Vagrant um Vagrantfile com o que é necessário
> para você subir um ambiente para estudos

* * *

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<a name="getting-started"></a>

## 🚀 Introdução

Para iniciar o aprendizado, consulte a documentação acima.

<a name="prerequisites"></a>

### 🛠️ Pré-requisitos

-   [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
-   [Estação de trabalho VMware](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
-   [Utilitário Vagrant VMWare](https://developer.hashicorp.com/vagrant/install/vmware)
-   [Vagabundo](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### 💾 Instalação

Clonar o repositório

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

Personalize um modelo_VagrantFile-Topic-xxx_. Este arquivo contém uma configuração VMS para laboratórios. Exemplo:

-   Arquivo[Vagrantfile-topic-351](vagrant/Vagrantfile-topic-351)
    -   vm.clone_directory = "&lt;your_driver_letter>:\\`<folder>`\\&lt;para_machine>\\#{VM_NAME}-instance-1"
        Exemplo: vm.clone_directory = "E:\\Servidores\\VMware\\#{Vm_name} -instance-1 "
    -   vm.vmx["mem tamanho"]= ""
    -   vm.vmx[“NumVCPus”"]= ""
    -   vm.vmx["Cpuid.correspersocout"]= ""

Personalize a configuração de rede em arquivos[configurações/rede](configs/network/).

* * *

<a name="usage"></a>

## 📝 Uso

Use este repositório para aprender sobre o exame LPIC-3 305-300

### ⬆️⬇️ Para cima e para baixo

Mudar a_VagrantFile-Topic-xxx_modelo e copie para um novo arquivo com nome_VagrantFile_

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### 🔄 Para reiniciar VMs

```sh
cd vagrant && vagrant reload
```

**Importante:**_Se você reiniciar o vms sem o vagrant, a pasta compartilhada não será montada após a inicialização._

### 💻 Use PowerShell para cima e para baixo

Se você usa a plataforma Windows, eu crio um script PowerShell para ativar e desativar vms.

```powershell
vagrant/up.ps1
vagrant/destroy.ps1
```

### 🗺️ Tópico 351 do esquema de infraestrutura

![topic-351](images/infrastructure-topic-351.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="roadmap"></a>

## 🛣️ Roteiro

-   [x] Criar repositório
-   [x] Crie scripts para laboratórios de provisionamento
-   [x] Crie exemplos sobre o Tópico 351
-   [x] Crie exemplos sobre o tópico 352
-   [ ] Crie exemplos sobre o Tópico 353
-   [ ] Carregar itexam simulado

* * *

<a name="freedoms"></a>

## 🗽 Quatro liberdades essenciais

> 0.a liberdade para executar o programa como desejar, para qualquer finalidade (liberdade 0).
> 1.A liberdade para estudar como o programa funciona e muda para
> sua computação como desejar (liberdade 1).
> O acesso ao código -fonte é uma condição prévia para isso.
> 2.A liberdade para redistribuir cópias para que você possa ajudar os outros (liberdade 2).
> 3.Freedom para distribuir cópias de suas versões modificadas para outras pessoas (liberdade 3).

* * *

## 🔍 Inspecione comandos

```sh
type COMMAND
apropos COMMAND
whatis COMMAND --long
whereis COMMAND
COMMAND --help, --h
man COMMAND
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351"></a>

## 🖥️ Tópico 351: Virtualização completa

![Virtualization](images/virtualization-351.png)

* * *

<a name="topic-351.1"></a>

### 🧠 351.1 Conceitos e teoria de virtualização

**Peso:**6

**Descrição:**Os candidatos devem conhecer e compreender os conceitos gerais, teoria e terminologia da virtualização. Isso inclui a terminologia Xen, QEMU e libvirt.

**Principais áreas de conhecimento:**

-   🖥️ entender a terminologia da virtualização
-   ⚖️ Entenda os prós e os contras da virtualização
-   🛠️ Entenda as diversas variações de hipervisores e monitores de máquinas virtuais
-   🔄 Entenda os principais aspectos da migração de máquinas físicas para virtuais
-   🚀 Compreenda os principais aspectos da migração de máquinas virtuais entre sistemas host
-   📸 Compreender os recursos e implicações da virtualização para uma máquina virtual, como snapshot, pausa, clonagem e limites de recursos
-   🌐 Consciência de ovirt, proxmox, Systemd Machined e VirtualBox
-   🔗 Conscientização do Open vSwitch

#### 📋 351.1 Objetos citados

```sh
Hypervisor
Hardware Virtual Machine (HVM)
Paravirtualization (PV)
Emulation and Simulation
CPU flags
/proc/cpuinfo
Migration (P2V, V2V)
```

#### 🖥️ Hipervisores

##### 🏢 Hypervisor tipo 1 (hipervisor nua-metal)

###### 📄 Definição Tipo 1

Executa diretamente no hardware físico do host, fornecendo uma camada base para gerenciar VMs sem a necessidade de um sistema operacional host.

###### 📝 Características Tipo 1

-   ⚡ Alto desempenho e eficiência.
-   Latência mais baixa e sobrecarga.
-   🏢 Frequentemente usado em ambientes corporativos e data centers.

###### 💡 Exemplos de tipo 1

-   VMware ESXi: um hipervisor robusto e amplamente utilizado em ambientes empresariais.
-   Microsoft Hyper-V: integrado ao Windows Server, oferecendo fortes recursos de desempenho e gerenciamento.
-   Xen: Um hipervisor de código aberto usado por muitos provedores de serviços em nuvem.
-   KVM (máquina virtual baseada em kernel): integrada ao kernel Linux, fornecendo alto desempenho para sistemas baseados em Linux.

##### 🏠 Hypervisor tipo 2 (hipervisor hospedado)

###### 📄 Definição do tipo 2

Executa em cima de um sistema operacional convencional, contando com o sistema operacional host para gerenciamento de recursos e suporte ao dispositivo.

###### 📝 Características do tipo 2

-   🛠️ Mais fácil de configurar e usar, especialmente em computadores pessoais.
-   🔧 Mais flexível para desenvolvimento, teste e implantações em menor escala.
-   🐢 Normalmente menos eficiente que os hipervisores Tipo 1 devido à sobrecarga adicional do sistema operacional host.

###### 💡 Exemplos de tipo 2

-   Estação de trabalho VMware: um hipervisor poderoso para executar vários sistemas operacionais em um único desktop.
-   Oracle VirtualBox: um hipervisor de código aberto conhecido por sua flexibilidade e facilidade de uso.
-   Paralels Desktop: Projetado para usuários de Mac para executar o Windows e outros sistemas operacionais ao lado de MacOS.
-   Qemu (emulador rápido): um emulador de código aberto e virtualizador, geralmente usado em conjunto com o KVM.

##### ⚖️ Diferenças -chave entre os hipervisores do tipo 1 e do tipo 2

-   Ambiente de implantação:
    -   Os hipervisores do tipo 1 são comumente implantados em data centers e ambientes corporativos devido à sua interação direta com hardware e alto desempenho.
    -   Os hipervisores do tipo 2 são mais adequados para tarefas de uso pessoal, desenvolvimento, teste e virtualização em pequena escala.
-   Desempenho:
    -   Os hipervisores tipo 1 geralmente oferecem melhor desempenho e menor latência porque não dependem de um sistema operacional host.
    -   Os hipervisores tipo 2 podem sofrer alguma degradação de desempenho devido à sobrecarga de execução em um sistema operacional host.
-   Gerenciamento e facilidade de uso:
    -   Os hipervisores do tipo 1 requerem configuração e gerenciamento mais complexos, mas fornecem recursos avançados e escalabilidade para implantações em larga escala.
    -   Os hipervisores tipo 2 são mais fáceis de instalar e usar, tornando -os ideais para usuários individuais e projetos menores.

##### 🔄 Tipos de migração

No contexto dos hipervisores, que são tecnologias utilizadas para criar e gerenciar máquinas virtuais, os termos migração P2V e migração V2V são comuns em ambientes de virtualização.
Referem-se a processos de migração de sistemas entre diferentes tipos de plataformas.

##### 🖥️➡️🖥️ P2V - Migração Física para Virtual

A migração de P2V refere-se ao processo de migração de um servidor físico para uma máquina virtual. Em outras palavras, um sistema operacional e seus aplicativos, executando em hardware físico dedicado, são "convertidos" e movidos a uma máquina virtual que é executada em um hipervisor (como VMware, Hyper-V, KVM, etc.).

-   Exemplo: você tem um servidor físico executando um sistema Windows ou Linux e deseja movê -lo para um ambiente virtual, como uma infraestrutura em nuvem ou um servidor de virtualização interna.
    O processo envolve copiar todo o estado do sistema, incluindo o sistema operacional, drivers e dados, para criar uma máquina virtual equivalente que possa funcionar como se estivesse no hardware físico.

##### 🖥️🔁🖥️ V2V - Migração Virtual para Virtual

A migração V2V refere-se ao processo de migração de uma máquina virtual de um hipervisor para outro. Nesse caso, você já tem uma máquina virtual rodando em um ambiente virtualizado (como VMware) e deseja movê-la para outro ambiente virtualizado (por exemplo, para Hyper-V ou para um novo servidor VMware).

-   Exemplo: você tem uma máquina virtual em execução em um servidor de virtualização do VMware, mas decide migrá-lo para uma plataforma Hyper-V. Nesse caso, a migração V2V converte a máquina virtual de um formato ou hipervisor para outro, garantindo que ela possa continuar funcionando corretamente.

#### 🧩 HVM e paravirtualização

##### ⚙️ Virtualização assistida por hardware (HVM)

###### 📄 Definição HVM

O HVM aproveita extensões de hardware fornecidas por CPUs modernas para virtualizar hardware, permitindo a criação e o gerenciamento de VMs com sobrecarga mínima de desempenho.

###### 📝 Principais características do HVM

-   🖥️**Suporte de hardware**: requer suporte de CPU para extensões de virtualização como Intel VT-x ou AMD-V.
-   🛠️**Virtualização completa:**As VMs podem executar sistemas operacionais de hóspedes não modificados, pois o hipervisor fornece uma emulação completa do ambiente de hardware.
-   ⚡**Desempenho:**Normalmente oferece desempenho quase nativo devido à execução direta do código convidado na CPU.
-   🔒**Isolamento:**Fornece forte isolamento entre VMs, pois cada VM opera como se tivesse seu próprio hardware dedicado.

###### 💡 Exemplos de HVM

VMware Esxi, Microsoft Hyper-V, KVM (máquina virtual baseada em kernel).

###### ✅ Vantagens do HVM

-   ✅**Compatibilidade:**Pode executar qualquer sistema operacional sem modificação.
-   ⚡**Desempenho:**Alto desempenho devido ao suporte de hardware.
-   🔒**Segurança:**Recursos aprimorados de isolamento e segurança fornecidos pelo hardware.

###### Desvantagens HVM Desvantagens

-   🛠️**Dependência de Hardware:**Requer recursos específicos de hardware, limitando a compatibilidade com sistemas mais antigos.
-   🔧**Complexidade:**Pode envolver configuração e gerenciamento mais complexos.

##### 🧩 Paravirtualização

###### 📄 Definição de paravirtualização

A paravirtualização envolve a modificação do sistema operacional convidado para estar ciente do ambiente virtual, permitindo que ele interaja de forma mais eficiente com o hipervisor.

###### 📝 Principais características da paravirtualização

-   🛠️**Modificação de convidados:**Requer alterações no sistema operacional convidado para se comunicar diretamente com o hipervisor usando hipercalls.
-   ⚡**Desempenho:**Pode ser mais eficiente que a virtualização completa tradicional, pois reduz a sobrecarga associada ao hardware emulando.
-   🔗**Compatibilidade:**Limitado a sistemas operacionais que foram modificados para paravirtualização.

###### 💡 Exemplos de paravirtualização

Xen com convidados paravirtualizados, ferramentas VMware em determinadas configurações e algumas configurações de KVM.

###### ✅ Vantagens de paravirtualização

-   ⚡**Eficiência:**Reduz a sobrecarga de virtualização de hardware, oferecendo potencialmente melhor desempenho para determinadas cargas de trabalho.
-   ✅**Utilização de recursos:**Uso mais eficiente dos recursos do sistema devido à comunicação direta entre o sistema operacional convidado e o hipervisor.

###### ❌ Desvantagens da Paravirtualização

-   🛠️**Modificação do sistema operacional convidado:**Requer modificações no sistema operacional convidado, limitando a compatibilidade aos sistemas operacionais suportados.
-   🔧**Complexidade:**Requer complexidade adicional no sistema operacional convidado para implementações de hipercall.

##### ⚖️ Principais diferenças

###### 🖥️ Requisitos de sistema operacional convidado

-   **HVM:**Pode executar sistemas operacionais de convidados não modificados.
-   **Paravirtualização:**Requer que os sistemas operacionais de convidados sejam modificados para trabalhar com o hipervisor.

###### ⚡ Desempenho

-   **HVM:**Normalmente, fornece desempenho quase nativo devido à execução assistida por hardware.
-   **Paravirtualização:**Pode oferecer desempenho eficiente, reduzindo a sobrecarga da emulação de hardware, mas depende do sistema operacional convidado modificado.

###### 🧰 Dependência de hardware

-   **HVM:**Requer recursos específicos da CPU (Intel VT-X, AMD-V).
-   **Paravirtualização:**Não requer recursos específicos de CPU, mas precisa de um sistema operacional convidado modificado.

###### 🔒 Isolamento

-   **HVM:**Fornece forte isolamento usando recursos de hardware.
-   **Paravirtutualização:**Baseia-se no isolamento baseado em software, que pode não ser tão robusto quanto o isolamento baseado em hardware.

###### 🧩 Complexidade

-   **HVM:**Geralmente mais simples de implantar, pois oferece suporte a sistemas operacionais não modificados.
-   **Paravirtualização:**Requer configuração e modificações adicionais no sistema operacional convidado, aumentando a complexidade.

#### 🧠 NUMA (acesso não uniforme de memória)

O NUMA (acesso não uniforme de memória) é uma arquitetura de memória usada em sistemas multiprocessadores para otimizar o acesso à memória pelos processadores.
Em um sistema NUMA, a memória é distribuída de maneira desigual entre os processadores, o que significa que cada processador tem acesso mais rápido a uma parte da memória (sua "memória local") do que à memória que está fisicamente mais distante (referida como "memória remota") e associada a outros processadores.

##### 📝 Principais recursos da arquitetura NUMA

1.  **Memória local e remota**: Cada processador tem sua própria memória local, que pode acessar mais rapidamente. No entanto, também pode acessar a memória de outros processadores, embora isso leve mais tempo.
2.  **Latência diferenciada**: A latência do acesso à memória varia dependendo se o processador está acessando sua memória local ou a memória de outro nó. O acesso à memória local é mais rápido, enquanto o acesso à memória de outro nó (remoto) é mais lento.
3.  **Escalabilidade**: A arquitetura da NUMA foi projetada para melhorar a escalabilidade em sistemas com muitos processadores. À medida que mais processadores são adicionados, a memória também é distribuída, evitando o gargalo que ocorreria em uma arquitetura uniforme de acesso à memória (Uma).

##### ✅ Advantages of NUMA

-   ⚡ Melhor Desempenho em Sistemas Grandes: Como cada processador possui memória local, ele pode funcionar com mais eficiência sem competir tanto com outros processadores pelo acesso à memória.
-   📈 Escalabilidade: NUMA permite que sistemas com muitos processadores e grandes quantidades de memória sejam dimensionados de forma mais eficaz em comparação com uma arquitetura UMA.

##### ❌ Desvantagens

-   🛠️ Complexidade de programação: Os programadores precisam estar cientes de quais regiões da memória são locais ou remotas, otimizando o uso da memória local para obter melhor desempenho.
-   🐢 Potenciais penalidades de desempenho: Se um processador acessa frequentemente a memória remota, o desempenho pode ser prejudicado devido à maior latência.
    Essa arquitetura é comum em sistemas multiprocessadores de alto desempenho, como servidores e supercomputadores, onde a escalabilidade e a otimização da memória são críticas.

#### 🆓 Soluções de código aberto

-   🌐 Ovirt:<https://www.ovirt.org/>
-   🌐Proxmox:<https://www.proxmox.com/en/proxmox-virtual-environment/overview>
-   🌐Oracle VirtualBox:<https://www.virtualbox.org/>
-   🌐 Open Vswitch:<https://www.openvswitch.org/>

#### 🗂️ Tipos de virtualização

##### Virtualização de hardware (virtualização do servidor)

###### 📄 Definição HV

Abstrai o hardware físico para criar máquinas virtuais (VMs) que executam sistemas operacionais e aplicativos separados.

###### 🛠️ Casos de uso de alta tensão

Data centers, computação em nuvem, consolidação de servidores.

###### 💡 Exemplos de HV

VMware ESXi, Microsoft Hyper-V, KVM.

##### 📦 Virtualização do sistema operacional (contêinerização)

###### 📄 Definição de contêiner

Permite que várias instâncias isoladas do espaço do usuário (contêineres) sejam executadas em um único kernel do sistema operacional.

###### 🛠️ Casos de uso de conteinerização

Arquitetura de microsserviços, ambientes de desenvolvimento e testes.

###### 💡 Exemplos de conteinerização

Docker, Kubernetes, LXC.

##### 🌐 Virtualização de rede

###### 📄 Definição de virtualização de rede

Combina recursos de rede de hardware e software em uma única entidade administrativa baseada em software.

###### 🛠️ Casos de uso da virtualização de rede de rede

Networking definido por software (SDN), Virtualização da Função de Rede (NFV).

###### 💡 Exemplos de virtualização de rede

VMware NSX, Cisco ACI, OpenStack Neutron.

##### 💾 Virtualização de armazenamento

###### 📄 Definição de virtualização de armazenamento

Pools armazenamento físico de vários dispositivos em uma única unidade de armazenamento virtual que pode ser gerenciada centralmente.

###### 🛠️ Casos de uso da virtualização de armazenamento

Gerenciamento de dados, otimização de armazenamento, recuperação de desastres.

###### 💡 Exemplos de virtualização de armazenamento

IBM SAN Volume Controller, VMware vSAN, NetApp ONTAP.

##### Virttualização da área de trabalho

###### 📄 Definição de virtualização da área de trabalho

Permite que um sistema operacional de desktop seja executado em uma máquina virtual hospedada em um servidor.

###### 🛠️ Casos de uso da virtualização de desktop

Infraestrutura de Desktop Virtual (VDI), Soluções de Trabalho Remoto.

###### 💡 Exemplos de virtualização de desktop

Aplicativos e desktops virtuais Citrix, VMware Horizon, serviços de desktop remoto da Microsoft.

##### 📱 Virtualização de aplicativos

###### 📄 Definição de virtualização de aplicativos

Separa aplicativos do hardware e do sistema operacional subjacentes, permitindo que sejam executados em ambientes isolados.

###### 🛠️ Casos de uso da virtualização de aplicativos

Implantação simplificada de aplicativos, teste de compatibilidade.

###### 💡 Exemplos de virtualização de aplicativos

VMware ThinApp, Microsoft App-V, Citrix XenApp.

##### 🗃️ Virtualização de dados

###### 📄 Definição de virtualização de dados

Integra dados de várias fontes sem consolidá -los fisicamente, fornecendo uma visão unificada para análise e relatório.

###### 🛠️ Casos de uso de virtualização de dados

Inteligência de negócios, integração de dados em tempo real.

###### 💡 Exemplos de virtualização de dados

Denodo, Red Hat JBoss Data Virtualization, IBM InfoSphere.

##### 🌟 Benefícios da virtualização

-   ⚡ Eficiência de recursos: melhor utilização de recursos físicos.
-   💰 Economia de custos: redução de custos operacionais e de hardware.
-   📈 Escalabilidade: fácil de aumentar ou diminuir de acordo com a demanda.
-   🔧 Flexibilidade: Suporta uma variedade de cargas de trabalho e aplicativos.
-   🔄 Recuperação de desastres: processos simplificados de backup e recuperação.
-   🔒 Isolamento: segurança aprimorada através do isolamento de ambientes.

#### Emulação

A emulação envolve a simulação do comportamento de hardware ou software em uma plataforma diferente do originalmente pretendido.

Esse processo permite que o software projetado para um sistema seja executado em outro sistema que possa ter arquitetura ou ambiente operacional diferente.

Embora a emulação forneça versatilidade ao permitir a execução de sistemas operacionais ou aplicativos convidados não modificados, ela geralmente acarreta sobrecarga de desempenho.

Essa sobrecarga surge porque o sistema emulado precisa interpretar e traduzir instruções destinadas ao sistema original em instruções compatíveis com o sistema host. Como resultado, a emulação pode ser mais lenta que a execução nativa, tornando-a menos eficiente para tarefas que consomem muitos recursos.

Apesar dessa desvantagem, a emulação permanece valiosa para a execução de software herdado, testando aplicativos em diferentes plataformas e facilitando o desenvolvimento de plataformas cruzadas.

#### Systemd-Mathined

O serviço systemd-machined é dedicado ao gerenciamento de máquinas virtuais e contêineres dentro do ecossistema systemd.
 Fornece funcionalidades essenciais para controle, monitoramento e manutenção de instâncias virtuais, oferecendo integração robusta e eficiência em ambientes Linux.

<p align="right">(<a href="#topic-351.1">back to sub Topic 351.1</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.2"></a>

### 🐧 351.2 Alternação

![xen-architecture](images/xen-architecture.png)

![xen-architecture](images/xen-architecture2.png)

**Peso:**3

**Descrição:**Os candidatos devem ser capazes de instalar, configurar, manter, migrar e solucionar problemas de instalações do Xen. O foco está no Xen versão 4.x.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura do Xen, incluindo rede e armazenamento
-   Configuração básica de nós e domínios Xen
-   Gerenciamento básico de nós e domínios Xen
-   Solução de problemas básicos de instalações Xen
-   Avarines fora da pílula
-   Consciência de Xenstore
-   Conhecimento dos parâmetros de inicialização do Xen
-   Conscientização do utilitário xm

#### 🐧 Alternação

![panda](images/xen-panda.png)

O XEN é um hipervisor de código aberto tipo 1 (sem metal), que permite que vários sistemas operacionais sejam executados simultaneamente no mesmo hardware físico.xen fornece uma camada entre o hardware físico e as máquinas virtuais (VMs), permitindo compartilhamento de recursos eficientes e isolamento.

-   **Arquitetura:**O Xen opera com um sistema de duas camadas onde o Domínio 0 (Dom0) é o domínio privilegiado com acesso direto ao hardware e gerencia o hipervisor. Outras máquinas virtuais, chamadas Domain U (DomU), executam sistemas operacionais convidados e são gerenciadas pelo Dom0.
-   **Tipos de virtualização:**O XEN suporta paravirtualização (PV), que requer o sistema operacional convidado modificado e a virtualização assistida por hardware (HVM), que usa extensões de hardware (por exemplo, Intel VT-X ou AMD-V) para executar sistemas operacionais de convidados não modificados.
    O XEN é amplamente utilizado em ambientes em nuvem, principalmente pela Amazon Web Services (AWS) e outros provedores de nuvem em larga escala.

#### 🏢XenSource

XenSource foi a empresa fundada pelos desenvolvedores originais do hipervisor Xen na Universidade de Cambridge para comercializar o Xen. A empresa forneceu soluções empresariais baseadas no Xen e ofereceu ferramentas e suporte adicionais para aprimorar os recursos do Xen para uso empresarial.

-   **Aquisição pela Citrix**: Em 2007, a Xensource foi adquirida pela Citrix Systems, Inc. A Citrix usou a tecnologia Xen como base para o seu produto Citrix Xenserver, que se tornou uma popular plataforma de virtualização de grau corporativo baseado em Xen.
-   **Transição**: Após a aquisição, o projeto Xen continuou como um projeto de código aberto, enquanto a Citrix se concentrou em ofertas comerciais como o XenServer, aproveitando a tecnologia XenSource.

#### 🌍 Projeto Xen

Projeto Xen refere-se à comunidade e iniciativa de código aberto responsável pelo desenvolvimento e manutenção do hipervisor Xen após sua comercialização. O Projeto Xen opera sob a Fundação Linux, com foco na construção, melhoria e suporte ao Xen como um esforço colaborativo e voltado para a comunidade.

-   **Metas:**O projeto XEN visa avançar o hipervisor, melhorando seu desempenho, segurança e conjunto de recursos para uma ampla gama de casos de uso, incluindo computação em nuvem, virtualização focada na segurança (por exemplo, QUBES OS) e sistemas incorporados.
-   **Colaboradores:**O projeto inclui colaboradores de várias organizações, incluindo os principais provedores de nuvem, fornecedores de hardware e desenvolvedores independentes.
-   **Pílula e hedools:**O projeto XEN também inclui ferramentas como XAPI (XenAPI), que é usado para gerenciar instalações do Xen Hypervisor e vários outros utilitários para gerenciamento e otimização do sistema.

#### 🗄️ Xenstore

Xen Store é um componente crítico do Xen Hypervisor.
Essencialmente, o Xen Store é um banco de dados de valores-chave distribuído usado para comunicação e compartilhamento de informações entre o hipervisor Xen e as máquinas virtuais (também conhecidas como domínios) que ele gerencia.

Aqui estão alguns aspectos principais da Xen Store:

-   **Comunicação entre domínios:**O Xen Store permite a comunicação entre domínios, como o DOM0 (o domínio privilegiado que controla os recursos de hardware) e o DOMUS (domínios do usuário, que são as VMs). Isso é feito através de entradas de valor-chave, onde cada domínio pode ler ou escrever informações.
-   **Gerenciamento de configuração:**É usado para armazenar e acessar informações de configuração, como dispositivos virtuais, redes e parâmetros de inicialização. Isso facilita o gerenciamento dinâmico e a configuração das VMs.
-   **Eventos e notificações:**A Xen Store também suporta notificações de eventos. Quando uma chave ou valor específica na loja Xen é modificada, os domínios interessados ​​podem ser notificados para reagir a essas alterações. Isso é útil para monitorar e gerenciar recursos.
-   API simples: O Xen Store fornece uma API simples para leitura e gravação de dados, facilitando aos desenvolvedores a integração de seus aplicativos com o sistema de virtualização Xen.

#### 🔗 Xapi

XAPI, ou XenAPI, é a interface de programação de aplicativos (API) usada para gerenciar o hipervisor Xen e suas máquinas virtuais (VMs).
XAPI é um componente chave do XenServer (agora conhecido como Citrix Hypervisor) e fornece uma maneira padronizada de interagir com o hipervisor Xen para executar operações como criação, configuração, monitoramento e controle de VMs.

Aqui estão alguns aspectos importantes do XAPI:

-   **Gerenciamento de VM:**O XAPI permite que os administradores criem, excluam, excluam, iniciem e parem e parem e parem programaticamente as máquinas virtuais.
-   **Automação:**Com o XAPI, é possível automatizar o gerenciamento de recursos virtuais, incluindo rede, armazenamento e computação, o que é crucial para grandes ambientes de nuvem.
-   **Integração:**O XAPI pode ser integrado a outras ferramentas e scripts para fornecer uma administração mais eficiente e personalizada do ambiente Xen.
-   **Controle de acesso:**O XAPI também fornece mecanismos de controle de acesso para garantir que apenas usuários autorizados possam executar operações específicas no ambiente virtual.

XAPI é a interface que permite o controle e automação do Hipervisor Xen, facilitando o gerenciamento de ambientes virtualizados.

#### Resumo Xen Resumo

-   **Xen:**A principal tecnologia de hipervisor que permite que máquinas virtuais sejam executadas em hardware físico.
-   **XenFonte:**A empresa que comercializou Xen, mais tarde adquirida pela Citrix, levando ao desenvolvimento do Citrix Xenserver.
-   **Projeto Xen:**A iniciativa e comunidade de código aberto que continua a desenvolver e manter o hipervisor Xen sob a Linux Foundation.
-   **Xenstore:**A Xen Store atua como uma intermediária de comunicação e configuração entre o hypervisor Xen e as VMs, simplificando a operação e o gerenciamento de ambientes virtualizados.
-   **Pílula**é a interface que permite o controle e automação do Hipervisor Xen, facilitando o gerenciamento de ambientes virtualizados.

#### 🖥️ Domínio0 (Dom0)

Domain0, OR DOM0, é o domínio de controle em uma arquitetura Xen. Ele gerencia outros domínios (DOMUS) e tem acesso direto ao hardware.
O DOM0 executa drivers de dispositivo, permitindo que o Domus, que não possua acesso direto ao hardware, se comunique com dispositivos. Normalmente, é uma instância completa de um sistema operacional, como o Linux, e é essencial para a operação de hipervisor do Xen.

#### 💻 Domínio (casa)

DomUs são domínios não privilegiados que executam máquinas virtuais.
Eles são gerenciados pelo Dom0 e não têm acesso direto ao hardware. DomUs podem ser configurados para executar diferentes sistemas operacionais e são usados ​​para diversos fins, como servidores de aplicativos e ambientes de desenvolvimento. Eles contam com Dom0 para interação de hardware.

#### 🧩 PV-DOMU (domínio paravirtualizado)

PV-DomUs usam uma técnica chamada paravirtualização. Neste modelo, o sistema operacional DomU é modificado para saber que roda em um ambiente virtualizado, permitindo a comunicação direta com o hipervisor para desempenho otimizado.
Isso resulta em menor sobrecarga e melhor eficiência em comparação com a virtualização completa.

#### ⚙️ HVM-DOMU (domínio da máquina virtual de hardware)

HVM-DomUs são máquinas virtuais que utilizam virtualização completa, permitindo a execução de sistemas operacionais não modificados. O hipervisor Xen fornece emulação de hardware para esses DomUs, permitindo-lhes executar qualquer sistema operacional que suporte a arquitetura de hardware subjacente.
Embora isso ofereça maior flexibilidade, pode resultar em maior sobrecarga em comparação com PV-DomUs.

#### 🌐 Rede Xen

Dispositivos de rede paravirtualizados![pv-networking](images/xen-networking2.png)

Ponte![pv-networking](images/xen-networking1.png)

#### 📋 351,2 objetos citados

```sh
Domain0 (Dom0), DomainU (DomU)
PV-DomU, HVM-DomU
/etc/xen/
xl
xl.cfg 
xl.conf # Xen global configurations
xentop
oxenstored # Xenstore configurations
```

#### 📝 351,2 Notas

```sh

# Xen Settings
/etc/xen/
/etc/xen/xl.conf - Main general configuration file for Xen
/etc/xen/oxenstored.conf - Xenstore configurations

# VM Configurations
/etc/xen/xlexample.pvlinux
/etc/xen/xlexample.hvm

# Service Configurations
/etc/default/xen
/etc/default/xendomains

# xen-tools configurations
/etc/xen-tools/
/usr/share/xen-tools/

# docs
xl(1)
xl.conf(5)
xlcpupool.cfg(5)
xl-disk-configuration(5)
xl-network-configuration(5)
xen-tscmode(7)

# initialized domains auto
/etc/default/xendomains
   XENDOMAINS_AUTO=/etc/xen/auto

/etc/xen/auto/

# set domain for up after xen reboot
## create folder auto
cd /etc/xen && mkdir -p auto && cd auto

# create symbolic link
ln -s /etc/xen/lpic3-pv-guest /etc/xen/auto/lpic3-pv-guest
```

##### VIF

No Xen, “vif” significa Interface Virtual e é usado para configurar redes para máquinas virtuais (domínios).

Ao especificar diretivas “vif” nos arquivos de configuração de domínio, os administradores podem definir interfaces de rede, atribuir endereços IP, configurar VLANs e configurar outros parâmetros de rede para máquinas virtuais executadas em hosts Xen. Por exemplo: vif =[=Bridge  Xenbr0], neste caso, conecta a interface de rede da VM à ponte Xen denominada “xenbr0”.

#### Xen Lab

Use este script para provisionamento de laboratório:[xen.sh](scripts/xen/xen.sh)

#### 💻 351,2 comandos importantes

##### 🏗️ Xen-Create-Image

```sh
# create a pv image
xen-create-image \
  --hostname=lpic3-pv-guest \
  --memory=1gb \
  --vcpus=2 \
  --lvm=vg_xen \
  --bridge=xenbr0 \
  --dhcp \
  --pygrub \
  --password=vagrant \
  --dist=bookworm
```

##### 📄 Xen-List-Imagens

```sh
# list image
xen-list-image
```

##### ❌ xen-delete-image

```sh
# delete a pv image
xen-delete-image lpic3-pv-guest --lvm=vg_xen
```

##### 🗄️ XENSTORE-LS

```sh
# list xenstore infos
xenstore-ls
```

##### ⚙️ XL

```sh
# view xen information
xl infos

# list Domains
xl list
xl list lpic3-hvm-guest
xl list lpic3-hvm-guest -l

# uptime Domains
xl uptime

# pause Domain
xl pause 2
xl pause lpic3-hvm-guest

# save state Domains
xl -v save lpic3-hvm-guest ~root/image-lpic3-hvm-guest.save

# restore Domain
xl restore /root/image-lpic3-hvm-guest.save

# get Domain name
xl domname 2

# view dmesg information
xl dmesg

# monitoring domain
xl top
xentop
xen top

# Limit mem Dom0
xl mem-set 0 2048

# Limit cpu (not permanent after boot)
xl vcpu-set 0 2

# create DomainU - virtual machine
xl create /etc/xen/lpic3-pv-guest.cfg

# create DomainU virtual machine and connect to guest
xl create -c /etc/xen/lpic3-pv-guest.cfg

##----------------------------------------------
# create DomainU virtual machine HVM

## create logical volume
lvcreate -l +20%FREE -n lpic3-hvm-guest-disk  vg_xen

## create a ssh tunel for vnc
ssh -l vagrant -L 5900:localhost:5900  192.168.0.130

## configure /etc/xen/lpic3-hvm-guest.cfg
## set boot for cdrom: boot = "d"

## create domain hvm
xl create /etc/xen/lpic3-hvm-guest.cfg

## open vcn connection in your vnc client with localhost
## for view install details

## after installation finished, destroy domain: xl destroy <id_or_name>

## set /etc/xen/lpic3-hvm-guest.cfg: boot for hard disc: boot = "c"

## create domain hvm
xl create /etc/xen/lpic3-hvm-guest.cfg

## access domain hvm
xl console <id_or_name>
##----------------------------------------------

# connect in domain guest
xl console <id>|<name> (press enter)
xl console 1
xl console lpic3-pv-guest

#How do I exit domU "xl console" session
#Press ctrl+] or if you're using Putty press ctrl+5.

# Poweroff domain
xl shutdown lpic3-pv-guest

# destroy domain
xl destroy lpic3-pv-guest

# reboot domain
xl reboot lpic3-pv-guest

# list block devices
xl block-list 1
xl block-list lpic3-pv-guest

# detach block devices
xl block-detach lpic3-hvm-guest hdc
xl block-detach 2 xvdc

# attach block devices

## hard disk devices
xl block-attach lpic3-hvm-guest-ubuntu 'phy:/dev/vg_xen/lpic3-hvm-guest-disk2,xvde,w'

## cdrom
xl block-attach lpic3-hvm-guest 'file:/home/vagrant/isos/ubuntu/seed.iso,xvdc:cdrom,r'
xl block-attach 2 'file:/home/vagrant/isos/ubuntu/seed.iso,xvdc:cdrom,r'

# insert and eject cdrom devices
xl cd-insert lpic3-hvm-guest-ubuntu xvdb  /home/vagrant/isos/ubuntu/ubuntu-24.04.1-live-server-amd64.iso
xl cd-eject lpic3-hvm-guest-ubuntu xvdb
```

<p align="right">(<a href="#topic-351.2">back to sub Topic 351.2</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.3"></a>

### 🖥️ 351,3 QEMU

![xen-kvm-qemu](/images/xen-kvm-qemu.png)

**Peso:**4

**Descrição:**Os candidatos devem poder instalar, configurar, manter, migrar e solucionar problemas de instalações QEMU.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura de Qemu, incluindo KVM, networking e armazenamento
-   Inicie instâncias do QEMU na linha de comando
-   Gerencie instantâneos usando o monitor QEMU
-   Instale os drivers de dispositivo QEMU Guest Agent e VirtIO
-   Solucionar problemas de instalações QEMU, incluindo redes e armazenamento
-   Consciência de parâmetros importantes de configuração do QEMU

#### 📋 351.3 Objetos citados

```sh
Kernel modules: kvm, kvm-intel and kvm-amd
/dev/kvm
QEMU monitor
qemu
qemu-system-x86_64
ip
brctl
tunctl
```

#### 🛠️ 351.3 Comandos importantes

##### 📝 351,3 Outros comandos

##### 🧪 Verifique o módulo KVM

```sh
# check if kvm is enabled
egrep -o '(vmx|svm)' /proc/cpuinfo
lscpu |grep Virtualization
lsmod|grep kvm
ls -l /dev/kvm
hostnamectl
systemd-detect-virt
```

```sh
# check if kvm is enabled
egrep -o '(vmx|svm)' /proc/cpuinfo
lscpu |grep Virtualization
lsmod|grep kvm
ls -l /dev/kvm

# check kernel infos
uname -a

# check root device
findmnt /

# mount a qcow2 image
## Example 1:
mkdir -p /mnt/qemu
guestmount -a os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2 -i /mnt/qemu/

## Example 2:
sudo guestfish --rw -a os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2
run
list-filesystems

# run commands in qcow2 images
## Example 1:
virt-customize -a  os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2  --run-command 'echo hello >/root/hello.txt'
## Example 2:
sudo virt-customize -a os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2 \
  --run-command 'echo -e "auto ens3\niface ens3 inet dhcp" > /etc/network/interfaces.d/ens3.cfg'

# generate mac 
printf 'DE:AD:BE:EF:%02X:%02X\n' $((RANDOM%256)) $((RANDOM%256))
```

##### 🌐 ip

```sh
# list links
ip link show

# create bridge
ip link add br0 type bridge
```

##### 🌉brctl

```sh
# list links
ip link show

# create bridge
ip link add br0 type bridge
```

##### 💾 qemu-img

```sh
# create image
qemu-img create -f qcow2 vm-disk-debian-12.qcow2 20G

# convert vmdk to qcow2 image
qemu-img convert \
  -f vmdk \
  -O qcow2 os-images/Debian_12.0.0_VMM/Debian_12.0.0_VMM_LinuxVMImages.COM.vmdk os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2 \
  -p \
  -m16

# check image
qemu-img info os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2
```

##### 🖥️ qemu-system-x86_64

```sh
# create vm with ISO
qemu-system-x86_64 \
  -name lpic3-debian-12 \
  -enable-kvm -hda vm-disk-debian-12.qcow2 \
  -cdrom /home/vagrant/isos/debian/debian-12.8.0-amd64-DVD-1.iso  \
  -boot d \
  -m 2048 \
  -smp cpus=2 \
  -k pt-br

# create vm with ISO using vnc in no gui servers \ ssh connections

## create ssh tunel in host
 ssh -l vagrant -L 5902:localhost:5902  192.168.0.131

## create vm 
qemu-system-x86_64 \
  -name lpic3-debian-12 \
  -enable-kvm \
  -m 2048 \
  -smp cpus=2 \
  -k pt-br \
  -vnc :2 \
  -device qemu-xhci \
  -device usb-tablet \
  -device ide-cd,bus=ide.1,drive=cdrom,bootindex=1 \
  -drive id=cdrom,media=cdrom,if=none,file=/home/vagrant/isos/debian/debian-12.8.0-amd64-DVD-1.iso \
  -hda vm-disk-debian-12.qcow2 \
  -boot order=d \
  -vga std \
  -display none \
  -monitor stdio

# create vm with OS Image - qcow2

## create vm
qemu-system-x86_64 \
  -name lpic3-debian-12 \
  -enable-kvm \
  -m 2048 \
  -smp cpus=2 \
  -k pt-br \
  -vnc :2 \
  -hda os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2

## create vm with custom kernel params
qemu-system-x86_64 \
  -name lpic3-debian-12 \
  -kernel /vmlinuz \
  -initrd /initrd.img \
  -append "root=/dev/mapper/debian--vg-root ro fastboot console=ttyS0" \
  -enable-kvm \
  -m 2048 \
  -smp cpus=2 \
  -k pt-br \
  -vnc :2 \
  -hda os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2

## create vm with and attach disk
qemu-system-x86_64 \
  -name lpic3-debian-12 \
  -enable-kvm \
  -m 2048 \
  -smp cpus=2 \
  -vnc :2 \
  -hda os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2 \
  -hdb vmdisk-debian12.qcow2 \
  -drive file=vmdisk-extra-debian12.qcow2,index=2,media=disk,if=ide \
  -netdev bridge,id=net0,br=qemubr0 \
  -device virtio-net-pci,netdev=net0
  
## create vm network netdev user
qemu-system-x86_64 \
  -name lpic3-debian-12 \
  -enable-kvm \
  -m 2048 \
  -smp cpus=2 \
  -vnc :2 \
  -hda os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2 \
  -netdev user,id=mynet0,net=192.168.0.150/24,dhcpstart=192.168.0.155,hostfwd=tcp::2222-:22 \
  -device virtio-net-pci,netdev=mynet0

## create vm network netdev tap (Private Network)
ip link add br0 type bridge ; ifconfig br0 up
qemu-system-x86_64 \
  -name lpic3-debian-12 \
  -enable-kvm \
  -m 2048 \
  -smp cpus=2 \
  -vnc :2 \
  -hda os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2 \
  -netdev tap,id=br0 \
  -device e1000,netdev=br0,mac=DE:AD:BE:EF:1A:24

## create vm with public bridge
#create a public bridge : https://www.linux-kvm.org/page/Networking

qemu-system-x86_64 \
  -name lpic3-debian-12 \
  -enable-kvm \
  -m 2048 \
  -smp cpus=2 \
  -hda os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2 \
  -k pt-br \
  -vnc :2 \
  -device qemu-xhci \
  -device usb-tablet \
  -vga std \
  -display none \
  -netdev bridge,id=net0,br=qemubr0 \
  -device virtio-net-pci,netdev=net0

## get a ipv4 ip - open ssh in vm and:
dhcpclient ens4
```

#### Monitor qemu Monitor

Para iniciar o monitor QEMU no uso da linha de comando**-monitorar stdio**parâmetro em**Qemu-System-X86_64**

```sh
qemu-system-x86_64 -monitor stdio
```

Saia do monitor qemu:

```sh
ctrl+alt+2
```

```sh
# Management
info status # vm info
info cpus # cpu information
info network # network informations
stop # pause vm
cont # start vm in status pause
system_powerdown # poweroff vm
system_reset # restart monitor


# Blocks
info block # block info
boot_set d # force boot iso
change ide1-cd0  /home/vagrant/isos/debian/debian-12.8.0-amd64-DVD-1.iso  # attach cdrom
eject ide1-cd0 # detach cdrom

# Snapshots
info snapshots # list snapshots
savevm snapshot-01  # create snapshot
loadvm snapshot-01 # restore snapshot
delvm snapshot-01
```

#### 🤖 Agente convidado

Para ativar, use:

```sh
qemu-system-x86_x64
 -chardev socket,path=/tmp/qga.sock,server=on,wait=off,id=qga0 \
 -device virtio-serial \
 -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
```

<p align="right">(<a href="#topic-351.3">back to sub Topic 351.3</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.4"></a>

### 🏢 351.4 Gerenciamento de máquina virtual Libvirt

![libvirt](images/libvirt.png)

![libvirt-network](images/libvirt-default-network.jpg)

**Peso:**9

**Descrição:**Os candidatos devem ser capazes de gerenciar hosts de virtualização e máquinas virtuais ('LibVirt Domains') usando o LibVirt e as ferramentas relacionadas.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura do Libvirt
-   Gerenciar conexões e nós da LibVirt
-   Crie e gerencie domínios QEMU e Xen, incluindo snapshots
-   Gerencie e analise o consumo de recursos de domínios
-   Crie e gerencie pools e volumes de armazenamento
-   Crie e gerencie redes virtuais
-   Migrar domínios entre nós
-   Entenda como a libvirt interage com o Xen e o QEMU
-   Entenda como a LibVirt interage com serviços de rede, como Dnsmasq e RadVD
-   Entenda os arquivos de configuração do LibVirt XML
-   Conscientização sobre virtlogd e virtlockd

#### 📋 351.4 Objetos citados

```sh
libvirtd
/etc/libvirt/
/var/lib/libvirt
/var/log/libvirt
virsh (including relevant subcommands) 
```

#### 🛠️ 351,4 comandos importantes

##### 🖥️VIRSH

```sh
# using env variable for set virsh uri (local or remotely)
export LIBVIRT_DEFAULT_URI=qemu:///system
export LIBVIRT_DEFAULT_URI=xen+ssh://vagrant@192.168.0.130
export LIBVIRT_DEFAULT_URI='xen+ssh://vagrant@192.168.0.130?keyfile=/home/vagrant/.ssh/skynet-key-ecdsa'

# COMMONS

# get helps
virsh help
virsh help pool-create

# view version
virsh version

# view system info
sudo virsh sysinfo

# view node info
virsh nodeinfo

# hostname
virsh hostname

# check vcn allocated port
virsh vncdisplay <domain_id>
virsh vncdisplay <domain_name>
virsh vncdisplay rocky9-server01 

# HYPERVISORS

# view libvirt hypervisor connection
virsh uri

# list valid hypervisors
virt-host-validate
virt-host-validate qemu

# test connection uri(vm test)
virsh -c test:///default list

# connect remotely
virsh -c xen+ssh://vagrant@192.168.0.130
virsh -c xen+ssh://vagrant@192.168.0.130 list
virsh -c qemu+ssh://vagrant@192.168.0.130/system list

# connect remotely without enter password
virsh -c 'xen+ssh://vagrant@192.168.0.130?keyfile=/home/vagrant/.ssh/skynet-key-ecdsa'

# STORAGE

# list storage pools
virsh pool-list --details

# list all storage pool
virsh pool-list --all --details

# get a pool configuration
virsh pool-dumpxml default

# get pool info
virsh pool-info default

# create a storage pool
virsh pool-define-as --name default --type dir --target /var/lib/libvirt/images

# create a storage pool with dumpxml
virsh pool-create --overwrite --file configs/kvm/libvirt/pool.xml

# start storage pool
virsh pool-start default

# set storage pool for autostart
virsh pool-autostart default

# stop storage pool
virsh pool-destroy linux

# delete xml storage pool file
virsh pool-undefine linux

# edit storage pool
virsh pool-edit linux

# list volumes
virsh vol-list linux

# get volume infos
virsh vol-info Debian_12.0.0.qcow2 os-images
virsh vol-info --pool os-images Debian_12.0.0.qcow2 

# get volume xml
virsh vol-dumpxml rocky9-disk1 default

# create volume
virsh vol-create-as default --format qcow2 disk1 10G

# delete volume
virsh vol-delete  disk1 default

# DOMAINS \ INSTANCES \ VIRTUAL MACHINES

# list domain\instance\vm
virsh list
virsh list --all

# create domain\instance\vm
virsh create configs/kvm/libvirt/rocky9-server03.xml

# view domain\instance\vm info
virsh dominfo rocky9-server01

# view domain\instance\vm xml
virsh dumpxml rocky9-server01

# edit domain\instance\vm xml
virsh edit rocky9-server01

# stop domain\instance\vm
virsh shutdown rocky9-server01 # gracefully
virsh destroy 1
virsh destroy rocky9-server01

# suspend domain\instance\vm
virsh suspend rocky9-server01

# resume domain\instance\vm
virsh resume rocky9-server01

# start domain\instance\vm
virsh start rocky9-server01

# remove domain\instance\vm
virsh undefine rocky9-server01

# remove domain\instance\vm and storage volumes
virsh undefine rocky9-server01 --remove-all-storage

# save domain\instance\vm
virsh save rocky9-server01 rocky9-server01.qcow2

# restore domain\instance\vm
virsh restore rocky9-server01.qcow2

# list snapshots
virsh snapshot-list rocky9-server01

# create snapshot
virsh snapshot-create rocky9-server01

# restore snapshot
virsh snapshot-revert rocky9-server01 1748983520

# view snapshot xml
virsh snapshot-info rocky9-server01 1748983520

# dumpxml snapshot
virsh snapshot-dumpxml rocky9-server01 1748983520

# xml snapshot path
/var/lib/libvirt/qemu/snapshot/rocky9-server01/

# view snapshot info
virsh snapshot-info rocky9-server01 1748983671

# edit snapshot
virsh snapshot-edit rocky9-server01 1748983520

# delete snapshot
virsh snapshot-delete rocky9-server01 1748983520

# DEVICES

# list block devices
virsh domblklist rocky9-server01 --details

# add cdrom media 
virsh change-media rocky9-server01 sda /home/vagrant/isos/rocky/Rocky-9.5-x86_64-minimal.iso
virsh attach-disk rocky9-server01 /home/vagrant/isos/rocky/Rocky-9.5-x86_64-minimal.iso sda --type cdrom --mode readonly

# remove cdrom media
virsh change-media rocky9-server01 sda --eject

# add new disk
virsh attach-disk rocky9-server01  /var/lib/libvirt/images/rocky9-disk2  vdb --persistent

# remove disk
virsh detach-disk rocky9-server01 vdb --persistent

# RESOURCES (CPU and Memory)

# get cpu infos
virsh vcpuinfo rocky9-server01 --pretty
virsh dominfo rocky9-server01 | grep 'CPU'

# get vcpu count
virsh vcpucount rocky9-server01

# set vcpus maximum config
virsh setvcpus rocky9-server01 --count 4 --maximum --config
virsh shutdown rocky9-server01
virsh start rocky9-server01

# set vcpu current config
virsh setvcpus rocky9-server01 --count 4 --config

# set vcpu current live
virsh setvcpus rocky9-server01 --count 3 --current
virsh setvcpus rocky9-server01 --count 3 --live

# configure vcpu affinity config
virsh vcpupin rocky9-server01 0 7 --config
virsh vcpupin rocky9-server01 1 5-6 --config

# configure vcpu affinity current
virsh vcpupin rocky9-server01 0 7
virsh vcpupin rocky9-server01 1 5-6

# set maximum memory config
virsh setmaxmem rocky9-server01 3000000 --config
virsh shutdown rocky9-server01
virsh start rocky9-server01

# set current memory config
virsh setmem rocky9-server01 2500000 --current

# NETWORK

# get netwwork bridges
brctl show

# get iptables rules for libvirt
sudo iptables -L -n -t  nat

# list network
virsh net-list --all

# set default network
virsh net-define /etc/libvirt/qemu/networks/default.xml

# get network infos
virsh net-info default

# get xml network
virsh net-dumpxml default

# xml file
cat /etc/libvirt/qemu/networks/default.xml

# dhcp config
sudo cat /etc/libvirt/qemu/networks/default.xml | grep -A 10 dhcp
sudo cat /var/lib/libvirt/dnsmasq/default.conf

# get domain ipp address
virsh net-dhcp-leases default
virsh net-dhcp-leases default --mac 52\:54\:00\:89\:19\:86

# edit network
virsh net-edit default

# get domain network details
virsh domiflist debian-server01

# path for network filter files
/etc/libvirt/nwfilter/

# list network filters
virsh nwfilter-list

# create network filter - block icmp traffic
virsh nwfilter-define block-icmp.xml
# virsh edit Debian-Server
    #  <interface type='network'>
    #        ...
    #        <filterref filter='block-icmp'/>
    #        ...
    # </interface>
# virsh destroy debian-server01
# virsh start debian-server01

# delete network filter
virsh nwfilter-undefine block-icmp

# get xml network filter
virsh nwfilter-dumpxml block-icmp
```

###### 🏗️ virt-install

```sh
# list os variants
virt-install --os-variant list
osinfo-query os

# create domain\instance\vm with iso file
virsh vol-create-as default --format qcow2 rocky9-disk1 20G
virt-install --name rocky9-server01 \
--vcpus 2 \
--cpu host \
--memory 2048 \
--disk vol=default/rocky9-disk1 \
--cdrom /home/vagrant/isos/rocky/Rocky-9.5-x86_64-minimal.iso \
--os-variant=rocky9 \
--graphics vnc,listen=0.0.0.0,port=5905

# create debian domain\instance\vm with qcow2 file
virt-install --name debian-server01 \
--vcpus 2 \
--ram 2048 \
--disk vol=os-images/Debian_12.0.0.qcow2 \
--import \
--osinfo detect=on \
--graphics vnc,listen=0.0.0.0,port=5906 \
--network network=default \
--noautoconsole

# create rocky9 domain\instance\vm with qcow2 file
virt-install --name rocky9-server02 \
--vcpus 2 \
--ram 2048 \
--disk path=os-images/RockyLinux_9.4_VMG/RockyLinux_9.4.qcow2,format=qcow2,bus=virtio \
--import \
--osinfo detect=on \
--graphics vnc,listen=0.0.0.0,port=5907 \
--network bridge=qemubr0,model=virtio \
--noautoconsole

# open domain\instance\vm gui console
virt-viewer debian-server01

# check metadata domain\instance\vm file (if uri is qemu:////system)
less /etc/libvirt/qemu/debian-server01.xml
```

<p align="right">(<a href="#topic-351.4">back to sub Topic 351.4</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.5"></a>

### 💾 Gerenciamento de imagem de disco de máquina virtual 351,5

![disk-management](images/virtual-machine-disk.png)

**Peso:**3

**Descrição:**Os candidatos devem poder gerenciar imagens de disco de máquinas virtuais. Isso inclui a conversão de imagens de disco entre vários formatos e hipervisores e acesso a dados armazenados em uma imagem.

**Principais áreas de conhecimento:**

-   Compreenda os recursos de vários formatos de imagem de disco virtual, como imagens brutas, qcow2 e VMDK
-   Gerencie imagens de disco de máquinas virtuais usando qemu-img
-   Monte partições e acesse arquivos em contêineres em imagens de disco de máquinas virtuais usando libguestfish
-   Copie o conteúdo do disco físico para uma imagem de disco de máquina virtual
-   Migrar o conteúdo do disco entre vários formatos de imagem de disco da máquina virtual
-   Consciência do formato de virtualização aberta (OVF)

#### 📋 351.5 Objetos citados

```sh
qemu-img
guestfish (including relevant subcommands)
guestmount
guestumount
virt-cat
virt-copy-in
virt-copy-out
virt-diff
virt-inspector
virt-filesystems
virt-rescue
virt-df
virt-sparsify
virt-p2v
virt-p2v-make-disk
virt-v2v
```

#### 🛠️ 351,5 comandos importantes

##### 💾 351.5.1 qemu-img

```sh
# Display detailed information about a disk image
qemu-img info UbuntuServer_24.04.qcow2

# Create a new 22G raw disk image (default format is raw)
qemu-img create new-disk 22G

# Create a new 22G disk image in qcow2 format
qemu-img create -f qcow2 new-disk2 22G

# Convert a VDI image to raw format using 5 threads and show progress
qemu-img convert -f vdi -O raw Ubuntu-Server.vdk new-Ubuntu.raw -m5 -p

# Convert vmdk to qcow2 image
qemu-img convert \
-f vmdk \
-O qcow2 os-images/UbuntuServer_24.04_VM/UbuntuServer_24.04_VM_LinuxVMImages.COM.vmdk \
os-images/UbuntuServer_24.04_VM/UbuntuServer_24.04.qcow2 \
-p \
-m16

# Resize a raw image to 30G
qemu-img resize -f raw new-disk 30G

# Resize a qcow2 image to 15G(actual size 30Gdisk 30G)
qemu-img resize -f raw --shrink new-disk 15G

# Snapshots

# List all snapshots in the image
qemu-img snapshot -l new-disk2.qcow2

# Create a snapshot named SNAP1
qemu-img snapshot -c SNAP1 disk

# Apply a snapshot by ID or name
qemu-img snapshot -a 123456789 disk

# Delete the snapshot named SNAP1
qemu-img snapshot -d SNAP1 disk
```

##### 🐟 peixe convidado

```sh
# set environment variables for guestfish
export LIBGUESTFS_BACKEND_SETTINGS=force_tcg

# Launch guestfish with a disk image
guestfish -a UbuntuServer_24.04.qcow2
#run
#list-partitions

# Run the commands in a script file
guestfish -a UbuntuServer_24.04.qcow2 -m /dev/sda -i < script.ssh

# Interactively run commands
guestfish --rw -a UbuntuServer_24.04.qcow2 <<'EOF'
run
list-filesystems
EOF

# Copy a file from the guest image to the host
export LIBGUESTFS_BACKEND_SETTINGS=force_tcg
sudo guestfish --rw -a UbuntuServer_24.04.qcow2 -i <<'EOF'
copy-out /etc/hostname /tmp/
EOF

# Copy a file from the host into the guest image
echo "new-hostname" > /tmp/hostname
export LIBGUESTFS_BACKEND_SETTINGS=force_tcg
sudo guestfish --rw -a UbuntuServer_24.04.qcow2 -i <<'EOF'
copy-in /tmp/hostname /etc/
EOF

# View contents of a file in the guest image
guestfish --ro -a UbuntuServer_24.04.qcow2 -i <<'EOF'
cat /etc/hostname
EOF

# List files in the guest image
export LIBGUESTFS_BACKEND_SETTINGS=force_tcg
guestfish --rw -a UbuntuServer_24.04.qcow2 -i <<'EOF'
ls /home/ubuntu
EOF

# Edit a file in the guest image
export LIBGUESTFS_BACKEND_SETTINGS=force_tcg
guestfish --rw -a UbuntuServer_24.04.qcow2 -i <<'EOF'
edit /etc/hosts
EOF
```

###### 🗂️ Guestrount

```sh
# Mount a disk image to a directory
guestmount -a UbuntuServer_24.04.qcow2 -m /dev/ubuntu-vg/ubuntu-lv /mnt/ubuntu
# domain
guestmount -d rocky9-server02 -m /dev/ubuntu-vg/ubuntu-lv /mnt/ubuntu 

# Mount a specific partition from a disk image
guestmount -a UbuntuServer_24.04.qcow2 -m /dev/sda2 /mnt/ubuntu
# domain
guestmount -d debian-server01 --ro -m  /dev/debian-vg/root /mnt/debian
```

###### 🗑️ convidado

```sh
# Umount a disk image to a directory
sudo guestunmount /mnt/ubuntu
```

##### 📊virt-df

```sh
# Show free and used space on virtual machine filesystems
virt-df UbuntuServer_24.04.qcow2 -h
virt-df -d rocky9-server02 -h
```

##### 🗃️ Fil-Filesystems

```sh
# List filesystems, partitions, and logical volumes in a VM disk image (disk image)
virt-filesystems -a UbuntuServer_24.04.qcow2 --all --long -h

# List filesystems, partitions, and logical volumes in a VM disk image (domain)
virt-filesystems -d debian-server01 --all --long -h
```

##### 🔍 inspetor virtual

```sh
# Inspect and report on the operating system in a VM disk image
virt-inspector -a UbuntuServer_24.04.qcow2 #(disk)
virt-inspector -d debian-server01 #(domain) 
```

##### 🐱 gato virt

```sh
# Display the contents of a file inside a VM disk image
virt-cat -a UbuntuServer_24.04.qcow2 /etc/hosts
virt-cat -d debian-server01 /etc/hosts #(domain)
```

##### 🔀 Virt-Diff

```sh
# Show differences between two VM disk images
virt-diff -a UbuntuServer_24.04.qcow2 -A Rocky-Linux.qcow2
```

##### 🧹virt-sparsify

```sh
# Make a VM disk image smaller by removing unused space
virt-sparsify UbuntuServer_24.04.qcow2 UbuntuServer_24.04-sparse.qcow2
```

##### 📏 redimensionamento virt

```sh
# Resize a VM disk image or its partitions
virt-filesystems -a UbuntuServer_24.04.qcow2 --all --long -h #(check size of partitions)
qemu-img create -f qcow2 UbuntuServer_24.04-expanded.qcow2 100G #(create new disk image with 100G)
virt-resize --expand /dev/ubuntu-vg/ubuntu-lv \
UbuntuServer_24.04.qcow2 UbuntuServer_24.04-expanded.qcow2

```

##### 📥 cópia virtual

```sh
# Copy files from the host into a VM disk image

virt-copy-in -a UbuntuServer_24.04.qcow2 ~vagrant/test-virt-copy-in.txt /home/ubuntu
```

##### 📤 cópia virtual

```sh
# Copy files from a VM disk image to the host
virt-copy-out -a UbuntuServer_24.04.qcow2 /home/ubuntu/.bashrc /tmp
```

##### 📋virt-ls

```sh
# List files and directories inside a VM disk image
virt-ls -a UbuntuServer_24.04.qcow2 /home/ubuntu
```

##### 🚑 Virt-rescue

```sh
# Launch a rescue shell on a VM disk image for recovery
virt-rescue -a UbuntuServer_24.04.qcow2
```

##### 🧰virt-sysprep

```sh
# Prepare a VM disk image for cloning by removing system-specific data
virt-sysprep -a UbuntuServer_24.04.qcow2
```

##### 🔄 virt-v2v

```sh
# Convert a VM from a foreign hypervisor to run on KVM
virt-v2v -i disk input-disk.img -o local -os /var/tmp
```

##### 🔄 virt-p2v

```sh
# Convert a physical machine to use KVM
```

##### 💽 virt-p2v-make-disk

```sh
# Create a bootable disk image for physical to virtual conversion
sudo virt-p2v-make-disk -o output.img
```

#### 📝 351.5 Notas

##### 📦 OVF: formato de virtualização aberto

OVF: um formato aberto que define um padrão para embalagem e distribuição de máquinas virtuais em diferentes ambientes.

O pacote gerado possui a extensão .ova e contém os seguintes arquivos:

-   .ovf: arquivo XML com metadados que definem o ambiente da máquina virtual
-   Arquivos de imagem: .vmdk, .vhd, .vhdx, .qcow2, .raw
-   Arquivos adicionais: metadados, instantâneos, configuração, hash

<p align="right">(<a href="#topic-351.5">back to sub Topic 351.5</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352"></a>

## 📦 Tópico 352: Virtualização de contêineres

* * *

<a name="topic-352.1"></a>

### 🧠 352.1 conceitos de virtualização de contêineres

![virtualization-container](images/virtualization-container.png)

```mermaid
timeline
    title Time Line containers Evolution
    1979 : chroot
    2000 : FreeBSD Jails
    2002 : Linux Namespaces
    2005 : Solaris containers
    2007 : cgroups
    2008 : LXC
    2013 : Docker
    2015 : Kubernetes
```

* * *

**Peso:**7

**Descrição:**Os candidatos devem entender o conceito de virtualização de contêineres. Isso inclui a compreensão dos componentes do Linux usados ​​para implementar a virtualização de contêineres, bem como usar as ferramentas padrão do Linux para solucionar esses componentes.

**Principais áreas de conhecimento:**

-   Entenda os conceitos de sistema e contêiner de aplicativos
-   Compreender e analisar namespaces de kernel
-   Entender e analisar grupos de controle
-   Compreender e analisar capacidades
-   Entenda a função do seccomp, SELinux e AppArmor para virtualização de contêineres
-   Entenda como o LXC e o Docker alavancam namespaces, cgroups, recursos, Seccomp e Mac
-   Entenda o princípio do runc
-   Entenda o princípio do CRI-O e do containerd
-   Conhecimento do tempo de execução do OCI e das especificações de imagem
-   Conhecimento da interface de tempo de execução do contêiner Kubernetes (CRI)
-   Consciência de Podman, Buildah e Scopeo
-   Consciência de outras abordagens de virtualização de contêineres no Linux e em outros sistemas operacionais gratuitos, como RKT, OpenVZ, Systemd-Nspawn ou BSD prisões

* * *

#### 📋 352.1 Objetos citados

```sh
nsenter
unshare
ip (including relevant subcommands)
capsh
/sys/fs/cgroups
/proc/[0-9]+/ns
/proc/[0-9]+/status
```

* * *

#### 🧠 Entendendo os recipientes

![container](images/containers1.png)

containers são uma tecnologia de virtualização leve que empacota aplicativos junto com suas dependências necessárias (código, bibliotecas, variáveis ​​de ambiente e arquivos de configuração) em unidades isoladas, portáteis e reproduzíveis.

> Em termos simples: um contêiner é uma caixa de autocontrole que executa seu aplicativo da mesma maneira, em qualquer lugar.

##### 💡 O que é um contêiner?

Ao contrário das Máquinas Virtuais (VMs), os contêineres não virtualizam hardware. Em vez disso, eles virtualizam o sistema operacional. Os contêineres compartilham o mesmo kernel Linux com o host, mas cada um opera em um espaço de usuário totalmente isolado.

📌 Recipientes versus máquinas virtuais:

| Recurso                 | recipientes                     | Máquinas Virtuais                           |
| ----------------------- | ------------------------------- | ------------------------------------------- |
| OS Kernel               | Compartilhado com o anfitrião   | Cada VM tem seu próprio sistema operacional |
| Hora de inicialização   | Rápido (segundos ou menos)      | Lento (minutos)                             |
| Tamanho da imagem       | Leve (MBS)                      | Pesado (GBS)                                |
| Eficiência de recursos  | Alto                            | Mais baixo                                  |
| Mecanismo de isolamento | Recursos de kernel (namespaces) | Hipervisor                                  |

##### 🔑 Principais características dos contêineres

🔹**Leve**: compartilha o kernel do sistema operacional host, reduzindo a sobrecarga e permitindo uma inicialização rápida.

🔹**Portátil**: Execute de forma consistente em diferentes ambientes (dev, estadiamento, Prod, Cloud, On-Prem).

🔹**Isolado**: Use namespaces para isolamento de processos, redes e sistemas de arquivos.

🔹**Eficiente**: Habilite maior densidade e melhor utilização de recursos do que as VMs tradicionais.

🔹**Escalável**: ajuste perfeito para microsserviços e arquitetura nativa da nuvem.

##### 🧱 Tipos de contêineres

1.  Contêineres do sistema

    -   Projetado para executar todo o sistema operacional, assemelha-se a máquinas virtuais.
    -   Suporte a vários processos e serviços do sistema (init, syslog).
    -   Ideal para aplicações legadas ou monolíticas.
    -   Exemplo: LXC, libvirt-lxc.
2.  Contêineres de aplicativos

    -   Projetado para executar um único processo.
    -   Sem estado, efêmero e horizontalmente escalável.
    -   Amplamente utilizado em ambientes modernos de DevOps e Kubernetes.
    -   Exemplo: Docker, Containerd, Cri-O.

##### 🚀 Tempos de contêineres populares

| Tempo de execução | Descrição                                                                                 |
| ----------------- | ----------------------------------------------------------------------------------------- |
| **Docker**        | CLI/daemon mais amplamente adotado para construir e executar contêineres.                 |
| **contêiner**     | Tempo de execução leve alimentando Docker e Kubernetes.                                   |
| **CRI-O**         | Tempo de execução nativo do Kubernetes para contêineres OCI.                              |
| **LXC**           | Contêineres de sistema Linux tradicionais, mais próximos do sistema operacional completo. |
| **Rkt**           | Tempo de execução focado na segurança (obsoleto).                                         |

##### 🔐 Interiores do contêiner e elementos de segurança

| Componente            | Papel                                                                  |
| --------------------- | ---------------------------------------------------------------------- |
| **Namespaces**        | Isole processos, usuários, montagens, redes.                           |
| **CGROUPS**           | Controle e limite o uso de recursos (CPU, memória, IO).                |
| **Recursos**          | Controle de privilégios refinado dentro de contêineres.                |
| **Seccomp**           | Restringem os syscalls permitidos para reduzir a superfície de ataque. |
| **APARMOR / SELinux** | Aplicação obrigatória de controle de acesso no nível do kernel.        |

* * *

#### 🧠 Entendendo o Chroot - Alterar o diretório raiz no Unix/Linux

![chroot](images/chroot.png)

##### O que é chroot?

O Chroot (abreviação de ROOTE de mudança) é uma chamada e comando do sistema em sistemas operacionais do tipo UNIX que altera o diretório raiz aparente (/) para o processo de execução atual e seus filhos. Isso cria um ambiente isolado, comumente referido como uma prisão de chroot.

##### 🧱 Finalidade e casos de uso

-   🔒 Isolar aplicativos para segurança (prisão).
-   🧪 Crie ambientes de teste sem impactar o restante do sistema.
-   Recovery Recuperação do sistema (por exemplo, inicialização no LiveCD e Chroot no sistema instalado).
-   📦 Construindo pacotes de software em um ambiente controlado.

##### 📁 Estrutura mínima necessária

O ambiente de chroot deve ter seus próprios arquivos e estrutura essenciais:

```sh
/mnt/myenv/
├── bin/
│   └── bash
├── etc/
├── lib/
├── lib64/
├── usr/
├── dev/
├── proc/
└── tmp/
```

Use LDD para identificar as bibliotecas necessárias:

```sh
ldd /bin/bash
```

##### 🚨 Limitações e considerações de segurança

-   chroot não é um limite de segurança como contêineres ou VMs.
-   Um usuário privilegiado (root) dentro da prisão pode potencialmente escapar.
-   Nenhum isolamento de namespaces de processos, dispositivos ou recursos em nível de kernel.

Para um isolamento mais forte, considere alternativas como:

-   Contêineres Linux (LXC, Docker)
-   Máquinas virtuais (KVM, QEMU)
-   Namespaces e cgroups do kernel

##### 🧪 Teste o chroot com Debootstrap

```sh
# download debian files
sudo debootstrap stable ~vagrant/debian http://deb.debian.org/debian
sudo chroot ~vagrant/debian bash
```

##### : 🧪 CHROOT LAB

Use este script para laboratório:[chroot.sh](scripts/container/chroot.sh)

[![asciicast](https://asciinema.org/a/PWkjazgTXll9678Qy6LLOaKdN.svg)](https://asciinema.org/a/PWkjazgTXll9678Qy6LLOaKdN)

* * *

#### 🧠 Compreendendo os namespaces do Linux

![linux-namespaces](images/linux-namespaces2.png)

Os namespaces são um recurso principal do kernel Linux que permite o isolamento no nível do processo. Eles criam "visualizações" separadas dos recursos globais do sistema - como IDs de processo, redes, sistemas de arquivos e usuários - para que cada grupo de processos acredite que está em execução em seu próprio sistema.

> Em termos simples: os namespaces enganam um processo a pensar que ele é dono da máquina, mesmo que esteja apenas compartilhando -a.

Esta é a base para o isolamento de contêineres.

##### 🔍 O que os namespaces isolam?

Cada tipo de namespace isola um recurso específico do sistema. Juntos, eles constituem a sandbox em que um contêiner opera:

| Espaço para nome | Isolados ...                              | Exemplo do mundo real                                           |
| ---------------- | ----------------------------------------- | --------------------------------------------------------------- |
| **PID**          | IDs de processo                           | Processos dentro de um recipiente, veja um espaço PID diferente |
| **Montar**       | Pontos de montagem do sistema de arquivos | Cada contêiner vê seu próprio sistema de arquivos raiz          |
| **Rede**         | Pilha de rede                             | Contêineres têm IPs isolados, interfaces e rotas                |
| **UTS**          | Nome de host e nome de domínio            | Cada contêiner define seu próprio nome de host                  |
| **CIP**          | Memória compartilhada e semáforos         | Impede a comunicação entre processos entre contêineres          |
| **Usuário**      | IDs de usuário e grupo                    | Ativa a raiz falsa (UID 0) dentro do recipiente                 |
| **CGROUP (V2)**  | Controlar a adesão ao grupo               | Laços em controles de recursos como CPU e limites de memória    |

##### 🧪 Analogia Visual

![linux-namespaces](images/linux-namespaces.png)

Imagine um prédio de escritórios compartilhado:

-   Todos os locatários compartilham a mesma base (kernel do Linux).
-   Cada empresa possui seu próprio escritório (espaço para nome): bloqueios diferentes, móveis, linhas telefônicas e nome da empresa.
-   Para cada inquilino, parece seu próprio prédio.

É exatamente assim que os contêineres experimentam o sistema - isolados, mas eficientes.

##### 🔧 Como os contêineres usam namespaces

Quando você executa um contêiner (por exemplo, com Docker ou Podman), o tempo de execução cria um novo conjunto de namespaces:

```bash
docker run -it --rm alpine sh
```

Este comando fornece o processo:

-   Um novo namespace PID → é o processo 1 dentro do contêiner.
-   Um novo espaço para nome de rede → sua própria Ethernet virtual.
-   Um namespace de montagem → um sistema de arquivos raiz específico do contêiner.
-   Outros espaços para nome, dependendo da configuração (usuário, IPC, etc.)

O resultado: um ambiente de tempo de execução leve e isolado que se comporta como um sistema separado.

##### ⚙️ Recursos de kernel complementares

Namespaces ocultam recursos de contêineres. Mas para controlar quanto podem usar e o que podem fazer, precisamos de mecanismos adicionais:

###### 🔩 Cgroups (grupos de controle)

Os cgroups permitem que o kernel limite, priorize e monitore o uso de recursos entre os grupos de processos.

| Recurso      | Use exemplos de casos                       |
| ------------ | ------------------------------------------- |
| CPU          | Limite o tempo de CPU por contêiner         |
| Memória      | Limitar o uso de RAM                        |
| E/S de disco | Operações de leitura/gravação do acelerador |
| Rede (V2)    | Restrições de largura de banda              |

🛡️ Evita o problema do “vizinho barulhento”, impedindo que um contêiner consuma todos os recursos do sistema.

###### 🧱 Capacidades

O Linux tradicional usa um modelo de privilégio binário: raiz (UID 0) pode fazer tudo, todo mundo é limitado.

| Capacidade             | Permite ...                                                 |
| ---------------------- | ----------------------------------------------------------- |
| `CAP_NET_BIND_SERVICE` | Vinculação a portas privilegiadas (por exemplo, 80, 443)    |
| `CAP_SYS_ADMIN`        | Um poderoso recurso para tarefas administrativas do sistema |
| `CAP_KILL`             | Enviando sinais para processos arbitrários                  |

Ao soltar recursos desnecessários, os contêineres podem executar apenas o que precisam - reduzindo o risco.

##### 🔐 Mecanismos de segurança

Usado em conjunto com namespaces e cgroups para bloquear o que um processo contêiner pode fazer:

| Recurso     | Descrição                                                                 |
| ----------- | ------------------------------------------------------------------------- |
| **seccomp** | Lista de permissões ou bloqueios de chamadas do sistema Linux (syscalls)  |
| **APARMOR** | Aplicar perfis de segurança por aplicação                                 |
| **Selinux** | Aplique o controle de acesso obrigatório com políticas de sistema rígidas |

##### 🧠 Resumo para iniciantes

> ✅ Namespaces Isolle o que um contêiner pode ver
> ✅ CGROUPS Controle o que pode usar
> ✅ Capacidades e módulos de segurança definem o que pode fazer

Juntos, esses recursos do kernel formam a espinha dorsal técnica do isolamento de contêineres-permitindo implantação de aplicação de alta densidade, segurança e eficiência sem VMs completas.

##### 🧪 Namespaces de laboratório

Use este script para laboratório:[namespace.sh](scripts/container/namespace.sh)

[![asciicast](https://asciinema.org/a/8H6iczCMO24VgjWqwCcXEKWBG.svg)](https://asciinema.org/a/8H6iczCMO24VgjWqwCcXEKWBG)

* * *

#### 🧩 Entendendo os cgroups (grupos de controle)

![cgroups](images/cgroups1.png)

##### 📌 Definição

Os grupos de controle (CGROUPS) são um recurso Linux Kernel introduzido em 2007 que permite limitar, explicar e isolar o uso de recursos (CPU, memória, E/S de disco, etc.) de grupos de processos.

cgroups são muito usados ​​por tempos de execução de contêineres de baixo nível, como runc e crun, e aproveitados por mecanismos de contêineres como Docker, Podman e LXC para impor limites de recursos e fornecer isolamento entre contêineres.

Os namespaces isolam o controle de cgroups.

Os namespaces criam ambientes separados para processos (como PID, rede ou montagens), enquanto o CGROUPS limitam e monitoram o uso de recursos (CPU, memória, E/S) para esses processos.

⚙️ Principais recursos

| Recurso                   | Descrição                                                                   |
| ------------------------- | --------------------------------------------------------------------------- |
| **Limitação de recursos** | Impor limites sobre quanto de um recurso um grupo pode usar                 |
| **Priorização**           | Alocar mais prioridade de CPU/IO para alguns grupos em detrimento de outros |
| **Contabilidade**         | Rastreie o uso de recursos por grupo                                        |
| **Controlar**             | Suspender, retomar ou matar processos a granel                              |
| **Isolamento**            | Impedir a fome de recursos entre os grupos                                  |

##### 📦 Subsistemas (Controladores)

Os cgroups operam através dos controladores, cada um responsável pelo gerenciamento de um tipo de recurso:

| subsistema | Descrição                               |
| ---------- | --------------------------------------- |
| `cpu`      | Controla o agendamento da CPU           |
| `cpuacct`  | Gera relatórios de uso da CPU           |
| `memory`   | Limites e uso de memória das contas     |
| `blkio`    | Limita a E/S do dispositivo de bloco    |
| `devices`  | Controla o acesso aos dispositivos      |
| `freezer`  | Suspende/retoma a execução de tarefas   |
| `net_cls`  | Marca pacotes para modelagem de tráfego |
| `ns`       | Gerencia o acesso ao namespace (raro)   |

##### Layout Layout do sistema de arquivos

Os cgroups são expostos através do sistema de arquivos virtual em/sys/fs/cgroup.

Dependendo da versão:

-   **CGROUPS V1**: hierarquias separadas para cada controlador (por exemplo, memória, CPU, etc.)
-   **CGROUPS V2**: Hierarquia unificada sob um único ponto de montagem

Montado sob:

```sh
/sys/fs/cgroup/
```

Hierarquia típica de CGROUPS v1:

```sh
/sys/fs/cgroup/
├── memory/
│   ├── mygroup/
│   │   ├── tasks
│   │   ├── memory.limit_in_bytes
├── cpu/
│   └── mygroup/
└── ...
```

No cgroups v2, todos os recursos são gerenciados sob uma hierarquia unificada:

```sh
/sys/fs/cgroup/
├── cgroup.procs
├── cgroup.controllers
├── memory.max
├── cpu.max
└── ...
```

##### 🧪 Uso comum (exemplos v1 e v2)

v1 – Criar e atribuir limite de memória:

```sh
# Mount memory controller (if needed)
mount -t cgroup -o memory none /sys/fs/cgroup/memory

# Create group
mkdir /sys/fs/cgroup/memory/mygroup

# Set memory limit (100 MB)
echo 104857600 | tee /sys/fs/cgroup/memory/mygroup/memory.limit_in_bytes

# Assign a process (e.g., current shell)
echo $$ | tee /sys/fs/cgroup/memory/mygroup/tasks
```

V2 - Hierarquia unificada:

```sh
# Create subgroup
mkdir /sys/fs/cgroup/mygroup

# Enable controllers
echo +memory +cpu > /sys/fs/cgroup/cgroup.subtree_control

# Move shell into group
echo $$ > /sys/fs/cgroup/mygroup/cgroup.procs

# Set limits
echo 104857600 > /sys/fs/cgroup/mygroup/memory.max
echo "50000 100000" > /sys/fs/cgroup/mygroup/cpu.max  # 50ms quota per 100ms period
```

🧭 Inspeção de Processo e Grupo

| Comando                 | Descrição                                  |
| ----------------------- | ------------------------------------------ |
| `cat /proc/self/cgroup` | Mostra a associação atual do CGROUP        |
| `cat /proc/PID/cgroup`  | cgroup de outro processo                   |
| `cat /proc/PID/status`  | Informações de memória e cgroup            |
| `ps -o pid,cmd,cgroup`  | Mostrar mapeamento de processo para cgroup |

##### 📦 Uso em contêineres

Motores de contêiner como Docker, Podman e Containerd Delegate Resource Control para CGroups (via Runc ou Crun), permitindo:

-   Limites de CPU e memória por contêiner
-   Controle refinado sobre blkio e dispositivos
-   Contabilidade de recursos em tempo real

Exemplo do Docker:

```sh
docker run --memory=256m --cpus=1 busybox
```

Nos bastidores, isso cria regras do CGROUP para limites de memória e CPU para o processo de contêiner.

##### 🧠 Resumo de conceitos

| Conceito          | Explicação                                                          |
| ----------------- | ------------------------------------------------------------------- |
| **Controladores** | Módulos como`cpu`,`memory`,`blkio`, etc. aplicar limites e regras   |
| **Tarefas**       | PIDs (processos) atribuídos ao grupo de controle                    |
| **Hierarquia**    | Cgroups são estruturados em uma árvore pai-filho                    |
| **Delegação**     | Systemd e serviços de usuário podem gerenciar subárvores de cgroups |

##### 🧪 CGROUPS LAB

Use este script para laboratório:[cgroups.sh](scripts/container/cgroups.sh)

[![asciicast](https://asciinema.org/a/WbudWJpHKPzBWMh8CGRxCIpZf.svg)](https://asciinema.org/a/WbudWJpHKPzBWMh8CGRxCIpZf)

* * *

#### 🛡️ Compreendendo as capacidades

❓ Quais são os recursos do Linux?

Tradicionalmente no Linux, o usuário root tem acesso irrestrito ao sistema. Os recursos do Linux foram introduzidos para dividir esses privilégios todo-poderosos em permissões menores e discretas, permitindo que os processos executem operações privilegiadas específicas sem exigir acesso root completo.

Isso aprimora a segurança do sistema, aplicando o princípio do menor privilégio.

| 🔐 Capacidade          | 📋 Descrição                                                       |
| ---------------------- | ------------------------------------------------------------------ |
| `CAP_CHOWN`            | Alterar o proprietário do arquivo independentemente das permissões |
| `CAP_NET_BIND_SERVICE` | Ligue para as portas abaixo de 1024 (por exemplo, 80, 443)         |
| `CAP_SYS_TIME`         | Definir relógio do sistema                                         |
| `CAP_SYS_ADMIN`        | ⚠️ Muito poderoso - inclui Mount, BPF e muito mais                 |
| `CAP_NET_RAW`          | Use soquetes brutos (por exemplo, ping, traceroute)                |
| `CAP_SYS_PTRACE`       | Rastrear outros processos (depuração)                              |
| `CAP_KILL`             | Envie sinais para qualquer processo                                |
| `CAP_DAC_OVERRIDE`     | Modifique arquivos e diretórios sem permissão                      |
| `CAP_SETUID`           | Alterar ID de usuário (UID) do processo                            |
| `CAP_NET_ADMIN`        | Gerenciar interfaces de rede, roteamento, etc.                     |

🔐 Alguns tipos de recursos do Linux

| Tipo de capacidade       | Descrição                                                                         |
| ------------------------ | --------------------------------------------------------------------------------- |
| **CapInh (Inherited)**   | Recursos herdados do processo pai.                                                |
| **CapPrm (Permitido)**   | Capacidades que o processo pode ter.                                              |
| **CapEff (efetivo)**     | Recursos que o processo está usando atualmente.                                   |
| **Capbnd (delimitador)** | Restringe o conjunto máximo de recursos eficazes que um processo pode obter.      |
| **CapAmb (ambiente)**    | Permite que um processo defina explicitamente suas próprias capacidades efetivas. |

📦 Capacidades em recipientes e vagens
Os contêineres normalmente não são executados como raiz completa, mas recebem um conjunto limitado de recursos por padrão, dependendo do tempo de execução.

Os recursos podem ser adicionados ou descartados em Kubernetes usando o SecurityContext.

📄 Exemplo de Kubernetes:

```yaml
securityContext:
  capabilities:
    drop: ["ALL"]
    add: ["NET_BIND_SERVICE"]
```

🔐 Isso garante que o contêiner comece com zero privilégios e receba apenas o que é necessário.

##### 🧪 Recursos de laboratório

Use este script para laboratório:[capabilities.sh](scripts/container/capabilities.sh)

[![asciicast](https://asciinema.org/a/kCiUGvY0YGA5Mdzbj1NSdfLAx.svg)](https://asciinema.org/a/kCiUGvY0YGA5Mdzbj1NSdfLAx)

#### 🛡️ Seccomp (modo de computação segura)

**O que é?**

-   Um recurso do kernel Linux para restringir quais syscalls (chamadas de sistema) um processo pode usar.
-   Comumente usado em contêineres (como Docker), navegadores, sandboxes, etc.

**Como funciona?**

-   Um processo permite um perfil/filtro Seccomp.
-   O kernel bloqueia, registra ou mata o processo se tentar syscalls proibidos.
-   Os filtros são escritos no formato BPF (Berkeley Packet Filter).

**Comandos rápidos**

```sh
# Check support
docker info | grep Seccomp

# Disable for a container:
docker run --security-opt seccomp=unconfined ...

# Inspect running process:
grep Seccomp /proc/$$/status
```

**Ferramentas**

```sh
# for analyzing
seccomp-tools 

# Profiles
/etc/docker/seccomp.json
```

#### 🦺AppArmor

**O que é?**

-   Um sistema de controle de acesso obrigatório (MAC) para restringir o que programas específicos podem acessar.
-   Os perfis são baseados em texto, orientados para o caminho, fáceis de ler e editar.

**Como funciona?**

-   Cada binário pode ter um perfil que define seus arquivos permitidos, rede e capacidades – até mesmo como root!
-   Fácil de alternar entre os modos reclamar, aplicar e desabilitar.

**Comandos rápidos:**

```sh
#Status
aa-status

# Put a program in enforce mode
sudo aa-enforce /etc/apparmor.d/usr.bin.foo

# Profiles
location: /etc/apparmor.d/
```

**Ferramentas:**

AA-GENPROF, AA-LOGPROF para gerar/atualizar perfis

Logs

```sh
/var/log/syslog (search for apparmor)
```

#### 🔒SeLinux (Linux aprimorado de segurança)

**O que é?**

-   Um sistema MAC muito poderoso para controlar o acesso a tudo: arquivos, processos, usuários, portas, redes e muito mais.
-   Usa rótulos (contextos) e políticas detalhadas.

**Como funciona?**

-   Tudo (processo, arquivo, porta, etc.) recebe um contexto de segurança.
-   O kernel verifica todas as ações contra regras políticas.

**Comandos rápidos:**

```sh
#Status
sestatus

#Set to enforcing/permissive:
setenforce 1  # Enforcing
setenforce 0  # Permissive

#List security contexts:
ls -Z  # Files
ps -eZ # Processes
```

**Ferramentas:**

-   audit2allow, semanage, chcon (para gerenciar políticas/rótulos)
-   Registros: /var/log/audit/audit.log
-   Políticas: /etc/selinux/

#### 📋 Tabela de resumo para sistemas de segurança comuns

| Sistema  | Foco                    | Complexidade | Localização da política                | Uso típico              |
| -------- | ----------------------- | ------------ | -------------------------------------- | ----------------------- |
| Seccomp  | Syscalls do kernel      | Médio        | Por processo (via código/configuração) | Docker, caixas de areia |
| AppArmor | Acesso por programa     | Fácil        | /etc/apparmor.d/                       | Ubuntu, Snap, SUSE      |
| Selinux  | MAC de sistema completo | Avançado     | /etc/selinux/ + rótulos                | RHEL, Fedora, CentOS    |

#### 🗂️ Comparação de isolamento e segurança de contêiner Linux

| Tecnologia               | Objetivo / O que faz                                                                                                   | Principais diferenças                                                                                         | Exemplo em contêineres                                                                             |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| **Chroot 🏠**            | Altera o diretório raiz aparente para um processo. Isolate o sistema de arquivos.                                      | Isolamento simples do sistema de arquivos; faz**não**restringir recursos, privilégios ou chamadas de sistema. | Docker usa`chroot`internamente para construir imagens mínimas, mas não para isolamento forte.      |
| **CGROUPS 📊**           | Controla e limita o uso de recursos (CPU, memória, E/S de disco, etc.) por grupo de processos.                         | Recurso do kernel; controle refinado de recursos, não isolamento.                                             | Docker e Kubernetes usam cgroups para limitar CPU/mem por contêiner/pod.                           |
| **espaços para nome 🌐** | Isolar recursos do sistema: PID, MOUNT, UTS, Rede, Usuário, IPC, Time.                                                 | Recurso do kernel; fornece diferentes tipos de isolamento.                                                    | Cada contêiner é executado em seu próprio conjunto de namespaces (PID, net, mount, etc).           |
| **Recursos 🛡️**         | Divida os privilégios de root em unidades refinadas (por exemplo, net_administrador, sistema_administrador).           | Mais granular do que tudo o ou nada raiz/não raiz; pode abandonar ou conceder privilégios específicos.        | Os contêineres do Docker geralmente são executados com recursos reduzidos (solteiros perigosos).   |
| **Seccomp 🧱**           | Filtrar/restringir quais syscalls um processo pode fazer (lista branca/lista negra).                                   | Muito focado: bloqueia syscalls do kernel; não é possível bloquear todas as ações.                            | O perfil padrão do Docker bloqueia syscalls perigosos (por exemplo,,`ptrace`,`mount`).             |
| **AppArmor 🐧**          | Estrutura de controle de acesso obrigatório (MAC): restringe o acesso a arquivos/rede de programas por meio de perfis. | Baseado em perfil, mais fácil de gerenciar que o SELinux; menos refinado em alguns casos.                     | Os contêineres baseados no Ubuntu geralmente usam o AppArmor para perfis de processo de contêiner. |
| **Selinux 🔒**           | Estrutura MAC mais complexa, baseada em rótulos, muito refinada. Pode confinar usuários, processos e arquivos.         | Mais poderoso e complexo que o Aparmor; Forçado em Fedora/Rhel/Centos.                                        | No OpenShift/Kubernetes com RHEL, os rótulos SELinux são usados ​​para manter os pods separados.   |

Resumo

-   chroot: Isolamento básico, sem garantias de recursos/segurança.
-   cgroups: Controle de recursos, não isolamento.
-   namespaces: isolam "visualizações" dos recursos do kernel.
-   Recursos: privilégios de processo de ajuste fino.
-   seccomp: Restringe a superfície de chamada do sistema.
-   APARMOR/SELinux: limite o que os processos podem tocar, mesmo como root (Mac).

#### 🧩 OCI, Runc, Containerd, CRI, CRI-O-O que eles são no ecossistema de contêineres

##### Visão geral e funções

-   **OCI (Iniciativa de contêiner aberto) 🏛️**

    Uma fundação criando padrões abertos para**imagens de contêiner**e**Runtimes**.

    _Define como as imagens são formatadas, armazenadas e como os contêineres são iniciados/parados (especificações de tempo de execução)._
-   **⚙️ Runc**

    Uma ferramenta CLI universal, leve e de baixo nível que pode executar contêineres de acordo com a especificação de tempo de execução do OCI.

    _“O mecanismo” que transforma uma imagem + configuração em um contêiner Linux real em execução._
-   **contêiner 🏋️**

    Um daemon de tempo de execução de contêiner principal para gerenciar o ciclo de vida completo do contêiner:**puxando imagens, gerenciando armazenamento, executando recipientes**(chama Runc), plugins de rede, etc.

    _Usado por Docker, Kubernetes, nerdctl e outras ferramentas como back-end de tempo de execução de contêiner principal._
-   **CRI (interface de tempo de execução do contêiner) 🔌**

    Uma API gRPC específica do Kubernetes para conectar o Kubernetes a tempos de execução de contêiner.

    _Não usado fora de Kubernetes, mas permite que os K8s conversem com contêineres, Cri-O, etc._
-   **CRI-O 🥤**

    Um tempo de execução leve e focado em Kubernetes que**apenas**Executa contêineres OCI, usando o Runc sob o capô.

    _Usado principalmente em Kubernetes, mas demonstra como construir um tempo de execução de contêiner mínimo focado em padrões abertos._

##### 🏷️ Tabelas de comparação: Oci, Runc, Containerd, Cri, Cri-o

| Componente    | Emoji | O que é?                                     | Quem usa?                               | Exemplo de uso                                                                                 |
| ------------- | ----- | -------------------------------------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------- |
| **OCI**       | 🏛️   | Padrões/especificações                       | Docker, Podman, CRI-O, containerd, runc | Garante que imagens/contêineres sejam compatíveis entre ferramentas                            |
| **runc**      | ⚙️    | tempo de execução do contêiner (CLI)         | containerd, CRI-O, Docker, Podman       | Executar diretamente um contêiner a partir de um pacote (por exemplo,`runc run`)               |
| **contêiner** | 🏋️   | daemon de tempo de execução do contêiner     | Docker, Kubernetes, nerdctl             | Lida com extração de imagens, gerenciamento de armazenamento/rede, inicia contêineres via runc |
| **Cri**       | 🔌    | Interface de tempo de execução (API) K8s     | Somente Kubernetes                      | Vamos kubelet falar com containerd/CRI-O                                                       |
| **CRI-O**     | 🥤    | Tempo de execução de contêiner leve para K8s | Kubernetes, OpenShift                   | Usado como mecanismo de contêiner K8s                                                          |

* * *

##### Exemplos Exemplos práticos (mundo geral de contêineres)

-   **Construindo imagens:**

    Qualquer ferramenta (Docker, Podman, Builtah) pode produzir imagens seguindo o**OCI Image Spec**Então eles são compatíveis em todos os lugares.
-   **Executando contêineres:**

    Tanto o Podman quanto o Docker usam**Runc**(via contêiner ou diretamente) para criar contêineres.
-   **Gerenciando muitos contêineres:**

    **contêiner**pode ser usado sozinho (via`ctr`ou`nerdctl`) ou como back-end para Docker e Kubernetes.
-   **Tempos de execução plug-and-play:**

    Obrigado a**OCI**, você pode trocar o runc por outro tempo de execução compatível com OCI (como contêineres Kata para VMs, gVisor para sandbox) sem alterar a forma como você cria ou gerencia imagens.

* * *

##### 🚢 Pilha típica

```plaintext
[User CLI / Orchestration]
           |
   [containerd / CRI-O]
           |
        [runc]
           |
[Linux Kernel: namespaces, cgroups, etc]
```

-   **Docker**: Usuário 151 → Contêiner → Runc
-   **Subman**: Usuário 151 → runc
-   **Kubernetes**: Kubelet (CRI) → containerd ou cri-o → runc

* * *

##### 🧠 Resumo

-   **OCI**= Linguagem comum para imagens/tempo de execução (padrões/especificações)
-   **runc**= Ferramenta real que cria e gerencia processos de contêiner
-   **contêiner**= Daemon completo que gerencia imagens, contêineres, ciclo de vida
-   **IRC**= Somente para Kubernetes, para tornar os tempos de execução conectáveis
-   **CRI-O**= Tempo de execução leve focado em Kubernetes, baseado em padrões OCI e runc

##### 🧩 Diagrama: ecossistema de contêineres

```mermaid
graph TD
    subgraph OCI_Standards
        OCI1["OCI Image Spec"]
        OCI2["OCI Runtime Spec"]
    end

    subgraph Orchestration_CLI
        Docker["Docker CLI"]
        Podman["Podman CLI"]
        Kubelet["Kubelet"]
        Nerdctl["nerdctl CLI"]
    end

    subgraph container_Runtimes
        containerd["containerd"]
        crio["CRI-O"]
    end

    runc["runc"]

    Kernel["Linux Kernel(namespaces, cgroups, seccomp, etc)"]

    %% Connections
    Docker --> containerd
    Podman --> runc
    Nerdctl --> containerd
    Kubelet --> CRI[CRI API]
    CRI --> containerd
    CRI --> crio
    containerd --> runc
    crio --> runc
    runc --> Kernel

    OCI1 -.-> containerd
    OCI1 -.-> crio
    OCI2 -.-> runc
```

##### 🧪 Lab Runc

Para runc lab, você pode usar este script:[runc.sh](scripts/container/runc.sh)

[![asciicast](https://asciinema.org/a/UDVnhKSxPFRXDcwg0HYFkZdlX.svg)](https://asciinema.org/a/UDVnhKSxPFRXDcwg0HYFkZdlX)

##### 🧪 contêiner de laboratório

Para containerd, você pode usar este script:[containerd.sh](scripts/container/container.sh)

[![asciicast](https://asciinema.org/a/fCJsiwcL2ePneQX1aafITtoGM.svg)](https://asciinema.org/a/fCJsiwcL2ePneQX1aafITtoGM)

* * *

#### 🚀 Podman, Buildah, Skopeo, OpenVZ, Crun e Kata Containers - Fast Track

* * *

##### 🐳**Subman**

-   **O que é?**Um gerenciador de contêineres compatível com Docker CLI, mas**Sem daemon**e pode correr**sem raízes**.
-   **Usar:**Crie, execute, pare e inspecione recipientes e vagens.
-   **Destaques:**Nenhum Daemon Central, mais seguro para o MultiUser, integra-se ao Systemd.
-   [Mais informações](<>)

* * *

##### 📦**Buildah**

-   **O que é?**Ferramenta para**construir e manipular imagens de contêiner**(OCI/Docker) sem daemon.
-   **Usar:**Construindo imagens em pipelines CI/CD ou scripts.
-   **Destaques:**Suporte leve e sem raízes, usado por Podman sob o capô.
-   [Mais informações](https://www.redhat.com/en/topics/containers/what-is-buildah)

* * *

##### 🔭**Escopo**

-   **O que é?**Utilidade para**inspecionar, copiar e mover imagens de contêiner**entre registros**sem puxar ou correr**eles.
-   **Usar:**Mova imagens, verifique assinaturas e metadados.
-   **Destaques:**Sem daemon, ideal para automação e segurança.
-   [Mais informações](<>)

* * *

##### 🏢**OpenVZ**

-   **O que é?****Virtualização baseada em contêiner**solução para Linux (pré-datada de ferramentas de contêiner modernas).
-   **Usar:**VPs leves (servidores privados virtuais) compartilhando o mesmo kernel.
-   **Destaques:**Muito eficiente, mas menos isolado que a VM (ações do kernel).
-   [Mais informações](https://en.wikipedia.org/wiki/OpenVZ)

* * *

##### ⚡**Crun**

-   **O que é?**Tempo de execução Ultra-Fast e Minimal OCI para contêineres, escrito em C (não vá).
-   **Usar:**Executa recipientes com sobrecarga mínima.
-   **Destaques:**Mais rápido e mais leve que o Runc, padrão para o Podman em alguns sistemas.
-   [Mais informações](https://www.redhat.com/sysadmin/introduction-crun)

* * *

##### 🛡️**A palavra recipientes**

-   **O que é?**Projeto de código aberto que combina contêineres e VMs: cada contêiner é executado em uma micro-VM leve.
-   **Usar:**Forte isolamento para cargas de trabalho confidenciais ou ambientes multilocatários.
-   **Destaques:**Segurança de grau de VM, desempenho próximo do contorno.
-   [Mais informações](https://katacontainers.io/)

* * *

##### 📊**Tabela de comparação**

| Projeto                   | Categoria               | Isolamento            | Daemon? | Uso principal                         | Sem raízes | Notas                                     |
| ------------------------- | ----------------------- | --------------------- | ------- | ------------------------------------- | ---------- | ----------------------------------------- |
| **Subman**                | Orquestração            | recipiente            | No      | Gerenciar contêineres                 | Sim        | CLI semelhante ao Docker                  |
| **Buildah**               | Construir               | N / D                 | No      | Construir imagens                     | Sim        | Para CI/CD, nenhuma execução de contêiner |
| **Escopo**                | Transferência de imagem | N / D                 | No      | Mova/verifique as imagens             | Sim        | Nenhuma execução de contêiner             |
| **OpenVZ**                | Virtualização           | contêiner/vps         | Sim     | VPS leve                              | No         | Kernel compartilhou, Tech Legacy          |
| **Crun**                  | OCI Runtime             | recipiente            | No      | Tempo de execução rápido do contêiner | Sim        | Mais rápido que o Runc                    |
| **A palavra recipientes** | Tempo de execução/VM    | Microvm por contêiner | No      | Isolamento forte                      | Sim        | Segurança em nível de VM                  |

* * *

##### ☑️**Recapitulação rápida**

-   **Podman:**Alternativa Docker moderna e sem daemon.
-   **Buildah:**Crie imagens, não executa recipientes.
-   **Skeape:**Move/inspeciona imagens, nunca as executa.
-   **OpenVZ:**VPS legado baseado em contêiner.
-   **Cruel:**Tempo de execução super rápido e leve da OCI.
-   **Dizer:**contêineres com isolamento em nível de VM.

#### 🛠️ 352.1 Comandos importantes

##### 🔗 cancelar o compartilhamento

```sh
# create a new namespaces and run a command in it
unshare --mount --uts --ipc --user --pid --net  --map-root-user --mount-proc --fork chroot ~vagrant/debian bash
# mount /proc for test
#mount -t proc proc /proc
#ps -aux
#ip addr show
#umount /proc
```

##### 🔍 lsns

```sh
# show all namespaces
lsns

# show only pid namespace
lsns -p <pid>
lsns -p 3669

ls -l /proc/<pid>/ns
ls -l /proc/3669/ns

ps -o pid,pidns,netns,ipcns,utsns,userns,args -p <PID>
ps -o pid,pidns,netns,ipcns,utsns,userns,args -p 3669
```

##### 🚪 NSENTER

```sh
# get PID docker container
# execute a command in namespace Network
sudo nsenter -t 3669 -n ip link show

# execute a command in namespace UTS
sudo nsenter -t 3669 -u hostname

# execute a command in namespace mount
nsenter -t 3669 -m ls

# execute a command in all namespaces
sudo nsenter -t 3669 -a ps
```

##### 🌐 252.1 IP

```sh
# create a new network namespace
sudo ip netns add lxc1

# list network list
ip netns list

# exec command in network namespace
sudo ip netns exec lxc1 ip addr show
```

##### 📊 estatística

```sh
# get cgroup version
stat -fc %T /sys/fs/cgroup
```

##### 🛠️ systemctl e systemd

```sh
# get cgroups of system
systemctl status
systemd-cgls
```

##### 🏗️ CGcreate

```sh
cgcreate -g memory,cpu:lsf
```

##### 🏷️ cgclassificar

```sh
cgclassify -g memory,cpu:lsf <PID>
```

##### 🛡️ PSCAP - Recursos de processo de lista

```sh
# List capabilities of all process
pscap
```

##### 🛡️ getcap/usr/bin/tcpdump

```sh
getcap /usr/bin/tcpdump
```

##### 🛡️ setcap cap_net_raw = ep/usr/bin/tcpdump

```sh
# add capabilities to tcpdump
sudo setcap cap_net_raw=ep /usr/bin/tcpdump

# remove capabilities from tcpdump
sudo setcap -r /usr/bin/tcpdump
sudo setcap '' /usr/bin/tcpdump
```

##### 🛡️ verifique os recursos por processo

```sh
grep Cap /proc/<PID>/status
```

##### 🛡️ capsh - capacidade de wrapper de shell

```sh
# use grep Cap /proc/<PID>/statusfor get hexadecimal value(Example CApEff=0000000000002000)
capsh --decode=0000000000002000
```

##### 🦺 Apparmor - Aprimoramento do kernel para limitar os programas a um conjunto limitado de recursos

```sh
# check AppArmor status
sudo aa-status

#  unload all AppArmor profiles
aa-teardown

# loads AppArmor profiles into the kernel
aaparmor_parser
```

##### 🔒 Selinux - Linux aprimorado em segurança

```sh
# check SELinux status
sudo sestatus

# check SELinux mode
sudo getenforce 

# set SELinux to enforcing mode
sudo setenforce 1
```

##### ⚙️ Runc

```sh
#create a spec file for runc
runc spec

# run a container using runc
sudo runc run mycontainer
```

* * *

<p align="right">(<a href="#topic-352.1">back to sub topic 352.1</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.2"></a>

### 📦 352,2 LXC

**Peso:**6

**Descrição:**Os candidatos devem poder usar contêineres do sistema usando LXC e LXD. A versão do LXC coberta é 3,0 ou superior.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura do LXC e LXD
-   Gerencie recipientes LXC com base nas imagens existentes usando LXD, incluindo redes e armazenamento
-   Configurar propriedades de contêiner LXC
-   Limitar o uso de recursos do contêiner LXC
-   Use perfis LXD
-   Entenda imagens LXC
-   Consciência das ferramentas tradicionais do LXC

#### 📋 352.2 Objetos citados

```sh
lxd
lxc (including relevant subcommands)
/etc/lxc/
/etc/default/lxc
/var/log/lxc/
/usr/share/lxc/templates
```

#### 🧩 LXC & LXD - O conjunto de contêineres do sistema Linux

* * *

##### 📦 LXC (contêineres Linux)

-   **O que é?**

    O_essencial_conjunto de ferramentas de espaço do usuário para gerenciar contêineres de aplicativos e sistemas no Linux. Pense no LXC como**"Chroot em esteróides"**- Ele fornece isolamento leve do processo usando recursos do kernel (espaços para nome, cgroups, Aparmor, Seccomp, etc.).
-   **Usar:**

    -   Execute distribuições completas do Linux como contêineres (não apenas aplicativos únicos).
    -   Útil para testes, aplicativos herdados ou servidores simulados.
-   **Destaques:**

    -   Focado em CLI:`lxc-create`,`lxc-start`,`lxc-attach`, etc.
    -   Controle refinado sobre os recursos do contêiner.
    -   Sem daemon – executa processos por contêiner.
-   **Melhor para:**

    Especialistas em Linux que desejam controle total e sensação “bare-metal” para contêineres.

##### 🧪 laboratório LXC

Para o laboratório LXC, você pode usar este script:[lxc.sh](scripts/container/lxc.sh)

[![asciicast](https://asciinema.org/a/CpjDAXRnaKH5kExg9eWSBJGHI.svg)](https://asciinema.org/a/CpjDAXRnaKH5kExg9eWSBJGHI)

* * *

##### 🌐LXD

-   **O que é?**

    **LXD**é um_próxima geração_Container e VM Manager,**Construído em cima do LXC**. Ele oferece uma experiência poderosa, mas fácil de usar, para gerenciar contêineres e máquinas virtuais via API REST, CLI ou até uma interface da web.
-   **Usar:**

    -   Gerenciar contêineres do sistema e máquinas virtuais em escala.
    -   Contêiner em rede “como serviço” com orquestração fácil.
-   **Destaques:**

    -   **Rest API**: gerencia contêineres/VMs pela rede.
    -   **Imagens:**Implantação instantânea de muitas distros do Linux.
    -   **Instantâneos, pools de armazenamento, clustering, migração em tempo real.**
    -   Suporta a execução de contêineres sem privilégios por padrão.
    -   CLI:`lxc launch`,`lxc exec`,`lxc snapshot`, etc._(Sim, o mesmo prefixo que LXC, mas back -end diferente!)_
-   **Melhor para:**

    DevOps, sysadmins, configurações nativas da nuvem, ambientes de laboratório.

##### 📝**Armazenamento LXD: tabela de recursos (por back-end)**

| Recurso                  | Você | zfs               | Brfs                  | LVM/LVMTHIN           | ceph/cepfs           |
| ------------------------ | ---- | ----------------- | --------------------- | --------------------- | -------------------- |
| **Instantâneos**         | ❌    | ✅                 | ✅                     | ✅                     | ✅                    |
| **Provisionamento fino** | ❌    | ✅                 | ✅                     | ✅ (lvmfino)           | ✅                    |
| **Redimensionamento**    | ❌    | ✅                 | ✅                     | ✅                     | ✅                    |
| **Cotas**                | ❌    | ✅                 | ✅                     | ✅ (LvMthin)           | ✅                    |
| **Migração ao vivo**     | ❌    | ✅                 | ✅                     | ✅                     | ✅                    |
| **Desduplicação**        | ❌    | ✅                 | ❌                     | ❌                     | ✅ (ceph)             |
| **Compressão**           | ❌    | ✅                 | ✅                     | ❌                     | ✅ (ceph)             |
| **Criptografia**         | ❌    | ✅                 | ❌                     | ✅ (luxo)              | ✅                    |
| **Cluster/Remoto**       | ❌    | ❌                 | ❌                     | ❌                     | ✅                    |
| **Melhor caso de uso**   | Dev  | Laboratórios/prod | Laboratórios/produção | Laboratórios/produção | Clusters, Enterprise |

##### 🔍**Resumo do armazenamento rápido LXD**

-   **Pools de armazenamento:**Abstrai o back-end: vários pools, diferentes drivers por pool.
-   **Drivers disponíveis:**Dir, zfs, btrfs, lvm, lvmthin, ceph, cephfs (mais via plugins).
-   **Volumes personalizados:**Criar, montar, desmontar para contêineres/VMs.
-   **Instantâneos e clones:**Nativo, rápido, suporta migração de backup/restauração, cópia-na-gravação.
-   **Cotas e redimensionamento:**Easy Live Management para piscinas, contêineres ou volumes.
-   **Migração ao vivo:**Mova contêineres/VMs entre hosts sem tempo de inatividade.
-   **Segurança:**Criptografia integrada (ZFS, LVM, Ceph), ACLs, backup/restauração, etc.
-   **Enterprise-Proy:**Adequado para configurações em cluster e de alta disponibilidade.

* * *

##### 📊 Tabela de comparação LXC vs LXD

| Recurso           | 🏷️ LXC                                       | 🌐LXD                                                        |
| ----------------- | --------------------------------------------- | ------------------------------------------------------------ |
| **Tipo**          | Gerente de contêiner de espaço de baixo nível | Gerente de alto nível (contêineres + VMs)                    |
| **Interface**     | Apenas CLI                                    | API REST, CLI, UI da Web                                     |
| **Daemon?**       | No (runs as processes)                        | Sim (daemon/serviço central)                                 |
| **Orquestração**  | Manual, programável                           | Clustering e API integrados                                  |
| **Imagens**       | Baseado em modelo                             | Repositório de imagem completa, muitos sistemas operacionais |
| **Instantâneos**  | Manual                                        | Nativo, integrado                                            |
| **Suporte da VM** | No                                            | Sim (QEMU/KVM)                                               |
| **Caso de uso**   | Controle refinado, “bare metal”               | Escalável, fácil de usar e multi-host                        |
| **Segurança**     | Pode ser sem privilégios, mas faça você mesmo | Não privilegiado, mais isolamento                            |
| **Melhor para**   | Profissionais do Linux, scripts avançados     | DevOps, nuvem, equipes, autoatendimento                      |

* * *

##### ☑️ Recapitulação rápida

-   **LXC**= Os blocos de construção de baixo nível. Potência e flexibilidade para_puristas de contêineres_.
-   **LXD**= Plataforma moderna, baseada em API e escalável sobre LXC para_fácil_Gerenciamento de contêineres e VM (nó único ou clusters).

##### 🗃️ LXC vs LXD - Suporte de armazenamento (resumo)

| Recurso                             | **LXC**                                          | **LXD**                                                                                         |
| ----------------------------------- | ------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| **Back -ends de armazenamento**     | Sistema de arquivos local (somente padrão)       | **Você**(sistema de arquivos),**ZFS**,**BRFS**,**lvm**,**ceph**,**cephfs**,**lvmfino**          |
| **Conjuntos de armazenamento**      | ❌ (apenas caminhos locais, sem piscinas nativas) | ✅ Vários pools de armazenamento, cada um com drivers diferentes                                 |
| **Instantâneos**                    | Dependente de manual/FS                          | ✅ Instantâneos nativos, rápidos, automáticos, programados e consistentes                        |
| **Provisionamento fino**            | ❌ (não suportado nativamente)                    | ✅ Suportado em ZFS, BTRFS, LVM Thin, CEPH                                                       |
| **Cotas**                           | ❌                                                | ✅ Compatível por contêiner/volume (em ZFS, Btrfs, Ceph, LVMthin)                                |
| **Migração ao vivo**                | Limitado                                         | ✅ Migração de armazenamento ao vivo entre hosts, cópia na gravação                              |
| **Criptografia**                    | ❌                                                | ✅ (ZFS, LVM, CEPH)                                                                              |
| **Volumes personalizados**          | ❌                                                | ✅ Criar, anexar/destacar os volumes de armazenamento personalizado para contêineres/VMs         |
| **Armazenamento remoto**            | ❌                                                | ✅ Suporte Ceph, CephFS, NFS, SMB                                                                |
| **Recursos do sistema de arquivos** | Host dependente                                  | ZFS: Dedup, Compress, instantâneos, enviar/receber, cache, cotas. LVM: fino, instantâneos, etc. |
| **Redimensionamento**               | Manual (via host)                                | ✅ Volumes e pools podem ser redimensionados ao vivo                                             |
| **Drivers de armazenamento**        | Básico/local apenas                              | Plug-ins extensíveis, vários drivers prontos para uso empresarial                               |

##### 📊 Tabela de comparação de armazenamento final

|                               | **LXC**         | **Lxd**                                                     |
| ----------------------------- | --------------- | ----------------------------------------------------------- |
| **Back-end de armazenamento** | Somente local   | Dir, zfs, btrfs, lvm, lvmthin, ceph, cephfs                 |
| **Pools de armazenamento**    | ❌               | ✅ Múltiplo, independente e quente                           |
| **Instantâneos**              | Limitado/manual | ✅ Rápido, automático, consistente                           |
| **Provisionamento fino**      | ❌               | ✅ (zFS, BTRFS, LVMthain, Cepph)                             |
| **Cotas**                     | ❌               | ✅                                                           |
| **Redimensionar**             | Manual          | ✅                                                           |
| **Armazenamento remoto**      | ❌               | ✅ (Ceph, NFS, SMB)                                          |
| **Volumes personalizados**    | ❌               | ✅                                                           |
| **Cluster pronto**            | ❌               | ✅                                                           |
| **Empresa**                   | No              | Sim — HA, backup, migração, segurança, pronto para produção |

##### 🌐 LXC vs LXD - Suporte de rede (resumo)

| Recurso                  | **LXC**                          | **LXD**                                                                     |
| ------------------------ | -------------------------------- | --------------------------------------------------------------------------- |
| **Tipos de rede**        | ponte, veth, macvlan, phys, vlan | ponte, ovn, macvlan, sriov, físico, vlan, ventilador, túneis                |
| **Redes gerenciadas**    | ❌ manual (configuração do host)  | ✅ Gerenciado nativamente via API/CLI, fácil de criar e editar               |
| **API de rede**          | ❌ Comandos da CLI SOMENTE        | ✅ API REST, CLI, integração com ferramentas externas                        |
| **Suporte de ponte**     | ✅ Manual                         | ✅ Automático e avançado (L2, Open VSwitch, Bridge nativo)                   |
| **Nat & dhcp**           | ❌ Manual (iptables/dnsmasq)      | ✅ NAT integrado, DHCP, DNS, configurável por rede                           |
| **DNS**                  | ❌ Manual                         | ✅ DNS integrado, domínios personalizados, integração resolvida pelo sistema |
| **IPVSH**                | ✅ (manual, limitado)             | ✅ Suporte completo, automático, DHCPv6, NAT6, roteamento                    |
| **VLAN**                 | ✅ (manual, anfitrião)            | ✅ VLANs nativas, configuração fácil                                         |
| **SR-IOV**               | ❌                                | ✅ Suporte nativo                                                            |
| **ACLs de rede**         | ❌                                | ✅ ACLs, atacantes, zonas, pares, regras de firewall                         |
| **Clustering**           | ❌                                | ✅ Redes replicadas e gerenciadas em clusters                                |
| **Anexar/Desanexar**     | Manual (anfitrião)               | ✅ CLI/API, hotplug, fácil para contêineres/VMs                              |
| **Segurança**            | Manual (anfitrião)               | ✅ Isolamento, firewall, LCA, integração de firewalld, regras por rede       |
| **Rotas personalizadas** | Manual                           | ✅ Suporte a rotas personalizadas, vários gateways                           |
| **Perfis de rede**       | ❌                                | ✅ Perfis de rede reutilizáveis                                              |
| **Monitoramento**        | Manual                           | ✅ Status, ipam, logs, informações detalhadas via CLI/API                    |
| **Empresa**              | No                               | Sim: multilocatário, ACL, clustering, integração na nuvem                   |

##### 📊 Tabela final de comparação de redes

|                   | **LXC**           | **Lxd**                                                      |
| ----------------- | ----------------- | ------------------------------------------------------------ |
| **Tipos de rede** | ponte, veth, vlan | ponte, ovn, macvlan, sriov, físico, vlan, ventilador, túneis |
| **Gerenciou**     | ❌                 | ✅                                                            |
| **Nat/DHCP/DNS**  | Manual            | ✅ Integrado                                                  |
| **VLAN**          | Manual            | ✅                                                            |
| **SR-Iov**        | ❌                 | ✅                                                            |
| **API**           | ❌                 | ✅                                                            |
| **Clustering**    | ❌                 | ✅                                                            |
| **Segurança/ACL** | Manual            | ✅                                                            |
| **Perfis**        | ❌                 | ✅                                                            |
| **Empresa**       | No                | Sim                                                          |

##### 🧪 LAB LXD

Para o laboratório LXD, você pode usar este script:[lxd.sh](scripts/container/lxd.sh)

#### 🛠️ 352,2 comandos importantes

##### 📦 LXC

```sh

# lxc configuration
/etc/default/lxc
/etc/default/lxc-net
/etc/lxc/default.conf
/usr/share/lxc/

# lxc container configuration
/var/lib/lxc/

# check lxc version
lxc-create --version

# list containers
sudo lxc-ls --fancy
sudo lxc-ls -f

# create a priveleged container
sudo lxc-create -n busybox -t busybox

# create a priveleged container with template
sudo lxc-create -n debian01 -t download
sudo lxc-create --name server2 --template download -- --dist alpine --release 3.19 --arch amd64

# get container info
sudo lxc-info -n debian01

# get container PID
sudo lxc-info -n debian01 -pH

# get container config
sudo lxc-checkconfig -n debian01

# start container
sudo lxc-start -n debian01

# stop container
sudo lxc-stop -n debian01

# connect to container
sudo lxc-attach -n debian01

# execute a command in container
sudo lxc-attach -n debian01 --  echo "Hello from"
sudo lxc-attach -n debian01 -- bash -c ls

# delete container
sudo lxc-destroy -n debian01

# delete container and snapshot
sudo lxc-destroy -n -s debian01

# rootfs of a container
sudo ls -l /var/lib/lxc/server1/rootfs

# modify rootfs of a container
sudo touch  /var/lib/lxc/server1/rootfs/tmp/test_roofs_file
sudo lxc-attach server1
ls /tmp

# get lxc namespaces
sudo lsns -p <LXC_container_PID>
sudo lsns -p $(sudo lxc-info server2 -pH)
sudo lsns -p $(sudo lxc-info -n server1 | awk '/PID:/ { print $2 }')

# unprivileged container namespaces
lsns -p $(lxc-info -n ubuntu | awk '/PID:/ { print $2 }')

# get container resource 
sudo lxc-top

# create a container snapshot
sudo lxc-stop -k -n debian01
sudo lxc-snapshot -n debian01

# list snapshots
sudo lxc-snapshot -n debian01 -L

# restore snapshot
sudo lxc-stop -n debian01
sudo lxc-snapshot -n debian01 -r snap0

# delete snapshot
sudo lxc-snapshot -n debian01 -d snap0

# create a new container with snapshot
sudo lxc-snapshot -n debian01 -r snap0 -N debian02

# create container checkpoint (privileged container)
sudo lxc-checkpoint -n debian01 -s -D /home/vagrant/.config/lxc/checkpoints/debian01-checkpoint01.file 

# define memory container limits with cgroups
sudo lxc-cgroup -n debian01 memory.max 262144000 #(250 MB × 1.048.576 bytes = 262144000 bytes)

# define CPU cores of container  with cgroups
sudo lxc-cgroup -n debian01 cpuset.cpus 0-2

# get container cgroup limits
sudo cgget -g :lxc.payload.debian01 -a |grep memory.max
sudo cgget -g :lxc.payload.debian01 -a |grep cpuset

# set container cgroup vcpus range in file
sudo vim /var/lib/lxc/debian01/config
# add the following lines
lxc.cgroup2.cpuset.cpus = "5-6"

######## create unprivileged container #######

## create directory for unprivileged container
mkdir -p /home/vagrant/.config/lxc

## copy default config
cp /etc/lxc/default.conf /home/vagrant/.config/lxc/

## get subordinate user and group IDs
cat /etc/subuid

## configure subordinate user and group IDs
vim /home/vagrant/.config/lxc/default.conf

## add the following lines
lxc.idmap = u 0 100000 65536
lxc.idmap = g 0 100000 65536

## configure lxc-usernet
sudo vim /etc/lxc/lxc-usernet

## add the following line
vagrant veth lxcbr0 10

## create unprivileged container
lxc-create -n unprivileged -t download -- -d ubuntu -r jammy -a amd64

## set permissions for unprivileged container
sudo setfacl -m u:100000:--x /home/vagrant
sudo setfacl -m u:100000:--x /home/vagrant/.config
sudo setfacl -m u:100000:--x /home/vagrant/.local
sudo setfacl -m u:100000:--x /home/vagrant/.local/share

## start unprivileged container
lxc-start -n unprivileged --logpriority=DEBUG --logfile=lxc.log

## check container status
lxc-ls -f

## unprivileged container files
ls .local/share/lxc/unprivileged/
```

##### 🌐 LXD

```sh
# lxd configuration files
/var/lib/lxd
/var/log/lxd

# initialize lxd
sudo lxd init
sudo lxd init --auto
sudo cat lxd-init.yaml | lxd init --preseed

# check lxd version
sudo lxd --version

# check lxd status
systemctl status lxd

#### LXD STORAGE MANAGEMENT ####

# lxd list storage
lxc storage list

# show lxd storage pools
lxc storage show default

# lxd storage info
lxc storage info default

# create a new storage pool dir
lxc storage create lpic3-dir dir 

# create a new storage pool lvm
lxc storage create lpic3-lvm lvm source=/dev/sdb1

# create a new storage pool btrfs
lxc storage create lpic3-btrfs btrfs
lxc storage create lpic3-btrfs btrfs size=10GB
lxc storage create lpic3-btrfs btrfs source=/dev/sdb2

# create a new storage pool zfs
lxc storage create lpic3-zfs zfs source=/dev/sdb3

# delete storage pool
lxc storage delete lpic3-btrfs

# edit storage pool
lxc storage edit lpic3-btrfs

# get storage pool properties
lxc storage  get lpic3-btrfs size

# set storage pool properties
lxc storage set lpic3-btrfs size 20GB

# list storage volumes
lxc storage volume list lpic3-btrfs

# create a new storage volume
lxc storage volume create lpic3-btrfs vol-lpic3-btrfs

# delete storage volume
lxc storage volume delete lpic3-btrfs vol-lpic3-btrfs

### Management lxd storage buckets ####

# create lxd bucket
lxc storage bucket create lpic3-btrfs bucket-lpic3-btrfs
lxc storage bucket create lpic3-zfs bucket-lpic3-zfs

# list lxd buckets
lxc storage bucket list lpic3-btrfs

# set lxd bucket properties
lxc storage bucket set lpic3-btrfs bucket-lpic3-btrfs size 10GB

# edit lxd bucket 
lxc storage bucket edit lpic3-btrfs bucket-lpic3-btrfs

# delete lxd bucket
lxc storage bucket delete lpic3-btrfs bucket-lpic3-btrfs

# show ldx storage bucket
lxc storage bucket show lpic3-btrfs bucket-lpic3-btrfs

# create storage bucket keys
lxc storage bucket key create lpic3-btrfs bucket-lpic3-btrfs key-bucket-lpic3-btrfs

# edit storage bucket keys
lxc storage bucket key edit lpic3-btrfs bucket-lpic3-btrfs key-bucket-lpic3-btrfs

# list storage bucket keys
lxc storage bucket key list lpic3-btrfs bucket-lpic3-btrfs

# show storage bucket keys
lxc storage bucket key show lpic3-btrfs bucket-lpic3-btrfs key-bucket-lpic3-btrfs

# delete storage bucket keys
lxc storage bucket key delete lpic3-btrfs bucket-lpic3-btrfs key-bucket-lpic3-btrfs

### LXD IMAGE MANAGEMENT ###

# list lxd repositories
lxc remote list

# add lxd remote repository
lxc remote add lpic3-images https://images.lxd.canonical.com --protocol=simplestreams

# remove lxd remote repository
lxc remote remove lpic3-images 

# list lxd images
lxc image list

# list lxd images from remote repository
lxc image list images:
lxc image list images: os=Ubuntu
lxc image list images: os=Ubuntu release=jammy
lxc image list images: os=Ubuntu release=jammy architecture=amd64
lxc image list images: architecture=amd64 type=container
lxc image list images: d kal

# download lxd image to local
lxc image copy images:centos/9-Stream local: --alias centos-9

# export lxd remote image
lxc image export aed8a3749942  ./lxd-images/centos-9

# export lxd remote image
lxc image export images:f8fadb0d1b28 ./lxd-images/alma-9

# remove lxd image
lxc image delete centos-9

# mount lxd rootfs
mkdir -p /mnt/lxd-rootfs/centos-9
sudo mount lxd-images/centos-9/aed8a374994230243aaa82e979ac7d23f379e511556d35af051b1638662d47ae.squashfs  /mnt/lxd-rootfs/centos-9/
ls /mnt/lxd-rootfs/centos-9/

### LXD INSTANCES MANAGEMENT ###

# create a new container from image
lxc launch images:ubuntu/jammy ubuntu-lxd
lxc launch images:debian/12 debian12lxc
lxc launch images:fedora/41 fedora41
lxc launch images:opensuse/15.6 opensuse15

# create a new container from image with storage pool
lxc launch images:alpine/3.19 alpine --storage lpic3-lvm
lxc launch images:kali kali --storage lpic3-zfs

# create a new container from image local
lxc launch 757b2a721e9d kali-local-image

# create new vm
lxc launch --vm  images:debian/13 debian13 --storage lpic3-zfs
lxc launch --vm  images:e44d713a71b6 rocky9 --storage lpic3-btrfs

# list container\instances
lxc list

# stop container\instance
lxc stop alpine

# start container\instance
lxc start alpine

# delete container\instance
lxc delete alpine --force

# show container\instance
lxc info alpine

# show container\instance config
lxc config show alpine

# edit container\instance config
lxc config edit alpine

# view container\instance config
lxc config get alpine boot.autostart

# set container\instance config
lxc config set alpine boot.autostart=false

# set limit for container\instance
lxc config set alpine limits.cpu 2
lxc config set alpine limits.memory 10%

# unset limit for container\instance
lxc config unset alpine limits.cpu  
lxc config unset alpine limits.memory

# execute command in container\instance
lxc --exec alpine -- /bin/bash
lxc exec alpine -- uname -a || dhclient
lxc exec alpine -- sh -c "echo 'Hello from Alpine'"

# lxd copy file to container\instance
lxc file push /etc/hosts alpine/etc/hosts

# lxd edit file in container\instance
lxc file edit alpine/etc/hosts

# download file from container\instance
lxc file pull alpine/etc/hosts /tmp/alpine-hosts

### LXD NETWORK MANAGEMENT ###

# list networks
lxc network list

# show network details
lxc network show lxdbr0

# create a new network
lxc network create lxdbr1

# delete a network
lxc network delete lxdbr0

# show network details
lxc network show lxdbr0

# set ipv4.dhcp.ranges
lxc network set lxdbr0 ipv4.dhcp.ranges=10.119.220.100-10.119.220.200

# attach a network to a container
lxc network attach lxdbr0 alpine

# detach a network from a container
lxc network detach lxdbr0 alpine

### LXD SNAPSHOT MANAGEMENT ###

# snapshot files
/var/lib/lxd/snapshots/
/var/snap/lxd/common/lxd/snapshots

# create a snapshot
lxc snapshot debian12

# create a snapshot
lxc snapshot debian12 nome-snapshot

# restore a snapshot
lxc restore debian12 nome-snapshot

# delete a snapshot
lxc delete debian12/snap0

# show snapshot info
lxc info debian12

# copy a snapshot
lxc copy debian12/snap0 debian12-2

### LXD PROFILES MANAGEMENT ###

# list profiles
lxc profile list

# show profile details
lxc profile show default

# copy profile
lxc profile copy default production

# edit profile
lxc profile edit production

#set environment variables
lxc profile set production environment.EDITOR vim

# unset memory limit
lxc profile unset production limits.memory

# set boot autostart
lxc profile set production boot.autostart true

# add profile to container
lxc profile add debian12 production

# remove profile from container
lxc profile remove debian12 production

# launch container with profile
lxc launch 1u1u1u1u1u1 rockylinux9-2 -p production
```

<p align="right">(<a href="#topic-352.2">back to sub topic 352.2</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.3"></a>

### 🐳 352,3 Docker

![docker-architecture](images/docker.png)

![docker-runtime](images/docker-containerd.png)

**Peso:**9

**Descrição:**O candidato deve ser capaz de gerenciar nós Docker e contêineres Docker. Isso inclui compreender a arquitetura do Docker, bem como compreender como o Docker interage com o sistema Linux do nó.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura e componentes do Docker
-   Gerencie os contêineres do Docker usando imagens de um registro do Docker
-   Compreenda e gerencie imagens e volumes para contêineres Docker
-   Entenda e gerencie o log para recipientes do docker
-   Compreenda e gerencie redes para Docker
-   Use Dockerfiles para criar imagens de contêiner
-   Execute um registro Docker usando a imagem Docker do registro

#### 📋 352.3 Objetos citados

```sh
dockerd
/etc/docker/daemon.json
/var/lib/docker/
docker
Dockerfile
```

#### 📖 Definição

Docker é um**plataforma de contêiner de código aberto**que permite aos desenvolvedores e operadores empacotar aplicativos e suas dependências em**recipientes**.

Esses contêineres garantem**consistência entre ambientes**, acelerar implantações e reduzir a complexidade da infraestrutura.

* * *

#### 🔑 Conceitos -chave

-   📦**recipiente**→ Tempo de execução leve e isolado, compartilhando o kernel do host.
-   🖼️**Imagem**→ Modelo somente leitura contendo o aplicativo e dependências.
-   ⚙️**Motor Docker (dockerd)**→ Daemon Gerenciando recipientes, imagens e volumes.
-   ⌨️**Docker cli**→ Ferramenta de linha de comando (`docker`) comunicando-se com o daemon.
-   ☁️**Docker Hub**→ Registro padrão para armazenar e distribuir imagens.

* * *

#### 🚀 Vantagens

-   ⚡**Leve e rápido**→ Muito mais rápido que máquinas virtuais.
-   🌍**Portabilidade**→ Executa em qualquer lugar Docker é suportado.
-   🛠️**Rico ecossistema**→ Compor, enxame, cubo, interface do usuário da área de trabalho, registros.
-   🔄**DevOps amigável**→ Integração de IC/CD e alinhamento IAC.

* * *

#### 📑 Registos do Docker

-   ☁️**DockerHub**→ Padrão, registro público.
-   🏢**Registros privados**→ Harbor, Artifactory, Registro de Container Github.
-   🔒 Uso`docker login`para autenticar, enviar e extrair imagens.

* * *

#### Imagens do Docker

![docker-images](images/docker-images.png)

-   Conceito: pacote imutável com aplicativo, dependências e metadados.
-   Camadas e cache: cada instrução Dockerfile se torna uma camada reutilizável
-   Constrói e extrai camadas de compartilhamento.
-   SABER:`registry/namespace/repo:tag`(por exemplo,`docker.io/library/nginx:1.27`).
-   Digerir: usar`@sha256:...`para fixar o conteúdo exato (bom para produção).
-   Imagem vs Container: A imagem é somente leitura; O contêiner é uma instância com uma camada de gravação efêmero.
-   Comandos básicos:`docker image ls`,`docker pull`,`docker run`,`docker inspect`,`docker history`,`docker tag`,`docker push`,`docker rmi`,`docker image prune -a`,`docker save`/`docker load`.
-   Melhores práticas: base mínima (alpina/distrolisa), compilações em vários estágios, versões/tags de pinos, executadas como não raiz`USER`.

##### Camadas de imagem Docker

Neste exemplo, demonstro uma camada de imagem do Docker.

Na primeira imagem temos uma imagem base alpina e adicionamos uma camada.

```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN apk add --no-cache bash
```

A segunda imagem que tenho uma imagem My-Base: 1.0 e adicione duas camadas, gerando uma nova imagem com nome ACME/MY-FINAL-AGEM: 1.0.

```dockerfile
# syntax=docker/dockerfile:1
FROM acme/my-base-image:1.0
COPY . /app
RUN chmod +x /app/hello.sh
CMD /app/hello.sh
```

![docker-image-layers](images/docker-image-layers.png)

##### Docker Image cópia-on-write (vaca)

Neste exemplo, eu demonstro uma imagem do docker cópia-em-escritura (vaca).

Crie 5 recipientes da mesma imagem.

```sh
docker run -dit --name my_container_1 acme/my-final-image:1.0 bash \
  && docker run -dit --name my_container_2 acme/my-final-image:1.0 bash \
  && docker run -dit --name my_container_3 acme/my-final-image:1.0 bash \
  && docker run -dit --name my_container_4 acme/my-final-image:1.0 bash \
  && docker run -dit --name my_container_5 acme/my-final-image:1.0 bash
```

Veja o tamanho dos contêineres.

```sh
docker ps --size --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Size}}"
```

Para demonstrar isso, execute o seguinte comando para escrever a palavra 'hello' em um arquivo na camada gravável do contêiner nos contêineres my_container_1, my_container_2 e my_container_3:

```sh
for i in {1..3}; do docker exec my_container_$i sh -c 'printf hello > /out.txt'; done
```

Verifique o tamanho dos contêineres novamente.

```sh
docker ps --size --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Size}}"
```

![docker-image-cow](images/docker-image-cow.png)

##### 🐳 Instruções e camadas de imagem do Dockerfile

**📊 Tabela: Instrução vs. Geração de camadas**

| Instrução     | Cria uma camada de sistema de arquivos? | Notas                                                                                                         |
| ------------- | --------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `FROM`        | ❌ No                                    | Define a imagem base; camadas subjacentes vêm dele.                                                           |
| `RUN`         | ✅ Sim                                   | Executa alterações no sistema de arquivos; adiciona conteúdo que persiste.                                    |
| `COPY`        | ✅ Sim                                   | Adiciona arquivos do contexto de construção ao sistema de arquivos de imagem.                                 |
| `ADD`         | ✅ Sim                                   | Semelhante ao COPY, com recursos adicionais (URLs, extração de alcatrão).                                     |
| `LABEL`       | ❌ No                                    | Adiciona apenas metadados; não altera o conteúdo do sistema de arquivos.                                      |
| `ENV`         | ❌ No                                    | Define variáveis ​​de ambiente; armazenado como metadados.                                                    |
| `ARG`         | ❌ No                                    | Somente em tempo de construção; não afeta a imagem final, a menos que seja usado posteriormente.              |
| `WORKDIR`     | ❌ No                                    | Diretório de trabalho de alterações; Apenas metadados.                                                        |
| `USER`        | ❌ No                                    | Define o usuário; apenas metadados.                                                                           |
| `EXPOSE`      | ❌ No                                    | Declara portos expostos; Apenas metadados.                                                                    |
| `ENTRYPOINT`  | ❌ No                                    | Define como o contêiner inicia; Configuração de metadados.                                                    |
| `CMD`         | ❌ No                                    | Comando ou argumentos padrão; apenas metadados.                                                               |
| `VOLUME`      | ✅ Sim / parcial                         | Declara pontos de montagem; metadados + volumes em tempo de execução; tem implicações no sistema de arquivos. |
| `HEALTHCHECK` | ❌ No                                    | Define a configuração da verificação de integridade; armazenados como metadados.                              |
| `STOPSIGNAL`  | ❌ No                                    | Define sinal para parar o container; apenas metadados.                                                        |
| `SHELL`       | ❌ No                                    | Muda o shell para mais tarde`RUN`; apenas metadados.                                                          |
| `ONBUILD`     | ❌ No                                    | Gatilhos para compilações futuras; apenas metadados.                                                          |

**🔎 Principais insights**

-   A maioria das instruções do Dockerfile**Crie uma nova camada de imagem**- até mesmo alterações de metadados (`CMD`,`EXPOSE`, etc.) são armazenados como parte da configuração final da imagem.
-   **Camadas pesadas**vêm de instruções que**modifique o sistema de arquivos**(`RUN`,`COPY`,`ADD`).
-   **Camadas leves/metadados**vêm de instruções como`ENV`,`CMD`,`LABEL`.
-   **`ARG`é especial**: Existe apenas no tempo de construção e é descartado na imagem final, a menos que seja usado em outras instruções.
-   Para minimizar o tamanho da imagem:
    -   Combine vários`RUN`comanda em um.
    -   Usar`.dockerignore`Para evitar copiar arquivos desnecessários.
    -   Encomende instruções para maximizar o Docker**construir eficiência de cache**.

* * *

#### 🐳 Dockerfile

##### 🔎 O que é um Dockerfile?

UM**Dockerfile**é um**arquivo de texto declarativo**que contém uma sequência de**construir instruções**para construir uma imagem Docker.

Cada instrução especifica como configurar a imagem: qual base usar, quais arquivos copiar, quais comandos executar, qual ambiente definir e como o contêiner resultante deve se comportar em tempo de execução.

É essencialmente o**receita**para construir imagens de contêiner imutáveis ​​e reproduzíveis.

🧩 Características -chave

-   **Declarativo**: Em vez de executar etapas manuais, você declara o estado desejado da imagem.
-   **Em camadas**: Cada instrução pode produzir uma camada de imagem, que permite armazenamento em cache, reutilização e distribuição eficiente.
-   **Portátil**: Dockerfiles garantem consistência entre ambientes (desenvolvimento, estadiamento, produção).
-   **Composível**: Com compilações em vários estágios, você pode encadear múltiplos`FROM`Declarações a otimizar para imagens menores e prontas para a produção.

##### 🛠️ Instruções centrais

Algumas das instruções mais comuns incluem:

-   `FROM`: Especifica a imagem base.
-   `RUN`: Executa comandos para instalar ou configurar o software.
-   `COPY`/`ADD`: move arquivos do contexto de construção para a imagem.
-   `ENV`,`WORKDIR`,`USER`: Define variáveis ​​de ambiente, diretórios e contexto de execução.
-   `CMD`/`ENTRYPOINT`: Define comandos ou processos padrão quando o contêiner iniciar.
-   `EXPOSE`,`VOLUME`,`HEALTHCHECK`: Configurar redes, armazenamento persistente e monitoramento.

##### 🚀 Por que é importante

-   **Reprodutibilidade**: Mesmo Dockerfile → mesma imagem → mesmo comportamento em todos os lugares.
-   **Automação**: permite que pipelines de CI/CD criem, testem e implantem contêineres automaticamente.
-   **Otimização**: Dockerfiles adequadamente estruturados minimizam o tamanho da imagem e aceleram as compilações.
-   **Conformidade**: imagens padronizadas com Dockerfiles fixos simplificam auditoria, aplicação de patches e governança.

✅ Resumindo:

UM**Dockerfile**é o**Blueprint**Para imagens do Docker - a base da entrega de aplicativos em contêiner.

**Exemplo de Dockerfile**

```dockerfile
# syntax=docker/dockerfile:1
FROM nginx:latest
COPY ./html /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

* * *

#### 🧩 Docker Compor

##### 📘 Referência do comando Docker Compose

Docker Compose é uma ferramenta para definir e gerenciar aplicativos Docker de vários contêineres usando um arquivo YAML (`docker-compose.yml`).

Abaixo segue uma tabela estruturada dos principais comandos e suas finalidades.

**📊 Tabela: Comandos Docker Compose**

| Comando                         | Propósito                                                                              | Exemplo                                                                  |
| ------------------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| ▶️**`docker compose up`**       | Construir, (re)criar, iniciar e anexar a contêineres definidos em`docker-compose.yml`. | `docker compose up -d`                                                   |
| ⏹️**`docker compose down`**     | Pare e remova recipientes, redes, volumes e imagens criadas por`up`.                   | `docker compose down --volumes`                                          |
| 🔄**`docker compose restart`**  | Reinicie os serviços de corrida.                                                       | `docker compose restart web`                                             |
| 🟢**`docker compose start`**    | Inicie contêineres existentes sem recriá-los.                                          | `docker compose start db`                                                |
| 🔴**`docker compose stop`**     | Pare de executar recipientes sem removê -los.                                          | `docker compose stop db`                                                 |
| 🧹**`docker compose rm`**       | Remova os contêineres de serviço parado.                                               | `docker compose rm -f`                                                   |
| 🏗️**`docker compose build`**   | Crie ou recrie imagens de serviço.                                                     | `docker compose build web`                                               |
| 📥**`docker compose pull`**     | Puxe imagens de serviço de um registro.                                                | `docker compose pull redis`                                              |
| 📤**`docker compose push`**     | Empurre imagens de serviço para um registro.                                           | `docker compose push api`                                                |
| 📄**`docker compose config`**   | Validar e visualizar o arquivo de composição.                                          | `docker compose config`                                                  |
| 📋**`docker compose ps`**       | Contêineres de lista gerenciados pela composição.                                      | `docker compose ps`                                                      |
| 📊**`docker compose top`**      | Exibir processos em execução de contêineres.                                           | `docker compose top`                                                     |
| 📜**`docker compose logs`**     | Visualize logs de saída de serviços.                                                   | `docker compose logs -f api`                                             |
| 🔍**`docker compose exec`**     | Execute um comando em um contêiner de serviço em execução.                             | `docker compose exec db psql -U postgres`                                |
| 🐚**`docker compose run`**      | Execute comandos únicos em um novo contêiner.                                          | `docker compose run web sh`                                              |
| 🔧**`docker compose override`** | Usar`-f`Para especificar vários arquivos de composição (substituídos).                 | `docker compose -f docker-compose.yml -f docker-compose.override.yml up` |
| 🌐**Rede**                      | As redes são criadas automaticamente; pode ser declarado explicitamente em Yaml.       | `docker network ls`                                                      |
| 📦**Volumes**                   | Gerenciar dados persistentes; pode ser declarado em YAML e usado em vários serviços.   | `docker volume ls`                                                       |

##### 🔑 Notas -chave

-   **`up`vs.`start`**:`up`constrói/recria contêineres,`start`apenas executa os existentes.
-   **`run`vs.`exec`**:`run`Lança a_novo_recipiente,`exec`corre dentro de um existente.
-   **Validação de configuração**: Sempre corra`docker compose config`para verificar se há erros de sintaxe.
-   **Modo de desconexão**: Usar`-d`para executar serviços em segundo plano.

##### **📄`docker-compose.yml`**

```yaml
version: "3.9"  # Compose file format

services:
  web:
    image: nginx:latest
    container_name: my-nginx
    ports:
      - "8080:80"             # host:container
    volumes:
      - ./html:/usr/share/nginx/html:ro
    networks:
      - app-network

  api:
    build:
      context: ./api          # build from Dockerfile in ./api
      dockerfile: Dockerfile
    container_name: my-api
    environment:
      - NODE_ENV=production
      - API_KEY=${API_KEY}    # read from .env file
    depends_on:
      - db
    ports:
      - "3000:3000"
    networks:
      - app-network

  db:
    image: postgres:15
    container_name: my-postgres
    restart: always
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: secret
      POSTGRES_DB: appdb
    volumes:
      - db-data:/var/lib/postgresql/data
    networks:
      - app-network

volumes:
  db-data:

networks:
  app-network:
    driver: bridge

```

**🔎 Explicação**

-   **`services`**: Define contêineres (`web`,`api`,`db`) que compõem o aplicativo.
-   **`ports`**: Mapas portas host para portas de contêiner (`8080:80`).
-   **`volumes`**:
-   Volume nomeado (`db-data`) para dados persistentes de banco de dados.
-   Montagem de ligação (`./html:/usr/share/nginx/html`) para veicular conteúdo estático.
-   **`build`**: permite construir uma imagem personalizada a partir de um Dockerfile.
-   **`depends_on`**: Garante a ordem de inicialização do serviço (`api`espera por`db`).
-   **`networks`**: Define uma rede virtual isolada para comunicação.

**🚀 Uso**

Iniciar no modo destacado

```sh
docker compose up -d
docker compose logs -f api
docker compose down -v
```

#### Arquitetura Docker + containerd + shim + runc

![Docker shim architecture example](images/docker-shim.png)

##### 🔹 Componentes principais

-   **Docker CLI / Docker Daemon (`dockerd`)**

    O`docker`O comando se comunica com o daemon do Docker, que orquestra ciclo de vida do contêiner, imagens, redes e volumes.
-   **contêiner**

    Um tempo de execução de contêiner de alto nível que gerencia todo o ciclo de vida do contêiner: extração de imagens, gerenciamento de armazenamento, rede e execução.
-   **contêiner-shim**

    -   Atua como o_processo pai_de cada recipiente uma vez`runc`fez seu trabalho.
    -   Mantém**stdin/stdout/stderr**fluxos abertos, mesmo que o Docker ou o contêiner reinicie (então`docker logs`/`kubectl logs`ainda funciona).
    -   Coleta o código de saída do contêiner e o relata de volta ao gerente.
    -   Impede que os contêineres se tornem órfãos se o daemon falhar ou for reiniciado.
-   **Runc**

    Um tempo de execução de baixo nível (compatível com OCI) que cria contêineres usando namespaces e cgroups Linux.

    Depois de lançar o contêiner,`runc`sai e`containerd-shim`assume o controle como o processo pai.

* * *

##### 🔹 Fluxo de execução

1.  **Usuário**corre`docker run ...`→ O**Docker Daemon**é chamado.
2.  **Daemon Docker**delegados para**contêiner**.
3.  **contêiner**Spawns**Runc**, que configura o contêiner.
4.  Depois que o contêiner é iniciado,**Saídas Runc**.
5.  **contêiner-shim**permanece como o**processo pai do contêiner**, manuseando códigos de registro e saída.

* * *

##### 🔹 Benefícios da camada de calço

-   **Resiliência**→ Os contêineres continuam funcionando mesmo se`dockerd`ou`containerd`travar ou reiniciar.
-   **Log**→ mantém fluxos de log de contêineres para`docker logs`ou`kubectl logs`.
-   **Isolamento**→ Cada contêiner tem seu próprio calço, simplificando o gerenciamento do ciclo de vida.
-   **Conformidade com padrões**→ trabalha com o**Especificação de tempo de execução do OCI**, garantindo compatibilidade.

#### ⚖️ Docker vs. Containerd

| 🔹 Recurso/Componente | 🐳 Docker (Dockerd)                                  | 🐋 Containerd                                         |
| --------------------- | ---------------------------------------------------- | ----------------------------------------------------- |
| Escopo                | Plataforma completa (build, CLI, UI, Hub)            | Somente ambiente de execução do contêiner principal   |
| API                   | API Docker de alto nível                             | API CRI/tempo de execução de baixo nível              |
| Construído sobre      | Usa containerd internamente                          | Tempo de execução independente                        |
| Características       | Construir, compor, enxame, hub, desktop              | Ciclo de vida da imagem, puxar/run, tempo de execução |
| Casos de uso          | Fluxos de trabalho de desenvolvimento, testes locais | Kubernetes, tempos de execução de produção            |
| Pegada                | Mais pesado e com mais ferramentas                   | Leve, eficiente                                       |
| Ecossistema           | Ferramentas de desenvolvedor ricas                   | Projeto CNCF, padrão do Kubernetes                    |

#### Armazenamento do Docker

##### 🧱 Conceitos principais

| 🔍 Foco       | Detalhes                                                                                                                                                                                               |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| União FS      | Camadas de imagem somente leitura + camada gravável do contêiner formam um sistema de arquivos de união; remover o contêiner elimina alterações efêmeras.                                              |
| Raiz de dados | Os drivers de armazenamento persistem os dados em`/var/lib/docker/<driver>/`; Inspecione o driver ativo via`docker info --format "{{.Driver}}"`.                                                       |
| Persistência  | Mover dados com estado**volumes**(persistente),**vincular montagens**(caminho do host) ou**montagens tmpfs**(na memória, efêmero) para sobreviver à recreação de contêineres ou otimizar o desempenho. |

##### Drivers Drivers de armazenamento

| Motorista                      | Quando usar                                         | Notas                                                                              |
| ------------------------------ | --------------------------------------------------- | ---------------------------------------------------------------------------------- |
| Sobreposição2                  | Padrão nos modernos kernels linux.                  | Cópia rápida em gravação; O sistema de arquivos de apoio deve suportar`d_type`.    |
| fusível-overlayfs              | Implantações sem raiz ou namespace.                 | Adiciona uma fina camada FUSE; permite fluxos de trabalho não raiz.                |
| btrfs/zfs                      | Precisa de instantâneos nativos, cotas, compressão. | Forneça pools dedicados e use ferramentas de plataforma para gerenciamento.        |
| Devicemapper (LVM direto) / ON | Somente configurações legadas.                      | Modo de manutenção; Planeje as migrações para a sobreposição2.                     |
| filtro de janelas              | Imagens de contêiner do Windows.                    | Use LCOW/WSL 2 para expor overlay2 para cargas de trabalho Linux em hosts Windows. |

##### 🧭 Selecionando o driver

-   Confirme os módulos do kernel (`modprobe overlay`) e pré-requisitos do sistema de arquivos antes de trocar de driver.
-   Combine os recursos do driver com as cargas de trabalho: muitas camadas pequenas favorecem`overlay2`; instantâneos em nível de sistema de arquivos podem justificar`btrfs`ou`zfs`.
-   Atenha-se aos padrões do provedor no Docker Desktop, EKS, GKE, etc., para permanecer dentro dos limites de suporte.
-   Manter`/var/lib/docker`Em armazenamento confiável e de baixa latência-os drivers de cópia em gravação amplificam discos lentos.

Para testar os drivers de volume, use o script:[docker-storage-driver.sh](scripts/docker/docker-storage-driver.sh).

##### 📦 Tipos de armazenamento Docker

**Volumes:**

-   Gerenciado por Docker, localizado fora da camada gravável do contêiner (`/var/lib/docker/volumes`).
-   Persistir após a remoção do contêiner, pode ser compartilhado entre contêineres.
-   Usado para dados que devem sobreviver ao ciclo de vida do contêiner.
-   Exemplos:
    -   Criar volume:`docker volume create data`
    -   Use volume:`docker run -v data:/app/data ...`

**Montagens de ligação:**

-   Monte um diretório/arquivo host diretamente no contêiner.
-   Útil para desenvolvimento, sincronização de código ou acesso a dados de host existentes.
-   Menos portátil (caminhos absolutos, permissões de host).
-   Exemplos:
    -   `docker run -v /home/user/app:/app ...`
    -   `docker run --mount type=bind,source=/data,target=/app/data ...`

**TMPFs suportes:**

-   A montagem na memória (RAM) não persiste após a parada ou reinicialização do contêiner.
-   Ideal para dados temporários, caches ou informações confidenciais.
-   Nada é gravado no disco, desempenho máximo.
-   Exemplos:
    -   `docker run --mount type=tmpfs,target=/tmp/cache ...`
    -   `docker run --tmpfs /tmp/cache ...`

**Resumo rápido:**

| Tipo              | Persistência | Localização | Portabilidade | Uso típico                            |
| ----------------- | ------------ | ----------- | ------------- | ------------------------------------- |
| Volume            | Sim          | Docker      | Alto          | Dados de aplicativos, bancos de dados |
| Vincular montagem | Opcional     | Hospedar    | Baixo         | Dev, integração                       |
| Tmpfs             | No           | BATER       | Alto          | Cache, efêmero                        |

##### 🛠️ Exemplos de uso

```sh
# Persistent volume
docker run -d --name pg -v pgdata:/var/lib/postgresql/data postgres:16

# Bind mount
docker run -d -v /home/user/html:/usr/share/nginx/html nginx:latest

# Tmpfs mount
docker run -d --mount type=tmpfs,target=/tmp nginx:latest
docker run -d --tmpfs /tmp nginx:latest
```

##### ✅ Melhores práticas

-   Prefira volumes para dados persistentes e de backup.
-   Use tmpfs para dados confidenciais ou temporários.
-   Documente volumes e montagens em arquivos de composição/pilha.
-   Monitore o uso do disco com`docker system df`e limpar volumes órfãos.
-   Sempre verifique o[documentação oficial do Docker Storage](https://docs.docker.com/storage/)e[drivers de armazenamento](https://docs.docker.com/storage/storagedriver/select-storage-driver/).

Para testar os volumes de armazenamento, use o script:[docker-storage-volumes.sh](scripts/docker/docker-storage-volumes.sh).

#### 🛠️ 352,3 comandos importantes

##### 🐳 Docker

```sh
############ FILES ############
/var/lib/docker
/etc/docker/daemon.json

############ DAEMON ############
# get version
docker --version

# docker infos
docker info

############ MANAGE IMAGES ############
# pull image from docker hub
docker pull nginx:latest

# list images
docker image ls
docker images
docker images -a
docker images --format "{{.Repository}}: {{.Tag}} {{.Size}}"

# docker image inspect
docker image inspect nginx:latest
docker inspect nginx:latest
docker inspect --format '{{.Id}}' nginx:latest
docker image inspect --format "{{json .RootFS.Layers}}" acme/my-base-image:1.0

# remove image
docker image rm nginx:latest
docker rmi nginx:latest
docker rmi -f nginx:latest
docker image prune -a

# docker history
docker history nginx:latest

############ MANAGE CONTAINERS ############

# list containers running
docker container ls
docker ps

# list all containers
docker container ls -a
docker ps -a

# list containers id
docker container ls -q

# list last created container
docker container ls -l

# list containers with size
docker ps -s
docker ps --size --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Size}}"

# create container
docker container run hello-world

# create container as daemon
docker container run -d --name my-nginx -p 8080:80 nginx:latest

# create container and run interactively
docker container run -it ubuntu bash

# docker container port
docker container port my-nginx

# create container and expose port 80 to host port 8080
docker container run -d --name my-nginx -p 8080:80 nginx:latest

# create container and publish all exposed ports to random ports
docker container run -d --name my-nginx -P nginx:latest

# create container and expose tcp port 8080 and udp port 8080 to host
docker container run -d --name my-nginx -p 8080:80/tcp -p 8080:80/udp nginx:latest

# create a container and expose port 8888
docker container run -d --name my-nginx -p 9082:80 --expose 8888 nginx:latest

# create container in detached mode
docker container run -d -it --name alpine alpine

# pause container
docker container pause <container_id|name>

# unpause container
docker container unpause <container_id|name>

# stop container
docker container stop <container_id|name>

# start container
docker container start <container_id|name>

# remove container
docker container rm <container_id|name>

# remove container force
docker container rm -f <container_id|name>

# prune all stopped containers
docker container prune

# remove all containers
docker container rm -f $(docker container ps -a -q)

# inspect container
docker container inspect <container_id|name>

# get PID of container
docker container inspect --format '{{.State.Pid}}' <container_id|name>

# get ID of container
docker container inspect --format '{{.Id}}' <container_id|name>
docker container inspect --format '{{.Id}}' <container_id|name>

# execute command in container
docker container exec -it <container_id|name> bash
docker container exec -it <container_id|name> ls /
docker container exec -it <container_id|name> sh -c "echo 'Hello from container'"

# copy file to container
docker container cp /etc/hosts <container_id|name>:/etc/hosts

# copy file from container
docker container cp <container_id|name>:/etc/hosts /tmp/container-hosts

############ MANAGE STORAGE #############

# Docker Storage Files
/var/lib/docker/overlay/
/var/lib/docker/containers/
/var/lib/docker/volumes/

# list volumes
docker volume ls

# create volume
docker volume create my-volume

# inspect volume
docker volume inspect my-volume

# remove volume
docker volume rm my-volume

# prune all unused volumes
docker volume prune

# create container with bind mount
docker container run -d --name my-nginx -p 8080:80 --mount type=bind,source=/home/vagrant/html,target=/usr/share/nginx/html nginx:latest
docker container run -d --name my-nginx -p 8080:80 --volume /home/vagrant/html:/usr/share/nginx/html nginx:latest
docker container run -d --name my-nginx -p 8080:80 -v /home/vagrant/html:/usr/share/nginx/html nginx:latest
docker container run -d --name my-nginx -p 8080:80 -v /home/vagrant/html:/usr/share/nginx/html:ro nginx:latest

# create container with volume
docker container run -d --name my-nginx -p 8080:80 --mount type=volume,source=my-volume,target=/usr/share/nginx/html nginx:latest
docker container run -d --name my-nginx -p 8080:80 --volume my-volume:/usr/share/nginx/html nginx:latest

# create a container with volume-from another container
docker container run -d --name my-nginx2 -p 8086:80 --volumes-from my-nginx1 nginx:latest

# create container with tmpfs mount
docker container run -d --name my-nginx -p 8080:80 --mount type=tmpfs,target=/usr/share/nginx/html nginx:latest
docker container run -d --name my-nginx -p 8080:80 --tmpfs /usr/share/nginx/html nginx:latest

# remove volume
docker volume rm my-volume

# remove volumes not used by any containers
docker volume prune

# remove all volumes
docker volume rm $(docker volume ls -q)

########### MANAGE LOGS ############

# view container logs
docker container logs <container_id|name>

# follow container logs
docker container logs -f <container_id|name>

# docker system events
docker system events --since "2h"
docker system events --since "20h" --filter 'container=<container_id|name>'
docker system events --since "20h" --filter type=container  --filter 'event=start' --filter 'event=stop'

# docker stats
docker container stats
docker container stats <container_id|name>

# docker top
docker container top <container_id|name>

########### DOCKER NETWORKING ###########



############ OTHERS COMMANDS ############

# inspect namespaces
ls -l /proc/<PID>/ns
sudo lsns -p <PID>
ps -o pid,ppid,cmd,netns,mntns,pidns,utsns <PID>

# inspect cgroups
lscgroup | grep <PID> # cgroup v1
cat /proc/<PID>/cgroup # cgroup v2
ls -l /sys/fs/cgroup/system.slice/docker-<FULL_ID_CONTAINER>.scope
cat /sys/fs/cgroup/system.slice/docker-<FULL_ID_CONTAINER>.scope/cgroup.procs
```

<p align="right">(<a href="#topic-352.3">back to sub topic 352.3</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.4"></a>

### 🗂️ Plataformas de orquestração de contêineres 352,4

**Peso:**3

**Descrição:**Os candidatos devem entender a importância da orquestração de contêineres e os principais conceitos Docker Swarm e Kubernetes fornecem para implementar a orquestração de contêineres.

**Principais áreas de conhecimento:**

-   Entenda a relevância da orquestração de contêineres
-   Entenda os principais conceitos de composição do Docker e Swarm Docker
-   Entenda os principais conceitos de Kubernetes e comando
-   Consciência do OpenShift, Rancher e Mesosfera DC/OS

<p align="right">(<a href="#topic-352.4">back to sub topic 352.4</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353"></a>

## ☁️ Tópico 353: VM Deployment and Provisioning

* * *

<a name="topic-353.1"></a>

### ☁️ Ferramentas de gerenciamento de nuvem 353.1

**Peso:**2

**Descrição:**Os candidatos devem compreender as ofertas comuns em nuvens públicas e ter conhecimento básico dos recursos das ferramentas de gerenciamento de nuvem comumente disponíveis.

**Principais áreas de conhecimento:**

-   Entender ofertas comuns em nuvens públicas
-   Conhecimento básico de recursos do OpenStack
-   Feature Basic Feature Knowledge of Terraform
-   Conscientização sobre CloudStack, Eucalyptus e OpenNebula

#### 📋 353.1 Objetos citados

```sh
IaaS, PaaS, SaaS
OpenStack
Terraform
```

#### 🛠️ 353.1 Comandos importantes

##### 📝 foo

```sh
# examples
```

<p align="right">(<a href="#topic-353.1">back to sub topic 353.1</a>)</p>
<p align="right">(<a href="#topic-353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.2"></a>

### 📦 353.2 Packer

**Peso:**2

**Descrição:**Os candidatos devem ser capazes de usar o Packer para criar imagens de sistema. Isso inclui a execução do Packer em vários ambientes de nuvem pública e privada, bem como a construção de imagens de contêiner para LXC/LXD.

**Principais áreas de conhecimento:**

-   Entenda a funcionalidade e os recursos do Packer
-   Criar e manter arquivos de modelo
-   Crie imagens a partir de arquivos de modelo usando diferentes construtores

#### 📋 353.2 Objetos citados

```sh
packer
```

#### 🛠️ 353,2 comandos importantes

##### 📦 Packer

```sh
# examples
```

<p align="right">(<a href="#topic-353.2">back to sub topic 353.2</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.3"></a>

### ☁️ 353,3 nuvem de inicialização

**Peso:**3

**Descrição:**Os candidatos devem ser capazes de usar o cloud-init para configurar máquinas virtuais criadas a partir de imagens padronizadas. Isso inclui ajustar as máquinas virtuais para corresponder aos recursos de hardware disponíveis, especificamente espaço em disco e volumes.
Além disso, os candidatos devem ser capazes de configurar instâncias para permitir logins SSH seguros e instalar um conjunto específico de pacotes de software.
Além disso, os candidatos devem ser capazes de criar novas imagens de sistema com suporte para cloud-init.

**Principais áreas de conhecimento:**

-   Compreender os recursos e conceitos do cloud-init, incluindo dados do usuário, inicialização e configuração do cloud-init
-   Use Cloud-Init para criar, redimensionar e montar sistemas de arquivos, configurar contas de usuário, incluindo credenciais de login, como teclas SSH e instalar pacotes de software do repositório da distribuição
-   Integre o cloud-init às imagens do sistema
-   Use Config Drive DataSource para testar

#### 📋 353,3 Objetos Citados

```sh
cloud-init
user-data
/var/lib/cloud/
```

#### 🛠️ 353.3 Comandos importantes

##### 📝 Cloud-Init

```sh
# examples
```

<p align="right">(<a href="#topic-353.3">back to sub topic 353.3</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.4"></a>

### 📦 353.4 Vagrant

**Peso:**3

**Descrição:**O candidato deve poder usar o Vagrant para gerenciar máquinas virtuais, incluindo o fornecimento da máquina virtual.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura e os conceitos vagantes, incluindo armazenamento e rede
-   Recuperar e usar caixas do Atlas
-   Crie e execute Vagrantfiles
-   Acesse máquinas virtuais vagantes
-   Compartilhe e sincronize pastas entre uma máquina virtual Vagrant e o sistema host
-   Entenda o provisionamento do Vagrant, ou seja, provisionadores de arquivos e Shell
-   Entenda a configuração de várias máquinas

#### 📋 353.4 Objetos citados

```sh
vagrant
Vagrantfile
```

#### 🛠️ 353,4 comandos importantes

##### 📦 Vagrant

```sh
# examples
```

<p align="right">(<a href="#topic-353.4">back to sub topic 353.4</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## 🤝 Contribuindo

Contribuições são o que tornam a comunidade de código aberto um lugar tão incrível para
Aprenda, inspire e crie. Quaisquer contribuições que você faz são**muito apreciado**.

Se você tiver uma sugestão que possa melhorar isso, bifurque o repositório e
crie uma solicitação pull. Você também pode simplesmente abrir um problema com a tag “aprimoramento”.
Não se esqueça de dar uma estrela ao projeto! Obrigado novamente!

1.  Bifurcar o projeto
2.  Crie sua filial de recursos (`git checkout -b feature/AmazingFeature`)
3.  Confirme suas alterações (`git commit -m 'Add some AmazingFeature'`)
4.  Empurre para a filial (`git push origin feature/AmazingFeature`)
5.  Abra um pedido de tração

* * *

## 📄 Licença

-   Este projeto está licenciado sob a licença do MIT \* Veja o arquivo License.md para obter detalhes

* * *

## 📬 Contato

Marcos Silvestrini[marcos.silvestrini@gmail.com](mailto:marcos.silvestrini@gmail.com)[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/mrsilvestrini.svg?style=social&label=Follow%20%40mrsilvestrini)](https://twitter.com/mrsilvestrini)

Link do projeto:<https://github.com/marcossilvestrini/learning-lpic-3-305-300>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## 🙏 Agradecimentos

-   [Richard Stallman's](http://www.stallman.org/)

-   [GNU](<>)

    -   [GNU/FAQ Linux por Richard Stallman](https://www.gnu.org/gnu/gnu-linux-faq.html)
    -   [GNU](https://www.gnu.org/)
    -   [Sistema operacional GNU](https://www.gnu.org/gnu/thegnuproject.html)
    -   [Compilador GCC](https://gcc.gnu.org/wiki/History)
    -   [GNU alcatrão](https://www.gnu.org/software/tar/)
    -   [GNU Make](https://www.gnu.org/software/make/)
    -   [GNU Emacs](https://en.wikipedia.org/wiki/Emacs)
    -   [Pacotes GNU](https://www.gnu.org/software/)
    -   [Coleção GNU/Linux](https://directory.fsf.org/wiki/Collection:GNU/Linux)
    -   [GNU GRUB Bootloader](https://www.gnu.org/software/grub/)
    -   [GNU Hurd](https://www.gnu.org/software/hurd/hurd/what_is_the_gnu_hurd.html)

-   [Kernel](<>)

    -   [Núcleo](https://www.kernel.org/)
    -   [Páginas do Kernel Linux](https://www.kernel.org/doc/man-pages/)
    -   [Compile seu kernel](https://wiki.linuxquestions.org/wiki/How_to_build_and_install_your_own_Linux_kernel)

-   [Base padrão Linux](<>)

    -   [Base padrão Linux](https://en.wikipedia.org/wiki/Linux_Standard_Base)
    -   [Padrão de hierarquia do sistema de arquivos](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)
    -   [Estrutura de hierarquia de arquivos](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.pdf)

-   [Software livre](<>)

    -   [FSF](https://www.fsf.org)
    -   [Diretório de software livre](https://directory.fsf.org/wiki/Free_Software_Directory:Free_software_replacements)

-   [Licença](<>)

    -   [Software livre](https://www.gnu.org/philosophy/free-sw.html)
    -   [Copyleft](https://www.gnu.org/licenses/copyleft.en.html)
    -   [Gpl](https://www.gnu.org/licenses/quick-guide-gplv3.html)
    -   [Licença Pública Geral Menor GNU](https://www.gnu.org/licenses/lgpl-3.0.html)
    -   [BSD](https://opensource.org/licenses/BSD-3-Clause)
    -   [Iniciativa de código aberto](https://opensource.org/)
    -   [Creative Commons](https://creativecommons.org/)
    -   [Licença LTS](https://en.wikipedia.org/wiki/Long-term_support)

-   [Distribuições](<>)

    -   [Diretrizes de software livre do Debian](https://www.debian.org/social_contract#guidelines)
    -   [Listar distribuição Linux](https://en.wikipedia.org/wiki/List_of_Linux_distributions)
    -   [Distrowatch](https://distrowatch.com/)
    -   [Comparação de distribuições Linux](https://en.wikipedia.org/wiki/Comparison_of_Linux_distributions)

-   [Ambientes de mesa](<>)

    -   [X11 org](https://www.x.org/wiki/)
    -   [Wayland](https://wayland.freedesktop.org/)
    -   [GNU Gnome](https://www.gnu.org/press/gnome-1.0.html)
    -   [GNOMO](https://www.gnome.org/)
    -   [Xfce](https://xfce.org/)
    -   [Onde o plasma](https://kde.org/plasma-desktop/)
    -   [Harmonia](https://en.wikipedia.org/wiki/Harmony_(toolkit))

-   [Protocolos](<>)

    -   [HTTP](<>)
        -   [W3Techs](https://w3techs.com/)
        -   [Apache](https://www.apache.org/)
        -   [Diretivas Apache](https://httpd.apache.org/docs/2.4/mod/directives.html)
        -   [Códigos de status HTTP](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
        -   [Cifras fortes para Apache, nginx e Lighttpd](https://cipherlist.eu/)
        -   [Tutoriais da SSL](https://www.golinuxcloud.com/blog/)
        -   [SSL Config Mozilla](https://ssl-config.mozilla.org/)
    -   [XRDP](https://bytexd.com/xrdp-centos/)
    -   [NTP](https://www.ntppool.org/en/)

-   [DNS](<>)

    -   [Vincular](https://www.isc.org/bind/)
    -   [Vincular registro](https://www.zytrax.com/books/dns/ch7/logging.html)
    -   [Lista de tipos de registro DNS](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
    -   [Lista de tipos de registro DNS](https://en.wikipedia.org/wiki/List_of_DNS_record_types)

-   [Gerenciador de pacotes](<>)

    -   [Baixar pacotes](https://pkgs.org/)
    -   [Instale pacotes](https://installati.one/)
    -   [Guia de instalação de pacotes](https://installati.one/)

-   [Script de shell](<>)

    -   [Bourne Novamente Concha](https://www.gnu.org/software/bash/manual/)
    -   [Shebang](https://bash.cyberciti.biz/guide/Shebang)
    -   [Variáveis ​​de ambiente](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)
    -   [Globulação GNU](https://man7.org/linux/man-pages/man7/glob.7.html)
    -   [Globbing](https://linuxhint.com/bash_globbing_tutorial/)
    -   [Citando](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
    -   [Expressões regulares](https://www.gnu.org/software/grep/manual/html_node/Regular-Expressions.html)
    -   [Comando não encontrado](https://command-not-found.com/)
    -   [Bash gerador de prompt](https://bash-prompt-generator.org/)
    -   [Explique](https://explainshell.com/)
    -   [Tutorial Vim](https://www.openvim.com/)
    -   [Tutorial de script linux shell](https://bash.cyberciti.biz/guide/Main_Page)
    -   [Exemplos de comandos](https://www.geeksforgeeks.org/)

-   [Outras ferramentas](<>)

    -   [Bugzila](https://bugzilla.kernel.org/)
    -   [Emblemas do GitHub](https://github.com/alexandresanlim/Badges4-README.md-Profile)

-   [Definições de virtualização](<>)

    -   [Chapéu Vermelho](https://www.redhat.com/pt-br/topics/virtualization/what-is-virtualization/)
    -   [AWS](https://aws.amazon.com/pt/what-is/virtualization/)
    -   [IBM](https://www.ibm.com/topics/virtualization)
    -   [OpenSource.com](https://opensource.com/resources/virtualization)

-   [Alternar](<>)

    -   [XenServer](https://www.xenserver.com/)
    -   [Wiki XenProject](https://wiki.xenproject.org/wiki/Main_Page)
    -   [Interfaces de rede](https://wiki.xenproject.org/wiki/Xen_Networking#Virtual_Network_Interfaces)
    -   [Ferramentas Xen](https://xen-tools.org/software/)
    -   [Blog LPI: Virtualização Xen e Computação em Nuvem #01: Introdução](https://www.lpi.org/pt-br/blog/2020/10/01/xen-virtualization-and-cloud-computing-01-introduction/)
    -   [LPI Blog: Xen Virtualização e computação em nuvem #02: Como Xen faz o trabalho](https://www.lpi.org/blog/2020/10/08/xen-virtualization-and-cloud-computing-02-how-xen-does-job/)
    -   [Blog LPI: Virtualização Xen e computação em nuvem #04: contêineres, OpenStack e outras plataformas relacionadas](https://www.lpi.org/pt-br/blog/2020/10/22/xen-virtualization-and-cloud-computing-04-containers-openstack-and-other-related/)
    -   [Virtualização Xen e Computação em Nuvem #05: O Projeto Xen, Unikernels e o Futuro](https://www.lpi.org/pt-br/blog/2020/10/29/xen-virtualization-and-cloud-computing-05-xen-project-unikernels-and-future/)
    -   [Guia para iniciantes do projeto Xen](https://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide#Installing_the_Xen_Project_Software)
    -   [Livro maluco](https://wiki.xenproject.org/wiki/Book/HelloXenProject/0-Contents)

-   [Unicernel](https://www.lpi.org/blog/2020/10/29/xen-virtualization-and-cloud-computing-05-xen-project-unikernels-and-future/)

    -   [Força única](https://github.com/unikraft/unikraft)
    -   [Mirage OS](https://mirage.io/docs/hello-world)
    -   [Ruim](https://galois.com/project/halvm/)
    -   [Exclusivo](https://github.com/solo-io/unik/blob/master/docs/providers/virtualbox.md)

-   [KVM](<>)

    -   [Doc](https://linux-kvm.org/page/Main_Page)
    -   [KVM (máquinas virtuais de kernel da RedHat)](https://www.redhat.com/pt-br/topics/virtualization/what-is-KVM)
    -   [Ferramentas de gerenciamento da KVM](https://www.linux-kvm.org/page/Management_Tools)
    -   [Rede KVM](https://www.linux-kvm.org/page/Networking)

-   [Qemu](<>)

    -   [Documento Oficial](https://www.qemu.org/)
    -   [Baixe imagens osboxes](https://www.osboxes.org/)
    -   [Baixar imagens linuximages](https://www.linuxvmimages.com/)
    -   [Urbano](https://en.wikibooks.org/wiki/QEMU/Devices/Virtio)
    -   [Agente convidado](https://wiki.qemu.org/Features/GuestAgent)

-   [Libvirt](<>)

    -   [Doc](https://libvirt.org/)
    -   [Ativação do soquete do sistema](https://libvirt.org/manpages/libvirtd.html#system-socket-activation)
    -   [Conexões](https://libvirt.org/uri.html)
    -   [Armazenar](https://libvirt.org/storage.html)
    -   [Rede](https://wiki.libvirt.org/Networking.html)
    -   [Rede Virtual](https://wiki.libvirt.org/VirtualNetworking.html)
    -   [virtlogd](https://libvirt.org/manpages/virtlogd.html)
    -   [virtlockd](https://libvirt.org/manpages/virtlockd.html)
    -   [gerenciador de virt](https://virt-manager.org/)

-   [Gerenciamento de disco](<>)

    -   [Imagens de disco](https://qemu-project.gitlab.io/qemu/system/images.html)
    -   [cópia-em-escrever](https://sempreupdate.com.br/linux/tutoriais/sistema-de-arquivos-copy-on-write-saiba-o-que-e-e-quais-as-vantagens-e-desvantagens/)
    -   [RAM x QCOW2](https://docs.redhat.com/en/documentation/red_hat_virtualization/4.3/html/technical_reference/qcow2)
    -   [Libguestfs](https://libguestfs.org/)

-   [recipientes](<>)

    -   [Contêineres da AWS DOC](https://aws.amazon.com/pt/containers/)
    -   [Contêineres de documentos do GCP](https://cloud.google.com/learn/what-are-containers?hl=pt-br)
    -   [Contêiner IBM Doc](https://www.ibm.com/br-pt/topics/containers)
    -   [Contêineres do Red Hat Docs](https://www.redhat.com/en/topics/containers/whats-a-linux-container)
    -   [Espaços para nome](https://manpages.ubuntu.com/manpages/noble/man7/namespaces.7.html)
    -   [Os namespaces mais importantes](https://www.redhat.com/en/blog/7-linux-namespaces)
    -   [Aulas de Cgroups](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/resource_management_guide/ch01)
    -   [Grupos humanos](https://manpages.ubuntu.com/manpages/noble/man7/cgroups.7.html)
    -   [Documento de capacidades](https://linux-audit.com/kernel/capabilities/linux-capabilities-101/)
    -   [Capacidades do homem](https://manpages.ubuntu.com/manpages/noble/man7/capabilities.7.html)
    -   [Perfis Seccomp no Docker](https://docs.docker.com/engine/security/seccomp/)
    -   [Perfis AppArmor no Docker](https://docs.docker.com/engine/security/apparmor/)
    -   [SElinux](https://pt.wikipedia.org/wiki/SELinux)
    -   [Comparador Apparmor SElinux](https://www.redhat.com/en/blog/apparmor-selinux-isolation)
    -   [Runc](https://www.docker.com/blog/runc/)
    -   [Executar GitHub](https://github.com/opencontainers/runc)
    -   [OCI](https://opencontainers.org/about/overview/)
    -   [Cri](https://kubernetes.io/docs/concepts/architecture/cri/)
    -   [CRI-O](https://cri-o.io/)
    -   [contêiner](https://containerd.io/)
    -   [Subman](https://www.redhat.com/pt-br/topics/containers/what-is-podman)
    -   [Escopo](https://www.redhat.com/pt-br/topics/containers/what-is-skopeo)
    -   [Construir](https://www.redhat.com/en/topics/containers/what-is-buildah)
    -   [OpenVZ](https://openvz.org/)
    -   [Crun](https://www.redhat.com/en/blog/introduction-crun)
    -   [dizer](https://katacontainers.io/)

-   [LXC - contêineres Linux](<>)

    -   [LXC](https://linuxcontainers.org/lxc/introduction/)
    -   [Imagens de contêiner Linux](https://images.linuxcontainers.org/)

-   [Lxd](<>)

    -   [LXD canônico](https://canonical.com/lxd)
    -   [Github Canônico LXD](https://github.com/canonical/lxd)
    -   [Documentação LXD](https://linuxcontainers.org/lxd/docs/master/)
    -   [Instalação LXD](https://documentation.ubuntu.com/lxd/stable-4.0/instances/)
    -   [Imagens LDX](https://images.lxd.canonical.com/)
    -   [LXD Storage](https://documentation.ubuntu.com/lxd/stable-4.0/storage/)
    -   [Pools, volumes e buckets de armazenamento LXD](https://documentation.ubuntu.com/lxd/stable-5.21/explanation/storage/#exp-storage)
    -   [Tipos de rede LXD](https://documentation.ubuntu.com/lxd/latest/explanation/networks/)
    -   [Parâmetros de rede LXD](https://documentation.ubuntu.com/lxd/stable-4.0/networks/)
    -   [Configuração da rede LXD](https://documentation.ubuntu.com/lxd/latest/howto/network_create/)
    -   [Perfis LXD](https://documentation.ubuntu.com/lxd/to/latest/profiles/)
    -   [Instâncias LXD](https://documentation.ubuntu.com/lxd/en/stable-4.0/instances/)

-   [Docker](https://www.docker.com/)

    -   [Visão geral do Docker](https://docs.docker.com/get-started/overview/)
    -   [Contêiner x Docker](https://www.docker.com/blog/containerd-vs-docker/)
    -   [Instalar](https://docs.docker.com/engine/install/)
    -   [Configuração do Daemon](https://docs.docker.com/engine/daemon/)
    -   [Imagens do Docker](https://docs.docker.com/engine/storage/drivers/#images-and-layers)
    -   [DockerHub](https://hub.docker.com/)
    -   [Armazenamento no Docker](https://docs.docker.com/storage/)
    -   [Volumes](https://docs.docker.com/storage/volumes/)
    -   [Montagens de ligação](https://docs.docker.com/storage/bind-mounts/)
    -   [Drivers de armazenamento](https://docs.docker.com/storage/storagedriver/select-storage-driver/)
    -   [Contêineres de teste](https://testcontainers.com/)
    -   [Rede Docker](https://docs.docker.com/network/)
    -   [Drivers de rede Docker](https://docs.docker.com/network/drivers)

-   [OpenStack Docs](<>)

    -   [Redhat](https://www.redhat.com/pt-br/topics/openstack)

-   [Abra o vSwitch](<>)

    -   [OVS DOC 4LINUX](https://blog.4linux.com.br/open-vswitch-o-que-e-o-que-come-onde-vive)

-   [Exame LPIC-3 305-300](<>)

    -   [Objetivos LPIC-3 305-300](https://www.lpi.org/our-certifications/exam-305-objectives/)
    -   [LPIC-3 305-300 Wiki](https://wiki.lpi.org/wiki/LPIC-305_Objectives_V3.0)
    -   [Lpic-3 305-300 Material de aprendizado](https://cursos.linuxsemfronteiras.com.br/courses/preparatorio-para-certificacao-lpic-3-305/)
    -   [Exame simulado LPIC-3 305-300 por ITexams](https://www.itexams.com/info/305-300)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<!-- MARKDOWN LINKS & IMAGES -->

<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/marcossilvestrini/learning-lpic-3-305-300.svg?style=for-the-badge

[contributors-url]: https://github.com/marcossilvestrini/learning-lpic-3-305-300/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/marcossilvestrini/learning-lpic-3-305-300.svg?style=for-the-badge

[forks-url]: https://github.com/marcossilvestrini/learning-lpic-3-305-300/network/members

[stars-shield]: https://img.shields.io/github/stars/marcossilvestrini/learning-lpic-3-305-300.svg?style=for-the-badge

[stars-url]: https://github.com/marcossilvestrini/learning-lpic-3-305-300/stargazers

[issues-shield]: https://img.shields.io/github/issues/marcossilvestrini/learning-lpic-3-305-300.svg?style=for-the-badge

[issues-url]: https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues

[license-shield]: https://img.shields.io/github/license/marcossilvestrini/learning-lpic-3-305-300.svg?style=for-the-badge

[license-url]: https://github.com/marcossilvestrini/learning-lpic-3-305-300/blob/main/LICENSE

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555

[linkedin-url]: https://linkedin.com/in/marcossilvestrini

[def]: https://httpd.apache.org/docs/2.4/mod/directives.html
