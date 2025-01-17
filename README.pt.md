<h1><a name="readme-top"></a></h1>

[![Create Release](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml)[![Translate README](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml)[![Deploy GitHub Pages](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml)[![Generate HTML and PDF](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml)[![PSScriptAnalyzer](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml)[![Slack Notification](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml)

* * *

[![MIT License][license-shield]][license-url][![Forks][forks-shield]][forks-url][![Stargazers][stars-shield]][stars-url][![Contributors][contributors-shield]][contributors-url][![Issues][issues-shield]][issues-url][![LinkedIn][linkedin-shield]][linkedin-url]

* * *

# APRENDIZAGEM LPIC-3 305-300

![LPIC3-305-300](images/lpic3-305-300.jpg)

<p align="center">
<strong>Explore the docs »</strong></a>
    <br />
    <a href="">Web Site</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300">Code Page</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">Report Bug</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">Request Feature</a>
</p>

* * *

## Resumo

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
      <a href="#topic-352">Topic 352: Container Virtualization</a>
      <ul>
        <li><a href="#topic-352.1">352.1 Container Virtualization Concepts</a></li>
        <li><a href="#topic-352.2">352.2 LXC</a></li>
        <li><a href="#topic-352.3">352.3 Docker</a></li>
        <li><a href="#topic-352.4">352.4 Container Orchestration Platforms</a></li>
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

## Sobre o projeto

> Este projeto visa ajudar estudantes ou profissionais a aprender os principais conceitos do GNULinux
> e software livre\\
> Algumas distribuições GNULinux como Debian e RPM serão abordadas\\
> A instalação e configuração de alguns pacotes também serão abordadas\\
> Ao fazer isso, você pode dar a toda a comunidade a oportunidade de se beneficiar de suas alterações.\\
> O acesso ao código-fonte é uma pré-condição para isso.\\
> Use o vagrant para atualizar máquinas, executar laboratórios e praticar o conteúdo deste artigo.\\
> Publiquei na pasta Vagrant um Vagrantfile com o que é necessário\\
> para você subir um ambiente para estudos

* * *

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<a name="getting-started"></a>

## Começando

Para iniciar o aprendizado, consulte a documentação acima.

<a name="prerequisites"></a>

### Pré-requisitos

-   [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
-   [Estação de trabalho VMware](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
-   [Utilitário Vagrant VMWare](https://developer.hashicorp.com/vagrant/install/vmware)
-   [Vagabundo](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### Instalação

Clonar o repositório

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

Personalize um modelo_Vagrantfile-tópico-XXX_. Este arquivo contém uma configuração de vms para laboratórios. Exemplo:

-   Arquivo[Vagrantfile-topic-351](./vagrant/Vagrantfile-topic-351)
    -   vm.clone_directory = "&lt;sua_letra_do_driver>:\\<folder>\\&lt;para_máquina>\\#{VM_NAME}-instance-1"
        Exemplo: vm.clone_directory = "E:\\Servidores\\VMware\\#{VM_NAME}-instance-1"
    -   vm.vmx["mem tamanho"]= ""
    -   vm.vmx["numvcpus"]= ""
    -   vm.vmx["cpuid.coresPerSocket"]= ""

Personalize a configuração de rede em arquivos[configurações/rede](configs/network/).

* * *

<a name="usage"></a>

## Uso

Use este repositório para aprender sobre o exame LPIC-3 305-300

### Para cima e para baixo

Mudar um_Vagrantfile-tópico-xxx_modelo e copie para um novo arquivo com nome_Vagrantfile_

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### Para reiniciar vms

```sh
cd vagrant && vagrant reload
```

**Importante:**_Se você reiniciar o vms sem o vagrant, a pasta compartilhada não será montada após a inicialização._

### Use o PowerShell para cima e para baixo

Se você usa a plataforma Windows, eu crio um script PowerShell para ativar e desativar vms.

```powershell
vagrant/up.ps1
vagrant/destroy.ps1
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="roadmap"></a>

## Roteiro

-   [x] Criar repositório
-   [x] Crie scripts para laboratórios de provisionamento
-   [x] Crie exemplos sobre o Tópico 351
-   [ ] Crie exemplos sobre o Tópico 352
-   [ ] Crie exemplos sobre o Tópico 353
-   [ ] Carregar itexam simulado

* * *

<a name="freedoms"></a>

## Quatro liberdades essenciais

> 0.A liberdade de executar o programa como desejar, para qualquer finalidade (liberdade 0).\\
> 1.A liberdade de estudar como o programa funciona e alterá-lo para que funcione\\
> sua computação como desejar (liberdade 1).\\
> O acesso ao código-fonte é uma pré-condição para isso.\\
> 2.A liberdade de redistribuir cópias para que você possa ajudar outras pessoas (liberdade 2).\\
> 3.liberdade para distribuir cópias de suas versões modificadas para terceiros (liberdade 3).

* * *

## Inspecionar comandos

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

## Tópico 351: Virtualização Completa

![LPIC3-305-300](images/virtualization-351.png)

* * *

<a name="topic-351.1"></a>

### 351.1 Conceitos e Teoria de Virtualização

**Peso:**6

**Descrição:**Os candidatos devem conhecer e compreender os conceitos gerais, teoria e terminologia da virtualização. Isso inclui a terminologia Xen, QEMU e libvirt.

**Principais áreas de conhecimento:**

-   Entenda a terminologia de virtualização
-   Entenda os prós e os contras da virtualização
-   Compreenda as diversas variações de hipervisores e monitores de máquinas virtuais
-   Entenda os principais aspectos da migração de máquinas físicas para virtuais
-   Compreender os principais aspectos da migração de máquinas virtuais entre sistemas host
-   Compreenda os recursos e as implicações da virtualização para uma máquina virtual, como captura instantânea, pausa, clonagem e limites de recursos
-   Conhecimento de oVirt, Proxmox, systemd-machined e VirtualBox
-   Conscientização do Open vSwitch

#### 351.1 Objetos Citados

```sh
Hypervisor
Hardware Virtual Machine (HVM)
Paravirtualization (PV)
Emulation and Simulation
CPU flags
/proc/cpuinfo
Migration (P2V, V2V)
```

#### Hipervisores

##### Hipervisor tipo 1 (hipervisor bare-metal)

###### Definição Tipo 1

É executado diretamente no hardware físico do host, fornecendo uma camada base para gerenciar VMs sem a necessidade de um sistema operacional host.

###### Características Tipo 1

-   Alto desempenho e eficiência.
-   Menor latência e sobrecarga.
-   Frequentemente usado em ambientes corporativos e data centers.

###### Exemplos de tipo 1

-   VMware ESXi: um hipervisor robusto e amplamente utilizado em ambientes empresariais.
-   Microsoft Hyper-V: Integrado ao Windows Server, oferecendo forte desempenho e recursos de gerenciamento.
-   Xen: Um hipervisor de código aberto usado por muitos provedores de serviços em nuvem.
-   KVM (Máquina Virtual Baseada em Kernel): Integrado ao kernel Linux, proporcionando alto desempenho para sistemas baseados em Linux.

##### Hipervisor tipo 2 (hipervisor hospedado)

###### Definição Tipo 2

É executado sobre um sistema operacional convencional, contando com o sistema operacional host para gerenciamento de recursos e suporte a dispositivos.

###### Características do tipo 2

-   Mais fácil de configurar e usar, especialmente em computadores pessoais.
-   Mais flexível para desenvolvimento, testes e implantações em menor escala.
-   Normalmente menos eficiente que os hipervisores Tipo 1 devido à sobrecarga adicional do sistema operacional host.

###### Exemplos de tipo 2

-   Estação de trabalho VMware: um hipervisor poderoso para executar vários sistemas operacionais em um único desktop.
-   Oracle VirtualBox: um hipervisor de código aberto conhecido por sua flexibilidade e facilidade de uso.
-   Parallels Desktop: projetado para usuários de Mac executarem Windows e outros sistemas operacionais junto com o macOS.
-   QEMU (Quick EMUlator): Um emulador e virtualizador de código aberto, frequentemente usado em conjunto com KVM.

##### Principais diferenças entre hipervisores tipo 1 e tipo 2

-   Ambiente de implantação:
    -   Os hipervisores tipo 1 são comumente implantados em data centers e ambientes corporativos devido à sua interação direta com hardware e alto desempenho.
    -   Os hipervisores tipo 2 são mais adequados para uso pessoal, desenvolvimento, testes e tarefas de virtualização em pequena escala.
-   Desempenho:
    -   Os hipervisores tipo 1 geralmente oferecem melhor desempenho e menor latência porque não dependem de um sistema operacional host.
    -   Os hipervisores tipo 2 podem sofrer alguma degradação de desempenho devido à sobrecarga de execução em um sistema operacional host.
-   Gerenciamento e facilidade de uso:
    -   Os hipervisores tipo 1 exigem configuração e gerenciamento mais complexos, mas fornecem recursos avançados e escalabilidade para implantações em larga escala.
    -   Os hipervisores tipo 2 são mais fáceis de instalar e usar, tornando-os ideais para usuários individuais e projetos menores.

##### Tipos de migração

No contexto dos hipervisores, que são tecnologias utilizadas para criar e gerenciar máquinas virtuais, os termos migração P2V e migração V2V são comuns em ambientes de virtualização.  
Referem-se a processos de migração de sistemas entre diferentes tipos de plataformas.

##### P2V - Migração Física para Virtual

A migração P2V refere-se ao processo de migração de um servidor físico para uma máquina virtual.  
Em outras palavras, um sistema operacional e seus aplicativos, executados em hardware físico dedicado, são “convertidos” e movidos para uma máquina virtual que roda em um hipervisor (como VMware, Hyper-V, KVM, etc.).

-   Exemplo: você tem um servidor físico executando um sistema Windows ou Linux e deseja movê-lo para um ambiente virtual, como uma infraestrutura em nuvem ou um servidor de virtualização interno.  
    O processo envolve copiar todo o estado do sistema, incluindo sistema operacional, drivers e dados, para criar uma máquina virtual equivalente que possa ser executada como se estivesse no hardware físico.

##### V2V - Migração Virtual para Virtual

A migração V2V refere-se ao processo de migração de uma máquina virtual de um hipervisor para outro.  
Neste caso, você já possui uma máquina virtual rodando em um ambiente virtualizado (como VMware) e deseja movê-la para outro ambiente virtualizado (por exemplo, para Hyper-V ou para um novo servidor VMware).

-   Exemplo: você tem uma máquina virtual rodando em um servidor de virtualização VMware, mas decide migrá-la para uma plataforma Hyper-V. Nesse caso, a migração V2V converte a máquina virtual de um formato ou hipervisor para outro, garantindo que ela continue funcionando corretamente.

#### HVM e Paravirtualização

##### Virtualização assistida por hardware (HVM)

###### Definição HVM

O HVM aproveita extensões de hardware fornecidas por CPUs modernas para virtualizar hardware, permitindo a criação e o gerenciamento de VMs com sobrecarga mínima de desempenho.

###### Principais características do HVM

-   **Suporte de hardware**: requer suporte de CPU para extensões de virtualização como Intel VT-x ou AMD-V.
-   **Virtualização completa:**As VMs podem executar sistemas operacionais convidados não modificados, pois o hipervisor fornece uma emulação completa do ambiente de hardware.
-   **Desempenho:**Normalmente oferece desempenho quase nativo devido à execução direta do código convidado na CPU.
-   **Isolamento:**Fornece forte isolamento entre VMs, pois cada VM opera como se tivesse seu próprio hardware dedicado.

###### Exemplos de HVM

VMware ESXi, Microsoft Hyper-V, KVM (máquina virtual baseada em kernel).

###### Vantagens do HVM

-   **Compatibilidade:**Pode executar qualquer sistema operacional sem modificação.
-   **Desempenho:**Alto desempenho devido ao suporte de hardware.
-   **Segurança:**Recursos aprimorados de isolamento e segurança fornecidos pelo hardware.

###### Desvantagens do HVM

-   **Dependência de hardware:**Requer recursos de hardware específicos, limitando a compatibilidade com sistemas mais antigos.
-   **Complexidade:**Pode envolver configuração e gerenciamento mais complexos.

##### Paravirtualização

###### Definição de Paravirtualização

A paravirtualização envolve a modificação do sistema operacional convidado para estar ciente do ambiente virtual, permitindo que ele interaja de forma mais eficiente com o hipervisor.

###### Principais características da paravirtualização

-   **Modificação de convidado:**Requer alterações no sistema operacional convidado para se comunicar diretamente com o hipervisor usando hiperchamadas.
-   **Desempenho:**Pode ser mais eficiente do que a virtualização completa tradicional porque reduz a sobrecarga associada à emulação de hardware.
-   **Compatibilidade:**Limitado a sistemas operacionais que foram modificados para paravirtualização.

###### Exemplos de paravirtualização

Xen com convidados paravirtualizados, ferramentas VMware em determinadas configurações e algumas configurações KVM.

###### Vantagens da paravirtualização

-   **Eficiência:**Reduz a sobrecarga de virtualização de hardware, oferecendo potencialmente melhor desempenho para determinadas cargas de trabalho.
-   **Utilização de recursos:**Uso mais eficiente dos recursos do sistema devido à comunicação direta entre o sistema operacional convidado e o hipervisor.

###### Desvantagens da paravirtualização

-   **Modificação do sistema operacional convidado:**Requer modificações no sistema operacional convidado, limitando a compatibilidade aos sistemas operacionais suportados.
-   **Complexidade:**Requer complexidade adicional no sistema operacional convidado para implementações de hiperchamada.

##### Principais diferenças

###### Requisitos de sistema operacional convidado

-   **HVM:**Pode executar sistemas operacionais convidados não modificados.
-   **Paravirtualização:**Requer que os sistemas operacionais convidados sejam modificados para funcionar com o hipervisor.

###### Desempenho

-   **HVM:**Normalmente fornece desempenho quase nativo devido à execução assistida por hardware.
-   **Paravirtualização:**Pode oferecer desempenho eficiente reduzindo a sobrecarga da emulação de hardware, mas depende do sistema operacional convidado modificado.

###### Dependência de Hardware

-   **HVM:**Requer recursos específicos de CPU (Intel VT-x, AMD-V).
-   **Paravirtualização:**Não requer recursos específicos de CPU, mas precisa de um sistema operacional convidado modificado.

###### Isolamento

-   **HVM:**Fornece forte isolamento usando recursos de hardware.
-   **Paravirtualização:**Baseia-se no isolamento baseado em software, que pode não ser tão robusto quanto o isolamento baseado em hardware.

###### Complexidade

-   **HVM:**Geralmente mais simples de implantar, pois oferece suporte a sistemas operacionais não modificados.
-   **Paravirtualização:**Requer configuração e modificações adicionais no sistema operacional convidado, aumentando a complexidade.

#### NUMA (acesso não uniforme à memória)

NUMA (Non-Uniform Memory Access) é uma arquitetura de memória usada em sistemas multiprocessadores para otimizar o acesso à memória pelos processadores.  
Num sistema NUMA, a memória é distribuída de forma desigual entre os processadores, o que significa que cada processador tem acesso mais rápido a uma parte da memória (sua "memória local") do que à memória que está fisicamente mais distante (referida como "memória remota") e associada. com outros processadores.

##### Principais recursos da arquitetura NUMA

1.  **Memória local e remota**: Cada processador possui sua própria memória local, que pode acessar mais rapidamente. No entanto, também pode acessar a memória de outros processadores, embora demore mais.
2.  **Latência Diferenciada**: A latência de acesso à memória varia dependendo se o processador está acessando sua memória local ou a memória de outro nó. O acesso à memória local é mais rápido, enquanto o acesso à memória de outro nó (remoto) é mais lento.
3.  **Escalabilidade**: A arquitetura NUMA foi projetada para melhorar a escalabilidade em sistemas com muitos processadores. À medida que mais processadores são adicionados, a memória também é distribuída, evitando o gargalo que ocorreria em uma arquitetura de acesso uniforme à memória (UMA).

##### Advantages of NUMA

-   Melhor Desempenho em Sistemas Grandes: Como cada processador possui memória local, ele pode funcionar com mais eficiência sem competir tanto com outros processadores pelo acesso à memória.
-   Escalabilidade: NUMA permite que sistemas com muitos processadores e grandes quantidades de memória sejam dimensionados de forma mais eficaz em comparação com uma arquitetura UMA.

##### Desvantagens

-   Complexidade de programação: Os programadores precisam estar cientes de quais regiões da memória são locais ou remotas, otimizando o uso da memória local para obter melhor desempenho.
-   Potenciais penalidades de desempenho: Se um processador acessa frequentemente a memória remota, o desempenho pode ser prejudicado devido à maior latência.
    Essa arquitetura é comum em sistemas multiprocessadores de alto desempenho, como servidores e supercomputadores, onde a escalabilidade e a otimização da memória são críticas.

#### Soluções de código aberto

-   oVirt:<https://www.ovirt.org/>

-   Proxmox:<https://www.proxmox.com/en/proxmox-virtual-environment/overview>

-   Oracle VirtualBox:<https://www.virtualbox.org/>

-   Abra o vSwitch:<https://www.openvswitch.org/>

#### Tipos de virtualização

##### Virtualização de Hardware (Virtualização de Servidor)

###### Definição de alta tensão

Abstrai o hardware físico para criar máquinas virtuais (VMs) que executam sistemas operacionais e aplicativos separados.

###### Casos de uso de alta tensão

Data centers, computação em nuvem, consolidação de servidores.

###### Exemplos de alta tensão

VMware ESXi, Microsoft Hyper-V, KVM.

##### Virtualização de sistema operacional (containerização)

###### Definição de conteinerização

Permite que várias instâncias isoladas do espaço do usuário (contêineres) sejam executadas em um único kernel do sistema operacional.

###### Casos de uso de conteinerização

Arquitetura de microsserviços, ambientes de desenvolvimento e testes.

###### Exemplos de conteinerização

Docker, Kubernetes, LXC.

##### Virtualização de rede

###### Definição de virtualização de rede

Combina recursos de rede de hardware e software em uma única entidade administrativa baseada em software.

###### Casos de uso de virtualização de rede

Rede definida por software (SDN), virtualização de funções de rede (NFV).

###### Exemplos de virtualização de rede

VMware NSX, Cisco ACI, OpenStack Neutron.

##### Virtualização de armazenamento

###### Definição de virtualização de armazenamento

Agrupa o armazenamento físico de vários dispositivos em uma única unidade de armazenamento virtual que pode ser gerenciada centralmente.

###### Casos de uso de definição de virtualização de armazenamento

Gerenciamento de dados, otimização de armazenamento, recuperação de desastres.

###### Exemplos de definição de virtualização de armazenamento

IBM SAN Volume Controller, VMware vSAN, NetApp ONTAP.

##### Virtualização de desktop

###### Definição de virtualização de desktop

Permite que um sistema operacional de desktop seja executado em uma máquina virtual hospedada em um servidor.

###### Casos de uso de definição de virtualização de desktop

Infraestrutura de desktop virtual (VDI), soluções de trabalho remoto.

###### Exemplos de definição de virtualização de desktop

Aplicativos e desktops virtuais Citrix, VMware Horizon, serviços de desktop remoto da Microsoft.

##### Virtualização de aplicativos

###### Definição de virtualização de aplicativos

Separa aplicativos do hardware e do sistema operacional subjacentes, permitindo que sejam executados em ambientes isolados.

###### Casos de uso de definição de virtualização de aplicativos

Implantação simplificada de aplicativos, testes de compatibilidade.

###### Exemplos de definição de virtualização de aplicativos

VMware ThinApp, Microsoft App-V, Citrix XenApp.

##### Virtualização de dados

###### Definição de virtualização de dados

Integra dados de diversas fontes sem consolidá-los fisicamente, fornecendo uma visão unificada para análise e relatórios.

###### Casos de uso de definição de virtualização de dados

Inteligência de negócios, integração de dados em tempo real.

###### Exemplos de definição de virtualização de dados

Denodo, Red Hat JBoss Data Virtualization, IBM InfoSphere.

##### Benefícios da virtualização

-   Eficiência de Recursos: Melhor utilização dos recursos físicos.
-   Economia de custos: Redução de custos operacionais e de hardware.
-   Escalabilidade: Fácil de aumentar ou diminuir de acordo com a demanda.
-   Flexibilidade: oferece suporte a uma variedade de cargas de trabalho e aplicativos.
-   Recuperação de desastres: Processos simplificados de backup e recuperação.
-   Isolamento: Maior segurança através do isolamento de ambientes.

<p align="right">(<a href="#topic-351.1">back to sub Topic 351.1</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.2"></a>

### 351.2 Xen

![xen-architecture](images/xen-achitecture.png)

![xen-architecture](images/xen-achitecture2.png)

**Peso:**3

**Descrição:**Os candidatos devem ser capazes de instalar, configurar, manter, migrar e solucionar problemas de instalações do Xen. O foco está no Xen versão 4.x.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura do Xen, incluindo rede e armazenamento
-   Configuração básica de nós e domínios Xen
-   Gerenciamento básico de nós e domínios Xen
-   Solução de problemas básicos de instalações Xen
-   Avareza de COMPRIMIDOS
-   Conhecimento do XenStore
-   Conhecimento dos parâmetros de inicialização do Xen
-   Conscientização do utilitário xm

#### Xen

![panda](images/xen-panda.png)

Xen é um hipervisor tipo 1 (bare metal) de código aberto, que permite que vários sistemas operacionais sejam executados simultaneamente no mesmo hardware físico.  
O Xen fornece uma camada entre o hardware físico e as máquinas virtuais (VMs), permitindo o compartilhamento e o isolamento eficientes de recursos.

-   **Arquitetura:**O Xen opera com um sistema de duas camadas onde o Domínio 0 (Dom0) é o domínio privilegiado com acesso direto ao hardware e gerencia o hipervisor. Outras máquinas virtuais, chamadas Domain U (DomU), executam sistemas operacionais convidados e são gerenciadas pelo Dom0.
-   **Tipos de virtualização:**O Xen suporta paravirtualização (PV), que requer sistema operacional convidado modificado, e virtualização assistida por hardware (HVM), que usa extensões de hardware (por exemplo, Intel VT-x ou AMD-V) para executar sistemas operacionais convidados não modificados.
    O Xen é amplamente utilizado em ambientes de nuvem, principalmente pela Amazon Web Services (AWS) e outros provedores de nuvem de grande escala.

#### XenSource

XenSource foi a empresa fundada pelos desenvolvedores originais do hipervisor Xen na Universidade de Cambridge para comercializar o Xen.  
A empresa forneceu soluções empresariais baseadas no Xen e ofereceu ferramentas e suporte adicionais para aprimorar os recursos do Xen para uso empresarial.

-   **Aquisição pela Citrix**: Em 2007, a XenSource foi adquirida pela Citrix Systems, Inc. A Citrix usou a tecnologia Xen como base para seu produto Citrix XenServer, que se tornou uma popular plataforma de virtualização de nível empresarial baseada em Xen.
-   **Transição**: Após a aquisição, o projeto Xen continuou como um projeto de código aberto, enquanto a Citrix se concentrou em ofertas comerciais como o XenServer, aproveitando a tecnologia XenSource.

#### Projeto Xen

Projeto Xen refere-se à comunidade e iniciativa de código aberto responsável pelo desenvolvimento e manutenção do hipervisor Xen após sua comercialização.  
O Projeto Xen opera sob a Linux Foundation, com foco na construção, melhoria e suporte do Xen como um esforço colaborativo e voltado para a comunidade.

-   **Metas:**O Projeto Xen visa avançar o hipervisor melhorando seu desempenho, segurança e conjunto de recursos para uma ampla gama de casos de uso, incluindo computação em nuvem, virtualização focada em segurança (por exemplo, Qubes OS) e sistemas embarcados.
-   **Colaboradores:**O projeto inclui colaboradores de diversas organizações, incluindo grandes provedores de nuvem, fornecedores de hardware e desenvolvedores independentes.
-   **COMPRIMIDOS E HANTOOLS:**O Projeto Xen também inclui ferramentas como XAPI (XenAPI), que é usado para gerenciar instalações de hipervisores Xen, e vários outros utilitários para gerenciamento e otimização do sistema.

#### XenStore

Xen Store é um componente crítico do Xen Hypervisor.  
Essencialmente, o Xen Store é um banco de dados de valores-chave distribuído usado para comunicação e compartilhamento de informações entre o hipervisor Xen e as máquinas virtuais (também conhecidas como domínios) que ele gerencia.

Aqui estão alguns aspectos principais da Xen Store:

-   **Comunicação entre domínios:**O Xen Store permite a comunicação entre domínios, como Dom0 (o domínio privilegiado que controla os recursos de hardware) e DomUs (domínios de usuários, que são as VMs). Isso é feito por meio de entradas de valores-chave, onde cada domínio pode ler ou gravar informações.

-   **Gerenciamento de configuração:**Ele é usado para armazenar e acessar informações de configuração, como dispositivos virtuais, rede e parâmetros de inicialização. Isso facilita o gerenciamento dinâmico e a configuração de VMs.

-   **Eventos e notificações:**A Xen Store também oferece suporte a notificações de eventos. Quando uma chave ou valor específico na Xen Store é modificado, os domínios interessados ​​podem ser notificados para reagir a essas mudanças. Isso é útil para monitorar e gerenciar recursos.

-   API simples: O Xen Store fornece uma API simples para leitura e gravação de dados, facilitando aos desenvolvedores a integração de seus aplicativos com o sistema de virtualização Xen.

#### Pílula

XAPI, ou XenAPI, é a interface de programação de aplicativos (API) usada para gerenciar o hipervisor Xen e suas máquinas virtuais (VMs).  
XAPI é um componente chave do XenServer (agora conhecido como Citrix Hypervisor) e fornece uma maneira padronizada de interagir com o hipervisor Xen para executar operações como criação, configuração, monitoramento e controle de VMs.

Aqui estão alguns aspectos importantes do XAPI:

-   **Gerenciamento de VM:**XAPI permite que os administradores criem, excluam, iniciem e parem máquinas virtuais de maneira programática.

-   **Automação:**Com o XAPI, é possível automatizar o gerenciamento de recursos virtuais, incluindo rede, armazenamento e computação, o que é crucial para grandes ambientes de nuvem.

-   **Integração:**O XAPI pode ser integrado a outras ferramentas e scripts para fornecer uma administração mais eficiente e personalizada do ambiente Xen.

-   **Controle de acesso:**A XAPI também fornece mecanismos de controle de acesso para garantir que apenas usuários autorizados possam realizar operações específicas no ambiente virtual.

XAPI é a interface que permite o controle e automação do Hipervisor Xen, facilitando o gerenciamento de ambientes virtualizados.

#### Resumo Xen

-   **Xen:**A principal tecnologia de hipervisor que permite que máquinas virtuais sejam executadas em hardware físico.
-   **XenFonte:**Empresa que comercializou o Xen, posteriormente adquirida pela Citrix, levando ao desenvolvimento do Citrix XenServer.
-   **Projeto Xen:**A iniciativa e comunidade de código aberto que continua a desenvolver e manter o hipervisor Xen sob a Linux Foundation.
-   **XenStore:**A Xen Store atua como intermediária de comunicação e configuração entre o hipervisor Xen e as VMs, agilizando a operação e o gerenciamento de ambientes virtualizados.
-   **Pílula**é a interface que permite o controle e automação do Hipervisor Xen, facilitando o gerenciamento de ambientes virtualizados.

#### Domínio0 (Dom0)

Domain0, ou Dom0, é o domínio de controle em uma arquitetura Xen. Gerencia outros domínios (DomUs) e tem acesso direto ao hardware.  
Dom0 executa drivers de dispositivos, permitindo que DomUs, que não possuem acesso direto ao hardware, se comuniquem com os dispositivos. Normalmente, é uma instância completa de um sistema operacional, como o Linux, e é essencial para a operação do hipervisor Xen.

#### DomínioU (DomU)

DomUs são domínios não privilegiados que executam máquinas virtuais.  
Eles são gerenciados pelo Dom0 e não têm acesso direto ao hardware. DomUs podem ser configurados para executar diferentes sistemas operacionais e são usados ​​para diversos fins, como servidores de aplicativos e ambientes de desenvolvimento. Eles contam com Dom0 para interação de hardware.

#### PV-DOMU (Domínio Paranormalizado)

PV-DomUs usam uma técnica chamada paravirtualização. Neste modelo, o sistema operacional DomU é modificado para saber que roda em um ambiente virtualizado, permitindo a comunicação direta com o hipervisor para desempenho otimizado.  
Isso resulta em menor sobrecarga e melhor eficiência em comparação com a virtualização completa.

#### HVM-DomU (Domínio de Máquina Virtual de HardwareU)

HVM-DomUs são máquinas virtuais que utilizam virtualização completa, permitindo a execução de sistemas operacionais não modificados. O hipervisor Xen fornece emulação de hardware para esses DomUs, permitindo-lhes executar qualquer sistema operacional que suporte a arquitetura de hardware subjacente.  
Embora isso ofereça maior flexibilidade, pode resultar em sobrecarga maior em comparação com PV-DomUs.

#### Rede Xen

Dispositivos de rede paravirtualizados![pv-networking](images/xen-networking2.png)

Ponte![pv-networking](images/xen-networking1.png)

#### 351.2 Objetos Citados

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

#### 351.2 Notas

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
```

#### 351.2 Comandos Importantes

##### xen-create-image

```sh
# create a pv image
xen-create-image \
  --hostname=lpic3-pv-guest \
  --memory=1gb \
  --vcpus=2 \
  --lvm=vg_xen \
  --dhcp \
  --pygrub \
  --dist=bookworm
```

##### xen-delete-image

```sh
# delete a pv image
xen-delete-image lpic3-pv-guest --lvm=vg_xen
```

##### brctl

```sh
# list xen interfaces
brctl show
```

##### XL

```sh
# view xen information
xl infos

# list Domains
xl list

# view dmesg information
xl dmesg

# monitoring domain
xl top
xentop
xen top

# Limit mem Dom0
xl mem-set 0 2048

# Limite cpu (not permanent after boot)
xl vcpu-set 0 2

# manual conf
man xl.conf

# manual cfg - about guest configuration
man xl.cfg

# create DomainU - virtual machines
xl create /etc/xen/lpic3-pv-guest.cfg

# create DomainU virtual machine and connect to guest
xl create -c /etc/xen/lpic3-pv-guest.cfg

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
```

<p align="right">(<a href="#topic-351.2">back to sub Topic 351.2</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.3"></a>

### 351.3 QEMU

**Peso:**4

**Descrição:**Os candidatos devem ser capazes de instalar, configurar, manter, migrar e solucionar problemas de instalações do QEMU.

**Principais áreas de conhecimento:**

-   Understand the architecture of QEMU, including KVM, networking and storage
-   Inicie instâncias do QEMU na linha de comando
-   Gerencie instantâneos usando o monitor QEMU
-   Instale os drivers de dispositivo QEMU Guest Agent e VirtIO
-   Solucionar problemas de instalações QEMU, incluindo rede e armazenamento
-   Conscientização de parâmetros importantes de configuração do QEMU

#### 351.3 Objetos Citados

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

#### 351.3 Comandos Importantes

##### IP

```sh
# list links
ip link show
```

<p align="right">(<a href="#topic-351.3">back to sub Topic 351.3</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.4"></a>

### 351.4 Gerenciamento de máquina virtual Libvirt

**Peso:**9

**Descrição:**Os candidatos devem ser capazes de gerenciar hosts de virtualização e máquinas virtuais (“domínios libvirt”) usando libvirt e ferramentas relacionadas.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura da libvirt
-   Gerenciar conexões e nós libvirt
-   Crie e gerencie domínios QEMU e Xen, incluindo snapshots
-   Gerencie e analise o consumo de recursos de domínios
-   Crie e gerencie pools de armazenamento e volumes
-   Crie e gerencie redes virtuais
-   Migrar domínios entre nós
-   Entenda como a libvirt interage com o Xen e o QEMU
-   Entenda como a libvirt interage com serviços de rede como dnsmasq e radvd
-   Entenda os arquivos de configuração XML da libvirt
-   Conscientização sobre virtlogd e virtlockd

#### 351.4 Objetos Citados

```sh
libvirtd
/etc/libvirt/
virsh (including relevant subcommands)
```

#### 351.4 Comandos Importantes

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-351.4">back to sub Topic 351.4</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.5"></a>

### 351.5 Gerenciamento de imagem de disco de máquina virtual

**Peso:**3

**Descrição:**Os candidatos devem ser capazes de gerenciar imagens de disco de máquinas virtuais. Isso inclui a conversão de imagens de disco entre vários formatos e hipervisores e o acesso a dados armazenados em uma imagem.

**Principais áreas de conhecimento:**

-   Compreenda os recursos de vários formatos de imagem de disco virtual, como imagens brutas, qcow2 e VMDK
-   Gerencie imagens de disco de máquinas virtuais usando qemu-img
-   Monte partições e acesse arquivos contidos em imagens de disco de máquinas virtuais usando libguestfish
-   Copie o conteúdo do disco físico para uma imagem de disco de máquina virtual
-   Migrar conteúdo de disco entre vários formatos de imagem de disco de máquina virtual
-   Conscientização do Formato de Virtualização Aberto (OVF)

#### 351,5 Objetos Citados

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
virt-resize
virt-sparsify
virt-p2v
virt-p2v-make-disk
virt-v2v
virt-sysprep
```

#### 351.5 Comandos Importantes

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-351.5">back to sub Topic 351.5</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352"></a>

## Tópico 352: Virtualização de contêineres

* * *

<a name="topic-352.1"></a>

### 352.1 Conceitos de virtualização de contêineres

**Peso:**7

**Descrição:**Os candidatos devem compreender o conceito de virtualização de contêineres. Isso inclui compreender os componentes do Linux usados ​​para implementar a virtualização de contêineres, bem como usar ferramentas padrão do Linux para solucionar problemas desses componentes.

**Principais áreas de conhecimento:**

-   Compreenda os conceitos de sistema e contêiner de aplicativo
-   Compreender e analisar namespaces de kernel
-   Compreender e analisar grupos de controle
-   Compreender e analisar capacidades
-   Entenda a função do seccomp, SELinux e AppArmor para virtualização de contêineres
-   Entenda como LXC e Docker aproveitam namespaces, cgroups, capacidades, seccomp e MAC
-   Entenda o princípio do runc
-   Entenda o princípio do CRI-O e do containerd
-   Conhecimento do tempo de execução do OCI e das especificações de imagem
-   Conhecimento da Interface de Tempo de Execução de Contêiner (CRI) do Kubernetes
-   Consciência de podman, buildah e escopo
-   Conhecimento de outras abordagens de virtualização de contêineres no Linux e outros sistemas operacionais livres, como rkt, OpenVZ, systemd-nspawn ou BSD Jails

```mermaid
timeline
    title Time Line Containers Evolution
    1979 : chroot
    2000 : FreeBSD Jails
    2004 : Solaris Containers
    2006 : cgroups
    2008 : LXC
    2013 : Docker
    2014 : Kubernetes
```

#### 352.1 Objetos Citados

```sh
nsenter
unshare
ip (including relevant subcommands)
capsh
/sys/fs/cgroups
/proc/[0-9]+/ns
/proc/[0-9]+/status
```

#### 352.1 Comandos Importantes

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-352.1">back to sub topic 352.1</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.2"></a>

### 352,2 LXC

**Peso:**6

**Descrição:**Os candidatos devem ser capazes de usar contêineres de sistema usando LXC e LXD. A versão do LXC coberta é 3.0 ou superior.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura do LXC e LXD
-   Gerencie contêineres LXC com base em imagens existentes usando LXD, incluindo rede e armazenamento
-   Configurar propriedades do contêiner LXC
-   Limitar o uso de recursos do contêiner LXC
-   Use perfis LXD
-   Entenda as imagens LXC
-   Conhecimento das ferramentas LXC tradicionais

#### 352.2 Objetos Citados

```sh
lxd
lxc (including relevant subcommands)
```

#### 352.2 Comandos Importantes

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-352.2">back to sub topic 352.2</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.3"></a>

### 352.3 Docker

**Peso:**9

**Descrição:**O candidato deve ser capaz de gerenciar nós Docker e contêineres Docker. Isso inclui compreender a arquitetura do Docker, bem como compreender como o Docker interage com o sistema Linux do nó.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura e os componentes do Docker
-   Gerencie contêineres do Docker usando imagens de um registro do Docker
-   Compreenda e gerencie imagens e volumes para contêineres Docker
-   Compreenda e gerencie o registro em log para contêineres Docker
-   Compreenda e gerencie redes para Docker
-   Use Dockerfiles para criar imagens de contêiner
-   Execute um registro Docker usando a imagem Docker do registro

#### 352.3 Objetos Citados

```sh
dockerd
/etc/docker/daemon.json
/var/lib/docker/
docker
Dockerfile
```

#### 352.3 Comandos Importantes

##### janela de encaixe

```sh
# Examples of docker
```

<p align="right">(<a href="#topic-352.3">back to sub topic 352.3</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.4"></a>

### 352.4 Plataformas de Orquestração de Contêineres

**Peso:**3

**Descrição:**Os candidatos devem compreender a importância da orquestração de contêineres e os conceitos-chave que Docker Swarm e Kubernetes fornecem para implementar a orquestração de contêineres.

**Principais áreas de conhecimento:**

-   Entenda a relevância da orquestração de contêineres
-   Entenda os principais conceitos do Docker Compose e do Docker Swarm
-   Compreenda os principais conceitos de Kubernetes e Helm
-   Conscientização sobre OpenShift, Rancher e Mesosphere DC/OS

<p align="right">(<a href="#topic-352.4">back to sub topic 352.4</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353"></a>

## Tópico 353: Implantação e provisionamento de VM

* * *

<a name="topic-353.1"></a>

### 353.1 Ferramentas de gerenciamento de nuvem

**Peso:**2

**Descrição:**Os candidatos devem compreender as ofertas comuns em nuvens públicas e ter conhecimento básico dos recursos das ferramentas de gerenciamento de nuvem comumente disponíveis.

**Principais áreas de conhecimento:**

-   Entenda as ofertas comuns em nuvens públicas
-   Conhecimento básico de recursos do OpenStack
-   Conhecimento básico de recursos do Terraform
-   Conscientização sobre CloudStack, Eucalyptus e OpenNebula

#### 353.1 Objetos Citados

```sh
IaaS, PaaS, SaaS
OpenStack
Terraform
```

#### 353.1 Comandos Importantes

##### foo

```sh
# examples
```

<p align="right">(<a href="#topic-353.1">back to sub topic 353.1</a>)</p>
<p align="right">(<a href="#topic-353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.2"></a>

### 353.2 Empacotador

**Peso:**2

**Descrição:**Os candidatos devem ser capazes de usar o Packer para criar imagens de sistema. Isso inclui a execução do Packer em vários ambientes de nuvem pública e privada, bem como a construção de imagens de contêiner para LXC/LXD.

**Principais áreas de conhecimento:**

-   Entenda a funcionalidade e os recursos do Packer
-   Criar e manter arquivos de modelo
-   Crie imagens a partir de arquivos de modelo usando diferentes construtores

#### 353.2 Objetos Citados

```sh
packer
```

#### 353.2 Comandos Importantes

##### empacotador

```sh
# examples
```

<p align="right">(<a href="#topic-353.2">back to sub topic 353.2</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.3"></a>

### 353,3 nuvem-init

**Peso:**3

**Descrição:**Os candidatos devem ser capazes de usar o cloud-init para configurar máquinas virtuais criadas a partir de imagens padronizadas. Isso inclui ajustar as máquinas virtuais para corresponder aos recursos de hardware disponíveis, especificamente espaço em disco e volumes.  
Além disso, os candidatos devem ser capazes de configurar instâncias para permitir logins SSH seguros e instalar um conjunto específico de pacotes de software.  
Além disso, os candidatos devem ser capazes de criar novas imagens de sistema com suporte para cloud-init.

**Principais áreas de conhecimento:**

-   Compreender os recursos e conceitos do cloud-init, incluindo dados do usuário, inicialização e configuração do cloud-init
-   Use cloud-init para criar, redimensionar e montar sistemas de arquivos, configurar contas de usuário, incluindo credenciais de login, como chaves SSH e instalar pacotes de software do repositório da distribuição
-   Integre o cloud-init às imagens do sistema
-   Use a fonte de dados da unidade de configuração para teste

#### 353.3 Objetos Citados

```sh
cloud-init
user-data
/var/lib/cloud/
```

#### 353.3 Comandos Importantes

##### foo

```sh
# examples
```

<p align="right">(<a href="#topic-353.3">back to sub topic 353.3</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.4"></a>

### 353.4 Vagabundo

**Peso:**3

**Descrição:**O candidato deverá ser capaz de usar o Vagrant para gerenciar máquinas virtuais, incluindo o provisionamento da máquina virtual.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura e os conceitos do Vagrant, incluindo armazenamento e rede
-   Recuperar e usar caixas do Atlas
-   Crie e execute Vagrantfiles
-   Acesse máquinas virtuais Vagrant
-   Compartilhe e sincronize pastas entre uma máquina virtual Vagrant e o sistema host
-   Entenda o provisionamento do Vagrant, ou seja, provisionadores de arquivos e Shell
-   Entenda a configuração de várias máquinas

#### 353.4 Objetos Citados

```sh
vagrant
Vagrantfile
```

#### 353.4 Comandos Importantes

##### vagabundo

```sh
# examples
```

<p align="right">(<a href="#topic-353.4">back to sub topic 353.4</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## Contribuindo

As contribuições são o que tornam a comunidade de código aberto um lugar incrível para
aprender, inspirar e criar. Qualquer contribuição que você fizer será**muito apreciado**.

Se você tiver uma sugestão que possa melhorar isso, bifurque o repositório e
crie uma solicitação pull. Você também pode simplesmente abrir um problema com a tag “aprimoramento”.
Não se esqueça de dar uma estrela ao projeto! Obrigado novamente!

1.  Bifurque o projeto
2.  Crie sua ramificação de recursos (`git checkout -b feature/AmazingFeature`)
3.  Confirme suas alterações (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Abra uma solicitação pull

* * *

## Licença

-   Este projeto está licenciado sob a licença MIT \* consulte o arquivo LICENSE.md para obter detalhes

* * *

## Contato

Marcos Silvestrini[marcos.silvestrini@gmail.com](mailto:marcos.silvestrini@gmail.com)\\[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/mrsilvestrini.svg?style=social&label=Follow%20%40mrsilvestrini)](https://twitter.com/mrsilvestrini)

Link do projeto:<https://github.com/marcossilvestrini/learning-lpic-3-305-300>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## Agradecimentos

-   [Richard Stallman](http://www.stallman.org/)
-   [GNU](<>)
    -   [Perguntas frequentes sobre GNU/Linux por Richard Stallman](https://www.gnu.org/gnu/gnu-linux-faq.html)
    -   [GNU](https://www.gnu.org/)
    -   [Sistema operacional GNU](https://www.gnu.org/gnu/thegnuproject.html)
    -   [Compilador GCC](https://gcc.gnu.org/wiki/History)
    -   [GNU alcatrão](https://www.gnu.org/software/tar/)
    -   [GNU Make](https://www.gnu.org/software/make/)
    -   [GNU Emacs](https://en.wikipedia.org/wiki/Emacs)
    -   [Pacotes GNU](https://www.gnu.org/software/)
    -   [Coleção GNU/Linux](https://directory.fsf.org/wiki/Collection:GNU/Linux)
    -   [Carregador de inicialização GNU Grub](https://www.gnu.org/software/grub/)
    -   [GNU Hurd](https://www.gnu.org/software/hurd/hurd/what_is_the_gnu_hurd.html)
-   [Núcleo](<>)
    -   [Núcleo](https://www.kernel.org/)
    -   [Páginas de manual do kernel Linux](https://www.kernel.org/doc/man-pages/)
    -   [Compile seu kernel](https://wiki.linuxquestions.org/wiki/How_to_build_and_install_your_own_Linux_kernel)
-   [Base Padrão Linux](<>)
    -   [Base Padrão Linux](https://en.wikipedia.org/wiki/Linux_Standard_Base)
    -   [Padrão de hierarquia do sistema de arquivos](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)
    -   [Estrutura de hierarquia de arquivos](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.pdf)
-   [Software Livre](<>)
    -   [FSF](https://www.fsf.org)
    -   [Diretório de Software Gratuito](https://directory.fsf.org/wiki/Free_Software_Directory:Free_software_replacements)
-   [Licença](<>)
    -   [Software Livre](https://www.gnu.org/philosophy/free-sw.html)
    -   [Copyleft](https://www.gnu.org/licenses/copyleft.en.html)
    -   [GPL](https://www.gnu.org/licenses/quick-guide-gplv3.html)
    -   [Licença Pública Geral Menor GNU](https://www.gnu.org/licenses/lgpl-3.0.html)
    -   [BSD](https://opensource.org/licenses/BSD-3-Clause)
    -   [Iniciativa de código aberto](https://opensource.org/)
    -   [Creative Commons](https://creativecommons.org/)
    -   [Licença LTS](https://en.wikipedia.org/wiki/Long-term_support)
-   [Distribuições](<>)
    -   [Diretrizes de Software Livre Debian](https://www.debian.org/social_contract#guidelines)
    -   [Listar distribuição Linux](https://en.wikipedia.org/wiki/List_of_Linux_distributions)
    -   [Distrowatch](https://distrowatch.com/)
    -   [Comparação de distribuições Linux](https://en.wikipedia.org/wiki/Comparison_of_Linux_distributions)
-   [Ambientes de área de trabalho](<>)
    -   [Organização X11](https://www.x.org/wiki/)
    -   [Wayland](https://wayland.freedesktop.org/)
    -   [GNU GNOME](https://www.gnu.org/press/gnome-1.0.html)
    -   [GNOMO](https://www.gnome.org/)
    -   [XFCE](https://xfce.org/)
    -   [Plasma do KDE](https://kde.org/plasma-desktop/)
    -   [Harmonia](https://en.wikipedia.org/wiki/Harmony_(toolkit))
-   [Protocolos](<>)
    -   [HTTP](<>)
        -   [W3Techs](https://w3techs.com/)
        -   [Apache](https://www.apache.org/)
        -   [Diretivas Apache][def]
        -   [Códigos de status HTTP](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
        -   [Cifras fortes para Apache, nginx e Lighttpd](https://cipherlist.eu/)
        -   [Tutoriais SSL](https://www.golinuxcloud.com/blog/)
        -   [Configuração SSL Mozilla](https://ssl-config.mozilla.org/)
    -   [xRDP](https://bytexd.com/xrdp-centos/)
    -   [NTP](https://www.ntppool.org/en/)
-   [DNS](<>)
    -   [Vincular](https://www.isc.org/bind/)
    -   [Vincular registro](https://www.zytrax.com/books/dns/ch7/logging.html)
    -   [Lista de tipos de registro DNS](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
    -   [Lista de tipos de registro DNS](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
-   [Gerenciador de pacotes](<>)
    -   [Baixar pacotes](https://pkgs.org/)
    -   [Instalar pacotes](https://installati.one/)
    -   [Guia de instalação de pacotes](https://installati.one/)
-   [Script de shell](<>)
    -   [Bourne Novamente Concha](https://www.gnu.org/software/bash/manual/)
    -   [Shebang](https://bash.cyberciti.biz/guide/Shebang)
    -   [Variáveis ​​de ambiente](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)
    -   [Globulação GNU](https://man7.org/linux/man-pages/man7/glob.7.html)
    -   [Globulação](https://linuxhint.com/bash_globbing_tutorial/)
    -   [Citando](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
    -   [Expressões Regulares](https://www.gnu.org/software/grep/manual/html_node/Regular-Expressions.html)
    -   [Comando não encontrado](https://command-not-found.com/)
    -   [Gerador Bashrc](http://bashrcgenerator.com/)
    -   [Explique](https://explainshell.com/)
    -   [Tutorial Vim](https://www.openvim.com/)
    -   [Tutorial de script de shell do Linux](https://bash.cyberciti.biz/guide/Main_Page)
    -   [Exemplos de comandos](https://www.geeksforgeeks.org/)
-   [Outras ferramentas](<>)
    -   [Bugzila](https://bugzilla.kernel.org/)
    -   [Emblemas do GitHub](https://github.com/alexandresanlim/Badges4-README.md-Profile)
-   [Definições de virtualização](<>)
    -   [Chapéu Vermelho](https://www.redhat.com/pt-br/topics/virtualization/what-is-virtualization)
    -   [AWS](https://aws.amazon.com/pt/what-is/virtualization/)
    -   [IBM](https://www.ibm.com/topics/virtualization)
    -   [OpenSource.com](https://opensource.com/resources/virtualization)
-   [KVM](<>)
    -   [KVM (máquinas virtuais de kernel)](https://www.redhat.com/pt-br/topics/virtualization/what-is-KVM)
    -   [Ferramentas de gerenciamento KVM](https://www.linux-kvm.org/page/Management_Tools)
-   [Xen](<>)
    -   [XenServer](https://www.xenserver.com/)
    -   [Wiki XenProject](https://wiki.xenproject.org/wiki/Main_Page)
    -   [Interfaces de rede](https://wiki.xenproject.org/wiki/Xen_Networking#Virtual_Network_Interfaces)
    -   [Ferramentas Xen](https://xen-tools.org/software/)
    -   [Blog LPI: Virtualização Xen e Computação em Nuvem #01: Introdução](https://www.lpi.org/pt-br/blog/2020/10/01/xen-virtualization-and-cloud-computing-01-introduction/)
    -   [Blog do LPI: Virtualização Xen e Computação em Nuvem #02: Como o Xen faz o trabalho](https://www.lpi.org/blog/2020/10/08/xen-virtualization-and-cloud-computing-02-how-xen-does-job/)
    -   [Blog LPI: Virtualização Xen e Computação em Nuvem #04: Contêineres, OpenStack e Outras Plataformas Relacionadas](https://www.lpi.org/pt-br/blog/2020/10/22/xen-virtualization-and-cloud-computing-04-containers-openstack-and-other-related/)
    -   [Virtualização Xen e Computação em Nuvem #05: O Projeto Xen, Unikernels e o Futuro](https://www.lpi.org/pt-br/blog/2020/10/29/xen-virtualization-and-cloud-computing-05-xen-project-unikernels-and-future/)
    -   [Guia para iniciantes do projeto Xen](https://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide#Installing_the_Xen_Project_Software)
    -   [Livro maluco](https://wiki.xenproject.org/wiki/Book/HelloXenProject/0-Contents)
-   [Unikernel](https://www.lpi.org/blog/2020/10/29/xen-virtualization-and-cloud-computing-05-xen-project-unikernels-and-future/)
    -   [Unikraft](https://github.com/unikraft/unikraft)
    -   [Mirage OS](https://mirage.io/docs/hello-world)
    -   [HaLVM](https://galois.com/project/halvm/)
    -   [Exclusivo](https://github.com/solo-io/unik/blob/master/docs/providers/virtualbox.md)
-   [Documentos Openstack](<>)
    -   [Chapéu Vermelho](https://www.redhat.com/pt-br/topics/openstack)
-   [Abra o vSwitch](<>)
    -   [OVS Documento 4Linux](https://blog.4linux.com.br/open-vswitch-o-que-e-o-que-come-onde-vive)
-   [Exame LPIC-3 305-300](<>)
    -   [Objetivos LPIC-3 305-300](https://www.lpi.org/our-certifications/exam-305-objectives/)
    -   [Wiki LPIC-3 305-300](https://wiki.lpi.org/wiki/LPIC-305_Objectives_V3.0)
    -   [Material de aprendizagem LPIC-3 305-300](https://cursos.linuxsemfronteiras.com.br/courses/preparatorio-para-certificacao-lpic-3-305/)
    -   [Exame simulado LPIC-3 305-300 por ITexams](https://www.itexams.com/info/305-300)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<!-- MARKDOWN LINKS & IMAGES-->

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

[license-url]: https://github.com/marcossilvestrini/learning-lpic-3-305-300/blob/master/LICENSE

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555

[linkedin-url]: https://linkedin.com/in/marcossilvestrini

[def]: https://httpd.apache.org/docs/2.4/mod/directives.html
