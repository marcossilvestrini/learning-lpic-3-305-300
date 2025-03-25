<h1><a name="readme-top"></a></h1>

[![Create Release](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml)[![Translate README](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml)[![Deploy GitHub Pages](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml)[![Generate HTML and PDF](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml)[![PSScriptAnalyzer](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml)[![Slack Notification](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml)

* * *

[![MIT License][license-shield]][license-url][![Forks][forks-shield]][forks-url][![Stargazers][stars-shield]][stars-url][![Contributors][contributors-shield]][contributors-url][![Issues][issues-shield]][issues-url][![LinkedIn][linkedin-shield]][linkedin-url]

* * *

# Aprendendo LPIC-3 305-300

![LPIC3-305-300](images/lpic3-305-300.jpg)

<p align="center">
<strong>Explore the docs »</strong></a>
    <br />
    <a href="https://marcossilvestrini.github.io/learning-lpic-3-305-300/">Web Site</a>
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

> Este projeto tem como objetivo ajudar estudantes ou profissionais a aprender os principais conceitos de gnulinux
> e software livre \\
> Algumas distribuições de Gnulinux como Debian e RPM serão cobertas \\
> Instalação e configuração de alguns pacotes também serão cobertas \\
> Ao fazer isso, você pode dar a toda a comunidade a chance de se beneficiar de suas mudanças. \\
> O acesso ao código -fonte é uma condição prévia para isso. \\
> Use o Vagrant para máquinas UP e execute laboratórios e pratique o conteúdo deste artigo. \\
> Eu publiquei na pasta Vagrant A VagrantFile com o que é necessário \\
> para você fazer upload de um ambiente para estudos

* * *

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<a name="getting-started"></a>

## Começando

Para iniciar o aprendizado, consulte a documentação acima.

<a name="prerequisites"></a>

### Pré -requisitos

-   [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
-   [VMware WorkStation](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
-   [Utilitário VMware Vagrant](https://developer.hashicorp.com/vagrant/install/vmware)
-   [Vagabundo](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### Instalação

Clone o repo

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

Personalize um modelo_VagrantFile-Topic-xxx_. Este arquivo contém uma configuração VMS para laboratórios. Exemplo:

-   Arquivo[VagrantFile-Topic-351](./vagrant/Vagrantfile-topic-351)
    -   vm.clone_directory = "&lt;your_driver_letter>:\\<folder>\\&lt;para_machine>\\#{Vm_name} -instance-1 "
        Exemplo: vm.clone_directory = "e:\\Servidores\\VMware\\#{Vm_name} -instance-1 "
    -   vm.vmx["Memsize"]= ""
    -   vm.vmx[“NumVCPus”"]= ""
    -   vm.vmx["CPUID.CRERSESCOUT"]= ""

Personalize a configuração de rede em arquivos[Configs/Network](configs/network/).

* * *

<a name="usage"></a>

## Uso

Use este repositório para obter aprendizado sobre o exame LPIC-3 305-300

### Para cima e para baixo

Mudar a_VagrantFile-Topic-xxx_modelo e cópia para um novo arquivo com nome_VagrantFile_

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### Para reiniciar VMs

```sh
cd vagrant && vagrant reload
```

**Importante:**_Se você reiniciar VMs sem vagão, a pasta compartilhada não é montada após a inicialização._

### Use PowerShell para cima e para baixo

Se você usa a plataforma Windows, crio um script PowerShell para VMs para cima e para baixo.

```powershell
vagrant/up.ps1
vagrant/destroy.ps1
```

### Esquema de infraestrutura Tópico 351

![topic-351](images/infraestructure-topic-351.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="roadmap"></a>

## Roteiro

-   [x] Criar repositório
-   [x] Crie scripts para provisioning laboratórios
-   [x] Crie exemplos sobre o tópico 351
-   [ ] Crie exemplos sobre o tópico 352
-   [ ] Crie exemplos sobre o tópico 353
-   [ ] Carregue o ITEXAM simulado

* * *

<a name="freedoms"></a>

## Quatro liberdades essenciais

> 0.a liberdade para executar o programa como desejar, para qualquer finalidade (liberdade 0). \\
> 1.A liberdade para estudar como o programa funciona e muda para que \\
> sua computação como desejar (liberdade 1). \\
> O acesso ao código -fonte é uma condição prévia para isso. \\
> 2.A liberdade para redistribuir cópias para que você possa ajudar os outros (liberdade 2). \\
> 3.Freedom para distribuir cópias de suas versões modificadas para outras pessoas (liberdade 3).

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

## Tópico 351: Virtualização completa

![LPIC3-305-300](images/virtualization-351.png)

* * *

<a name="topic-351.1"></a>

### 351.1 Conceitos e teoria de virtualização

**Peso:**6

**Descrição:**Os candidatos devem conhecer e entender os conceitos gerais, a teoria e a terminologia da virtualização. Isso inclui terminologia Xen, Qemu e Libvirt.

**Principais áreas de conhecimento:**

-   Entenda a terminologia da virtualização
-   Entender os prós e contras da virtualização
-   Entenda as várias variações de hipervisores e monitores de máquinas virtuais
-   Entenda os principais aspectos da migração de máquinas físicas para virtuais
-   Entenda os principais aspectos da migração de máquinas virtuais entre os sistemas host
-   Entenda as características e implicações da virtualização para uma máquina virtual, como instantâneos, pausas, clonagem e limites de recursos
-   Consciência de Ovirt, Proxmox, Systemd Mathined e VirtualBox
-   Consciência do Vswitch aberto

#### 351.1 Objetos citados

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

##### Hypervisor tipo 1 (hipervisor nua-metal)

###### Definição do tipo 1

Executa diretamente no hardware físico do host, fornecendo uma camada base para gerenciar VMs sem a necessidade de um sistema operacional host.

###### Características do tipo 1

-   Alto desempenho e eficiência.
-   Latência inferior e sobrecarga.
-   Frequentemente usado em ambientes corporativos e data centers.

###### Exemplos do tipo 1

-   VMware ESXi: um hipervisor robusto e amplamente usado em configurações corporativas.
-   Microsoft Hyper-V: integrado ao Windows Server, oferecendo fortes recursos de desempenho e gerenciamento.
-   Xen: Um hipervisor de código aberto usado por muitos provedores de serviços em nuvem.
-   KVM (máquina virtual baseada em kernel): integrada ao kernel Linux, fornecendo alto desempenho para sistemas baseados em Linux.

##### Hypervisor tipo 2 (hipervisor hospedado)

###### Definição do tipo 2

Executa em cima de um sistema operacional convencional, contando com o sistema operacional host para gerenciamento de recursos e suporte ao dispositivo.

###### Características do tipo 2

-   Mais fácil de configurar e usar, especialmente em computadores pessoais.
-   Mais flexível para desenvolvimento, teste e implantações em menor escala.
-   Normalmente menos eficiente que os hipervisores do tipo 1 devido a uma sobrecarga adicional do sistema operacional do host.

###### Exemplos do tipo 2

-   VMware Workstation: um poderoso hipervisor para executar vários sistemas operacionais em uma única área de trabalho.
-   Oracle VirtualBox: um hipervisor de código aberto conhecido por sua flexibilidade e facilidade de uso.
-   Paralels Desktop: Projetado para usuários de Mac para executar o Windows e outros sistemas operacionais ao lado de MacOS.
-   Qemu (emulador rápido): um emulador de código aberto e virtualizador, geralmente usado em conjunto com o KVM.

##### Diferenças -chave entre os hipervisores do tipo 1 e do tipo 2

-   Ambiente de implantação:
    -   Os hipervisores tipo 1 são comumente implantados em data centers e ambientes corporativos devido à sua interação direta com hardware e alto desempenho.
    -   Os hipervisores do tipo 2 são mais adequados para tarefas de uso pessoal, desenvolvimento, teste e virtualização em pequena escala.
-   Desempenho:
    -   Os hipervisores do tipo 1 geralmente oferecem melhor desempenho e menor latência porque não confiam em um sistema operacional host.
    -   Os hipervisores do tipo 2 podem experimentar alguma degradação do desempenho devido à sobrecarga de execução no topo de um sistema operacional host.
-   Gerenciamento e facilidade de uso:
    -   Os hipervisores do tipo 1 requerem configuração e gerenciamento mais complexos, mas fornecem recursos avançados e escalabilidade para implantações em larga escala.
    -   Os hipervisores tipo 2 são mais fáceis de instalar e usar, tornando -os ideais para usuários individuais e projetos menores.

##### Tipos de migração

No contexto dos hipervisores, que são tecnologias usadas para criar e gerenciar máquinas virtuais, os termos migração de P2V e migração V2V são comuns em ambientes de virtualização.  
Eles se referem a processos de sistemas de migração entre diferentes tipos de plataformas.

##### P2V - Migração física para virtual

A migração de P2V refere -se ao processo de migrar um servidor físico para uma máquina virtual.  
Em outras palavras, um sistema operacional e seus aplicativos, executados em hardware físico dedicado, são "convertidos" e movidos para uma máquina virtual que é executada em um hipervisor (como VMware, Hyper-V, KVM, etc.).

-   Exemplo: você tem um servidor físico executando um sistema Windows ou Linux e deseja movê -lo para um ambiente virtual, como uma infraestrutura em nuvem ou um servidor de virtualização interna.  
    O processo envolve copiar todo o estado do sistema, incluindo o sistema operacional, drivers e dados, para criar uma máquina virtual equivalente que possa funcionar como se estivesse no hardware físico.

##### V2V - Migração virtual para virtual

A migração V2V refere -se ao processo de migrar uma máquina virtual de um hipervisor para outro.  
Nesse caso, você já possui uma máquina virtual em execução em um ambiente virtualizado (como o VMware) e deseja movê-lo para outro ambiente virtualizado (por exemplo, para Hyper-V ou para um novo servidor VMware).

-   Exemplo: você tem uma máquina virtual em execução em um servidor de virtualização do VMware, mas decide migrá-lo para uma plataforma Hyper-V. Nesse caso, a migração V2V converte a máquina virtual de um formato ou hipervisor para outro, garantindo que ela possa continuar funcionando corretamente.

#### HVM e paravirtualização

##### Virtualização assistida por hardware (HVM)

###### Definição de HVM

A HVM aproveita as extensões de hardware fornecidas pelas CPUs modernas para virtualizar o hardware, permitindo a criação e o gerenciamento de VMs com o mínimo de sobrecarga de desempenho.

###### Características -chave da HVM

-   **Suporte de hardware**: Requer suporte à CPU para extensões de virtualização, como Intel VT-X ou AMD-V.
-   **Virtualização completa:**As VMs podem executar sistemas operacionais de hóspedes não modificados, pois o hipervisor fornece uma emulação completa do ambiente de hardware.
-   **Desempenho:**Normalmente, oferece desempenho quase nativo devido à execução direta do código de convidado na CPU.
-   **Isolamento:**Fornece um forte isolamento entre as VMs, pois cada VM opera como se tivesse seu próprio hardware dedicado.

###### Exemplo de HVM

VMware Esxi, Microsoft Hyper-V, KVM (máquina virtual baseada em kernel).

###### Vantagens de HVM

-   **Compatibilidade:**Pode executar qualquer sistema operacional sem modificação.
-   **Desempenho:**Alto desempenho devido ao suporte de hardware.
-   **Segurança:**Recursos aprimorados de isolamento e segurança fornecidos pelo hardware.

###### Desvantagens de HVM

-   **Dependência de hardware:**Requer recursos específicos de hardware, limitando a compatibilidade com sistemas mais antigos.
-   **Complexidade:**Pode envolver configuração e gerenciamento mais complexos.

##### Paravirtualização

###### Definição de paravirtualização

A paravirtualização envolve a modificação do sistema operacional convidado para estar ciente do ambiente virtual, permitindo que ele interaja com mais eficiência com o hipervisor.

###### Características -chave da paravirtualização

-   **Modificação de convidados:**Requer alterações no sistema operacional convidado para se comunicar diretamente com o hipervisor usando hipercalls.
-   **Desempenho:**Pode ser mais eficiente que a virtualização completa tradicional, pois reduz a sobrecarga associada ao hardware emulando.
-   **Compatibilidade:**Limitado a sistemas operacionais que foram modificados para paravirtutualização.

###### Exemplos de paravirtualização

Xen com convidados paravirtualizados, ferramentas VMware em determinadas configurações e algumas configurações de KVM.

###### Vantagens de paravirtualização

-   **Eficiência:**Reduz a sobrecarga de virtualizar hardware, potencialmente oferecendo melhor desempenho para determinadas cargas de trabalho.
-   **Utilização de recursos:**Uso mais eficiente dos recursos do sistema devido à comunicação direta entre o sistema operacional convidado e o hipervisor.

###### Desvantagens de paravirtualização

-   **Modificação do sistema operacional convidado:**Requer modificações para o sistema operacional convidado, limitando a compatibilidade aos sistemas operacionais suportados.
-   **Complexidade:**Requer complexidade adicional no sistema operacional convidado para implementações de hipercall.

##### Principais diferenças

###### Requisitos do sistema operacional convidado

-   **HVM:**Pode executar sistemas operacionais de convidados não modificados.
-   **Paravirtutualização:**Requer que os sistemas operacionais de convidados sejam modificados para trabalhar com o hipervisor.

###### Desempenho

-   **HVM:**Normalmente, fornece desempenho quase nativo devido à execução assistida por hardware.
-   **Paravirtutualização:**Pode oferecer desempenho eficiente, reduzindo a sobrecarga da emulação de hardware, mas depende do sistema operacional convidado modificado.

###### Dependência de hardware

-   **HVM:**Requer recursos específicos da CPU (Intel VT-X, AMD-V).
-   **Paravirtutualização:**Não requer recursos específicos da CPU, mas precisa de um sistema operacional de convidado modificado.

###### Isolamento

-   **HVM:**Fornece um isolamento forte usando recursos de hardware.
-   **Paravirtutualização:**Depende do isolamento baseado em software, que pode não ser tão robusto quanto o isolamento baseado em hardware.

###### Complexidade

-   **HVM:**Geralmente mais simples de implantar, pois suporta o sistema operacional não modificado.
-   **Paravirtutualização:**Requer configuração e modificações adicionais para o sistema operacional convidado, aumentando a complexidade.

#### NUMA (acesso não uniforme de memória)

O NUMA (acesso não uniforme de memória) é uma arquitetura de memória usada em sistemas multiprocessadores para otimizar o acesso à memória pelos processadores.  
Em um sistema NUMA, a memória é distribuída de maneira desigual entre os processadores, o que significa que cada processador tem acesso mais rápido a uma parte da memória (sua "memória local") do que à memória que está fisicamente mais distante (referida como "memória remota") e associada a outros processadores.

##### Principais recursos da arquitetura NUMA

1.  **Memória local e remota**: Cada processador tem sua própria memória local, que pode acessar mais rapidamente. No entanto, também pode acessar a memória de outros processadores, embora isso leve mais tempo.
2.  **Latência diferenciada**: A latência do acesso à memória varia dependendo se o processador está acessando sua memória local ou a memória de outro nó. O acesso à memória local é mais rápido, enquanto o acesso à memória de outro nó (remoto) é mais lento.
3.  **Escalabilidade**: A arquitetura da NUMA foi projetada para melhorar a escalabilidade em sistemas com muitos processadores. À medida que mais processadores são adicionados, a memória também é distribuída, evitando o gargalo que ocorreria em uma arquitetura uniforme de acesso à memória (Uma).

##### Advantages of NUMA

-   Melhor desempenho em sistemas grandes: como cada processador possui memória local, ele pode funcionar com mais eficiência sem competir tanto com outros processadores pelo acesso à memória.
-   Escalabilidade: o NUMA permite sistemas com muitos processadores e grandes quantidades de memória para escalar de maneira mais eficaz em comparação com uma arquitetura da Uma.

##### Desvantagens

-   Complexidade da programação: os programadores precisam estar cientes de quais regiões de memória são locais ou remotas, otimizando o uso da memória local para obter um melhor desempenho.
-   Penalidades potenciais de desempenho: se um processador acessar frequentemente a memória remota, o desempenho poderá sofrer devido à maior latência.
    Essa arquitetura é comum em sistemas multiprocessadores de alto desempenho, como servidores e supercomputadores, onde a escalabilidade e a otimização da memória são críticas.

#### Soluções OpenSource

-   Ovirt:<https://www.ovirt.org/>

-   Proxmox:<https://www.proxmox.com/en/proxmox-virtual-environment/overview>

-   Oracle VirtualBox:<https://www.virtualbox.org/>

-   Aberto vswitch:<https://www.openvswitch.org/>

#### Tipos de virtualização

##### Virtualização de hardware (virtualização do servidor)

###### Definição de HV

Abstraia o hardware físico para criar máquinas virtuais (VMs) que executam sistemas e aplicativos operacionais separados.

###### Casos de uso de HV

Data centers, computação em nuvem, consolidação do servidor.

###### Exemplos de HV

VMware Esxi, Microsoft Hyper-V, KVM.

##### Virtualização do sistema operacional (contêinerização)

###### Definição de contêinerização

Permite que várias instâncias isoladas do espaço do usuário (contêineres) sejam executadas em um único kernel do sistema operacional.

###### Casos de uso de contêinerização

Ambientes de arquitetura, desenvolvimento e teste de microsserviços.

###### Exemplos de contêinerização

Docker, Kubernetes, LXC.

##### Virtualização de rede

###### Definição de virtualização de rede

Combina recursos de rede de hardware e software em uma única entidade administrativa baseada em software.

###### Casos de uso da virtualização de rede

Networking definido por software (SDN), Virtualização da Função de Rede (NFV).

###### Exemplos de virtualização de rede

VMware NSX, Cisco ACI, OpenStack Neutron.

##### Virtualização de armazenamento

###### Definição de virtualização de armazenamento

Pools armazenamento físico de vários dispositivos em uma única unidade de armazenamento virtual que pode ser gerenciada centralmente.

###### Casos de uso da definição de virtualização de armazenamento

Gerenciamento de dados, otimização de armazenamento, recuperação de desastres.

###### Exemplos de definição de virtualização de armazenamento

IBM SAN Volume Controller, VMware vsan, NetApp OTAP.

##### Virtualização da área de trabalho

###### Definição de virtualização da área de trabalho

Permite que um sistema operacional de desktop seja executado em uma máquina virtual hospedada em um servidor.

###### Casos de uso da definição de virtualização de desktop

Infraestrutura de Desktop Virtual (VDI), Soluções de Trabalho Remoto.

###### Exemplos de definição de virtualização de desktop

Citrix Apps e desktops Citrix, VMware Horizon, Microsoft Remote Desktop Services.

##### Virtualização de aplicativos

###### Definição de virtualização do aplicativo

Separa os aplicativos do hardware subjacente e do sistema operacional, permitindo que eles sejam executados em ambientes isolados.

###### Casos de uso da definição de virtualização de aplicativos

Implantação simplificada de aplicativos, teste de compatibilidade.

###### Exemplos de definição de virtualização de aplicativos

VMware ThinApp, Microsoft App-V, Citrix XenApp.

##### Virtualização de dados

###### Definição de virtualização de dados

Integra dados de várias fontes sem consolidá -los fisicamente, fornecendo uma visão unificada para análise e relatório.

###### Casos de uso da definição de virtualização de dados

Inteligência de negócios, integração de dados em tempo real.

###### Exemplos de definição de virtualização de dados

Denodo, Red Hat JBoss Virtualização de dados, IBM InfoSphere.

##### Benefícios da virtualização

-   Eficiência de recursos: melhor utilização de recursos físicos.
-   Economia de custos: hardware reduzido e custos operacionais.
-   Escalabilidade: fácil de aumentar ou diminuir de acordo com a demanda.
-   Flexibilidade: suporta uma variedade de cargas de trabalho e aplicativos.
-   Recuperação de desastres: processos simplificados de backup e recuperação.
-   Isolamento: segurança aprimorada através do isolamento de ambientes.

<p align="right">(<a href="#topic-351.1">back to sub Topic 351.1</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.2"></a>

### 351.2 Alternação

![xen-architecture](images/xen-achitecture.png)

![xen-architecture](images/xen-achitecture2.png)

**Peso:**3

**Descrição:**Os candidatos devem poder instalar, configurar, manter, migrar e solucionar problemas de instalações XEN. O foco está no Xen versão 4.x.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura de Xen, incluindo networking e armazenamento
-   Configuração básica dos nós e domínios Xen
-   Gerenciamento básico de nós e domínios Xen
-   Solução de problemas básicos de instalações Xen
-   Avarines fora da pílula
-   Consciência de Xenstore
-   Consciência dos parâmetros de inicialização do Xen
-   Consciência do utilitário XM

#### Alternar

![panda](images/xen-panda.png)

O XEN é um hipervisor de código aberto (sem metal), que permite que vários sistemas operacionais sejam executados simultaneamente no mesmo hardware físico.  
O Xen fornece uma camada entre o hardware físico e as máquinas virtuais (VMs), permitindo compartilhamento e isolamento eficientes de recursos.

-   **Arquitetura:**O Xen opera com um sistema de duas camadas em que o Domínio 0 (DOM0) é o domínio privilegiado com acesso direto ao hardware e gerencia o hipervisor. Outras máquinas virtuais, chamadas de domínio U (DOMU), executam sistemas operacionais convidados e são gerenciados pelo DOM0.
-   **Tipos de virtualização:**O XEN suporta paravirtualização (PV), que requer o sistema operacional convidado modificado e a virtualização assistida por hardware (HVM), que usa extensões de hardware (por exemplo, Intel VT-X ou AMD-V) para executar sistemas operacionais de convidados não modificados.
    O XEN é amplamente utilizado em ambientes em nuvem, principalmente pela Amazon Web Services (AWS) e outros provedores de nuvem em larga escala.

#### Xensource

A Xensource foi a empresa fundada pelos desenvolvedores originais do Xen Hypervisor da Universidade de Cambridge para comercializar Xen.  
A empresa forneceu soluções corporativas com base no XEN e ofereceu ferramentas e suporte adicionais para aprimorar os recursos do Xen para uso corporativo.

-   **Aquisição pela Citrix**: Em 2007, a Xensource foi adquirida pela Citrix Systems, Inc. A Citrix usou a tecnologia Xen como base para o seu produto Citrix Xenserver, que se tornou uma popular plataforma de virtualização de grau corporativo baseado em Xen.
-   **Transição**: Após a aquisição, o projeto Xen continuou como um projeto de código aberto, enquanto a Citrix se concentrou em ofertas comerciais como Xenserver, alavancando a tecnologia Xensource.

#### Projeto Xen

O projeto Xen refere-se à comunidade de código aberto e à iniciativa responsável pelo desenvolvimento e manutenção do hipervisor Xen após sua comercialização.  
O projeto Xen opera sob a Fundação Linux, com foco na construção, melhoria e apoio a Xen como um esforço colaborativo e orientado à comunidade.

-   **Metas:**O projeto XEN visa avançar o hipervisor, melhorando seu desempenho, segurança e conjunto de recursos para uma ampla gama de casos de uso, incluindo computação em nuvem, virtualização focada na segurança (por exemplo, Qubes OS) e sistemas incorporados.
-   **Colaboradores:**O projeto inclui colaboradores de várias organizações, incluindo os principais provedores de nuvem, fornecedores de hardware e desenvolvedores independentes.
-   **Pílula e hedools:**O projeto XEN também inclui ferramentas como XAPI (XenAPI), que é usado para gerenciar instalações do Xen Hypervisor e vários outros utilitários para gerenciamento e otimização do sistema.

#### Xenstore

A Xen Store é um componente crítico do hipervisor Xen.  
Essencialmente, o Xen Store é um banco de dados de valor-chave distribuído usado para comunicação e compartilhamento de informações entre o hypervisor Xen e as máquinas virtuais (também conhecidas como domínios) que ele gerencia.

Aqui estão alguns aspectos importantes da Xen Store:

-   **Comunicação entre domínios:**O Xen Store permite a comunicação entre domínios, como o DOM0 (o domínio privilegiado que controla os recursos de hardware) e o DOMUS (domínios do usuário, que são as VMs). Isso é feito através de entradas de valor-chave, onde cada domínio pode ler ou escrever informações.

-   **Gerenciamento de configuração:**É usado para armazenar e acessar informações de configuração, como dispositivos virtuais, redes e parâmetros de inicialização. Isso facilita o gerenciamento dinâmico e a configuração das VMs.

-   **Eventos e notificações:**A Xen Store também suporta notificações de eventos. Quando uma chave ou valor específica na loja Xen é modificada, os domínios interessados ​​podem ser notificados para reagir a essas alterações. Isso é útil para monitorar e gerenciar recursos.

-   API simples: a Xen Store fornece uma API simples para ler e escrever dados, facilitando os desenvolvedores para integrar seus aplicativos ao sistema de virtualização Xen.

#### Pílula

XAPI, ou Xenapi, é a interface de programação de aplicativos (API) usada para gerenciar o hipervisor Xen e suas máquinas virtuais (VMs).  
O XAPI é um componente essencial do Xenserver (agora conhecido como Citrix Hypervisor) e fornece uma maneira padronizada de interagir com o hipervisor Xen para executar operações como criar, configurar, monitorar e controlar VMs.

Aqui estão alguns aspectos importantes de Xapi:

-   **Gerenciamento de VM:**O XAPI permite que os administradores criem, excluam, excluam, iniciem e parem e parem e parem programaticamente as máquinas virtuais.

-   **Automação:**Com o XAPI, é possível automatizar o gerenciamento de recursos virtuais, incluindo redes, armazenamento e computação, o que é crucial para grandes ambientes em nuvem.

-   **Integração:**O XAPI pode ser integrado a outras ferramentas e scripts para fornecer administração mais eficiente e personalizada do ambiente XEN.

-   **Controle de acesso:**O XAPI também fornece mecanismos de controle de acesso para garantir que apenas usuários autorizados possam executar operações específicas no ambiente virtual.

O XAPI é a interface que permite o controle e a automação do hipervisor Xen, facilitando o gerenciamento de ambientes virtualizados.

#### Resumo Xen

-   **INCROPPING:**A tecnologia principal do hipervisor que permite que as máquinas virtuais sejam executadas em hardware físico.
-   **Xensource:**A empresa que comercializou Xen, mais tarde adquirida pela Citrix, levando ao desenvolvimento do Citrix Xenserver.
-   **Projeto Xen:**A iniciativa e a comunidade de código aberto que continuam a desenvolver e manter o hipervisor Xen sob a Fundação Linux.
-   **Xenstore:**A Xen Store atua como uma intermediária de comunicação e configuração entre o Hypervisor Xen e as VMs, simplificando a operação e o gerenciamento de ambientes virtualizados.
-   **Pílula**é a interface que permite o controle e a automação do hipervisor Xen, facilitando o gerenciamento de ambientes virtualizados.

#### Domain0 (DOM0)

Domain0, OR DOM0, é o domínio de controle em uma arquitetura Xen. Ele gerencia outros domínios (DOMUS) e tem acesso direto ao hardware.  
O DOM0 executa drivers de dispositivo, permitindo que o Domus, que não possua acesso direto ao hardware, se comunique com dispositivos. Normalmente, é uma instância completa de um sistema operacional, como o Linux, e é essencial para a operação de hipervisor do Xen.

#### Domínio (casa)

Domus são domínios não privilegiados que executam máquinas virtuais.  
Eles são gerenciados pelo DOM0 e não têm acesso direto ao hardware. O DOMUS pode ser configurado para executar diferentes sistemas operacionais e é usado para vários fins, como servidores de aplicativos e ambientes de desenvolvimento. Eles dependem do DOM0 para interação de hardware.

#### Peewee-dom (paravardiyed domina)

O PV-Domus usa uma técnica chamada paravirtutualização. Neste modelo, o sistema operacional DOMU é modificado para estar ciente de que ele é executado em um ambiente virtualizado, permitindo que ele se comunique diretamente com o hipervisor para o desempenho otimizado.  
Isso resulta em menor sobrecarga e melhor eficiência em comparação com a virtualização total.

#### HVM-domu (domínio da máquina virtual de hardware)

O HVM-Domus são máquinas virtuais que utilizam virtualização completa, permitindo que os sistemas operacionais não modificados sejam executados. O Xen Hypervisor fornece emulação de hardware para esses Domus, permitindo que eles executem qualquer sistema operacional que suporta a arquitetura de hardware subjacente.  
Embora isso ofereça maior flexibilidade, pode resultar em uma sobrecarga mais alta em comparação com o PV-Domus.

#### Rede Xen

Dispositivos de rede paravirtualizados![pv-networking](images/xen-networking2.png)

Ponte![pv-networking](images/xen-networking1.png)

#### 351.2 Objetos citados

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

# create simbolic link
ln -s /etc/xen/lpic3-pv-guest /etc/xen/auto/lpic3-pv-guest
```

#### 351.2 Comandos importantes

##### Imagem Xen-Criar

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

##### Imagens Xen-Lista

```sh
# list image
xen-list-image
```

##### Xen-Delete-Image

```sh
# delete a pv image
xen-delete-image lpic3-pv-guest --lvm=vg_xen
```

##### Xenstore-LS

```sh
# list xenstore infos
xenstore-ls
```

##### BRCTL

```sh
# list xen interfaces
brctl show
```

##### xl

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

# Limite cpu (not permanent after boot)
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

## open vcn conection in your vnc client with localhost
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

### 351.3 Qemu

![xen-kvm-qemu](/images/xen-kvm-qemu.png)

**Peso:**4

**Descrição:**Os candidatos devem poder instalar, configurar, manter, migrar e solucionar problemas de instalações QEMU.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura de Qemu, incluindo KVM, networking e armazenamento
-   Inicie as instâncias QEMU da linha de comando
-   Gerencie instantâneos usando o monitor qemu
-   Instale o agente convidado QEMU e os drivers de dispositivo virtio
-   Solucionar problemas de instalações QEMU, incluindo redes e armazenamento
-   Consciência de importantes parâmetros de configuração do QEMU

#### 351.3 Objetos citados

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

#### 351.3 Comandos importantes

##### IP

```sh
# list links
ip link show

# check if kvm is enabled
egrep -o '(vmx|svm)' /proc/cpuinfo
lscpu |grep Virtualization
lsmod|grep kvm
ls -l /dev/kvm
```

##### Verifique o módulo KVM

```sh
# check if kvm is enabled
egrep -o '(vmx|svm)' /proc/cpuinfo
lscpu |grep Virtualization
lsmod|grep kvm
ls -l /dev/kvm
```

<p align="right">(<a href="#topic-351.3">back to sub Topic 351.3</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.4"></a>

### 351.4 LibVirt Máquina virtual Gerenciamento

**Peso:**9

**Descrição:**Os candidatos devem ser capazes de gerenciar hosts de virtualização e máquinas virtuais ('LibVirt Domains') usando o LibVirt e as ferramentas relacionadas.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura do Libvirt
-   Gerenciar conexões e nós da LibVirt
-   Crie e gerencie domínios qemu e xen, incluindo instantâneos
-   Gerenciar e analisar o consumo de recursos de domínios
-   Crie e gerencie pools e volumes de armazenamento
-   Crie e gerencie redes virtuais
-   Migrar domínios entre nós
-   Entenda como o LibVirt interage com Xen e Qemu
-   Entenda como a LibVirt interage com serviços de rede, como Dnsmasq e RadVD
-   Entenda os arquivos de configuração do LibVirt XML
-   Consciência de VirtLogd e Virtlockd

#### 351.4 Objetos citados

```sh
libvirtd
/etc/libvirt/
virsh (including relevant subcommands)
```

#### 351.4 Comandos importantes

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-351.4">back to sub Topic 351.4</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.5"></a>

### 351.5 Gerenciamento de imagem em disco da máquina virtual

**Peso:**3

**Descrição:**Os candidatos devem poder gerenciar imagens de disco de máquinas virtuais. Isso inclui a conversão de imagens de disco entre vários formatos e hipervisores e acesso a dados armazenados em uma imagem.

**Principais áreas de conhecimento:**

-   Entenda os recursos de vários formatos de imagem de disco virtual, como imagens cruas, QCOW2 e VMDK
-   Gerenciar imagens de disco da máquina virtual usando Qemu-IMG
-   Monte Partições e Arquivos de Acesso contidos em imagens de disco da máquina virtual usando LibGuestfish
-   Copie o conteúdo do disco físico para uma imagem de disco da máquina virtual
-   Migrar o conteúdo do disco entre vários formatos de imagem de disco da máquina virtual
-   Consciência do formato de virtualização aberta (OVF)

#### 351.5 Objetos citados

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

#### 351.5 Comandos importantes

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

### 352.1 conceitos de virtualização de contêineres

**Peso:**7

**Descrição:**Os candidatos devem entender o conceito de virtualização de contêineres. Isso inclui a compreensão dos componentes do Linux usados ​​para implementar a virtualização de contêineres, bem como usar as ferramentas padrão do Linux para solucionar esses componentes.

**Principais áreas de conhecimento:**

-   Entenda os conceitos de sistema e contêiner de aplicativos
-   Entender e analisar namespaces de kernel
-   Entender e analisar grupos de controle
-   Entender e analisar recursos
-   Entenda o papel do Seccomp, Selinux e Apparmor for Container Virtualization
-   Entenda como o LXC e o Docker alavancam namespaces, cgroups, recursos, Seccomp e Mac
-   Entenda o princípio de Runc
-   Entenda o princípio de Cri-O e Containerd
-   Consciência das especificações de tempo de execução da OCI e imagem
-   Consciência da interface de tempo de execução do contêiner Kubernetes (CRI)
-   Consciência de Podman, Buildah e Scopeo
-   Consciência de outras abordagens de virtualização de contêineres no Linux e em outros sistemas operacionais gratuitos, como RKT, OpenVZ, Systemd-Nspawn ou BSD prisões

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

#### 352.1 Objetos citados

```sh
nsenter
unshare
ip (including relevant subcommands)
capsh
/sys/fs/cgroups
/proc/[0-9]+/ns
/proc/[0-9]+/status
```

#### 352.1 Comandos importantes

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-352.1">back to sub topic 352.1</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.2"></a>

### 352.2 LXC

**Peso:**6

**Descrição:**Os candidatos devem poder usar contêineres do sistema usando LXC e LXD. A versão do LXC coberta é 3,0 ou superior.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura do LXC e LXD
-   Gerencie recipientes LXC com base nas imagens existentes usando LXD, incluindo redes e armazenamento
-   Configurar propriedades de contêiner LXC
-   Limite o uso de recursos de contêiner LXC
-   Use perfis LXD
-   Entenda imagens LXC
-   Consciência das ferramentas tradicionais do LXC

#### 352.2 Objetos citados

```sh
lxd
lxc (including relevant subcommands)
```

#### 352.2 Comandos importantes

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

**Descrição:**O candidato deve ser capaz de gerenciar nós do Docker e recipientes do Docker. Isso inclui entender a arquitetura do Docker, além de entender como o Docker interage com o sistema Linux do nó.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura e componentes do Docker
-   Gerencie os contêineres do Docker usando imagens de um registro do Docker
-   Entenda e gerencie imagens e volumes para recipientes do Docker
-   Entenda e gerencie o log para recipientes do docker
-   Entenda e gerencie a rede para o Docker
-   Use DockerFiles para criar imagens de contêiner
-   Execute um registro do Docker usando a imagem do Docker do Registro

#### 352.3 Objetos citados

```sh
dockerd
/etc/docker/daemon.json
/var/lib/docker/
docker
Dockerfile
```

#### 352.3 Comandos importantes

##### Docker

```sh
# Examples of docker
```

<p align="right">(<a href="#topic-352.3">back to sub topic 352.3</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.4"></a>

### 352.4 Plataformas de orquestração de contêineres

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

## Tópico 353: implantação e provisionamento da VM

* * *

<a name="topic-353.1"></a>

### 353.1 Ferramentas de gerenciamento de nuvem

**Peso:**2

**Descrição:**Os candidatos devem entender as ofertas comuns em nuvens públicas e ter o conhecimento básico das ferramentas de gerenciamento de nuvem comumente disponíveis.

**Principais áreas de conhecimento:**

-   Entender ofertas comuns em nuvens públicas
-   Conhecimento básico de recurso do OpenStack
-   Feature Basic Feature Knowledge of Terraform
-   Consciência do CloudStack, Eucalyptus e Opennebula

#### 353.1 Objetos citados

```sh
IaaS, PaaS, SaaS
OpenStack
Terraform
```

#### 353.1 Comandos importantes

##### foo

```sh
# examples
```

<p align="right">(<a href="#topic-353.1">back to sub topic 353.1</a>)</p>
<p align="right">(<a href="#topic-353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.2"></a>

### 353.2 Packer

**Peso:**2

**Descrição:**Os candidatos devem poder usar o Packer para criar imagens do sistema. Isso inclui a execução do Packer em vários ambientes de nuvem pública e privada, além de criar imagens de contêineres para LXC/LXD.

**Principais áreas de conhecimento:**

-   Entenda a funcionalidade e os recursos do Packer
-   Crie e mantenha arquivos de modelo
-   Crie imagens a partir de arquivos de modelo usando diferentes construtores

#### 353.2 Objetos citados

```sh
packer
```

#### 353.2 Comandos importantes

##### Packer

```sh
# examples
```

<p align="right">(<a href="#topic-353.2">back to sub topic 353.2</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.3"></a>

### 353.3 Cloud-Init

**Peso:**3

**Descrição:**Os candidatos devem usar a entrada da nuvem para configurar máquinas virtuais criadas a partir de imagens padronizadas. Isso inclui o ajuste das máquinas virtuais para corresponder aos seus recursos de hardware disponíveis, especificamente, espaço em disco e volumes.  
Além disso, os candidatos devem poder configurar instâncias para permitir logins SSH seguros e instalar um conjunto específico de pacotes de software.  
Além disso, os candidatos devem ser capazes de criar novas imagens do sistema com suporte à initência da nuvem.

**Principais áreas de conhecimento:**

-   Compreendendo os recursos e conceitos de entrada de nuvem, incluindo dados de usuário, inicialização e configuração
-   Use Cloud-Init para criar, redimensionar e montar sistemas de arquivos, configurar contas de usuário, incluindo credenciais de login, como teclas SSH e instalar pacotes de software do repositório da distribuição
-   Integre a nuvem-ingressos nas imagens do sistema
-   Use Config Drive DataSource para testar

#### 353.3 Objetos citados

```sh
cloud-init
user-data
/var/lib/cloud/
```

#### 353.3 Comandos importantes

##### foo

```sh
# examples
```

<p align="right">(<a href="#topic-353.3">back to sub topic 353.3</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.4"></a>

### 353.4 Vagrant

**Peso:**3

**Descrição:**O candidato deve poder usar o Vagrant para gerenciar máquinas virtuais, incluindo o fornecimento da máquina virtual.

**Principais áreas de conhecimento:**

-   Entenda a arquitetura e os conceitos vagantes, incluindo armazenamento e rede
-   Recuperar e usar caixas do Atlas
-   Crie e execute o VagrantFiles
-   Acesse máquinas virtuais vagantes
-   Compartilhe e sincronize a pasta entre uma máquina virtual vagante e o sistema host
-   Entenda o provisionamento vagante, ou seja, provisionistas de arquivos e shell
-   Entenda a configuração de várias máquinas

#### 353.4 Objetos citados

```sh
vagrant
Vagrantfile
```

#### 353.4 Comandos importantes

##### vagabundo

```sh
# examples
```

<p align="right">(<a href="#topic-353.4">back to sub topic 353.4</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## Contribuindo

Contribuições são o que tornam a comunidade de código aberto um lugar tão incrível para
Aprenda, inspire e crie. Quaisquer contribuições que você faz são**muito apreciado**.

Se você tiver uma sugestão que melhoraria isso, bifór -se o repositório e
Crie uma solicitação de tração. Você também pode simplesmente abrir um problema com a tag "aprimoramento".
Não se esqueça de dar uma estrela ao projeto! Obrigado novamente!

1.  Bifurcar o projeto
2.  Crie sua filial de recursos (`git checkout -b feature/AmazingFeature`)
3.  Compreenda suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4.  Empurre para o ramo (`git push origin feature/AmazingFeature`)
5.  Abra um pedido de tração

* * *

## Licença

-   Este projeto está licenciado sob a licença do MIT \* Veja o arquivo License.md para obter detalhes

* * *

## Contato

Marcos Silvestrini -[marcos.silvestrini@gmail.com](mailto:marcos.silvestrini@gmail.com)\\[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/mrsilvestrini.svg?style=social&label=Follow%20%40mrsilvestrini)](https://twitter.com/mrsilvestrini)

Link do projeto:<https://github.com/marcossilvestrini/learning-lpic-3-305-300>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## Agradecimentos

-   [Richard Stallman's](http://www.stallman.org/)
-   [GNU](<>)
    -   [GNU/FAQ Linux por Richard Stallman](https://www.gnu.org/gnu/gnu-linux-faq.html)
    -   [GNU](https://www.gnu.org/)
    -   [Sistema operacional GNU](https://www.gnu.org/gnu/thegnuproject.html)
    -   [Compilador GCC](https://gcc.gnu.org/wiki/History)
    -   [GNU tar](https://www.gnu.org/software/tar/)
    -   [GNU faz](https://www.gnu.org/software/make/)
    -   [GNU Emacs](https://en.wikipedia.org/wiki/Emacs)
    -   [Pacotes GNU](https://www.gnu.org/software/)
    -   [Coleção GNU/Linux](https://directory.fsf.org/wiki/Collection:GNU/Linux)
    -   [GNU GRUB Bootloader](https://www.gnu.org/software/grub/)
    -   [GNU Hurd](https://www.gnu.org/software/hurd/hurd/what_is_the_gnu_hurd.html)
-   [Kernel](<>)
    -   [Kernel](https://www.kernel.org/)
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
    -   [GNU Licença pública geral menor](https://www.gnu.org/licenses/lgpl-3.0.html)
    -   [BSD](https://opensource.org/licenses/BSD-3-Clause)
    -   [Iniciativa de código aberto](https://opensource.org/)
    -   [Creative Commons](https://creativecommons.org/)
    -   [Licença LTS](https://en.wikipedia.org/wiki/Long-term_support)
-   [Distos](<>)
    -   [Diretrizes de software livre do Debian](https://www.debian.org/social_contract#guidelines)
    -   [Lista de distribuição Linux](https://en.wikipedia.org/wiki/List_of_Linux_distributions)
    -   [Distrowatch](https://distrowatch.com/)
    -   [Comparação Distribuições Linux](https://en.wikipedia.org/wiki/Comparison_of_Linux_distributions)
-   [Ambientes de mesa](<>)
    -   [X11 org](https://www.x.org/wiki/)
    -   [Wayland](https://wayland.freedesktop.org/)
    -   [GNU Gnome](https://www.gnu.org/press/gnome-1.0.html)
    -   [GNOMO](https://www.gnome.org/)
    -   [Xfce](https://xfce.org/)
    -   [Onde plasma](https://kde.org/plasma-desktop/)
    -   [Harmonia](https://en.wikipedia.org/wiki/Harmony_(toolkit))
-   [Protocolos](<>)
    -   [Http](<>)
        -   [W3Techs](https://w3techs.com/)
        -   [Apache](https://www.apache.org/)
        -   [Diretivas Apache][def]
        -   [Códigos de status HTTP](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
        -   [Cifras fortes para Apache, Nginx e LightTPD](https://cipherlist.eu/)
        -   [Tutoriais da SSL](https://www.golinuxcloud.com/blog/)
        -   [SSL Config Mozilla](https://ssl-config.mozilla.org/)
    -   [XRDP](https://bytexd.com/xrdp-centos/)
    -   [Ntp](https://www.ntppool.org/en/)
-   [Dns](<>)
    -   [Vincular](https://www.isc.org/bind/)
    -   [Vincular o log](https://www.zytrax.com/books/dns/ch7/logging.html)
    -   [Lista de tipos de registro DNS](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
    -   [Lista de tipos de registro DNS](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
-   [Gerente de pacotes](<>)
    -   [Baixar pacotes](https://pkgs.org/)
    -   [Instale pacotes](https://installati.one/)
    -   [Guia de instalação de pacotes](https://installati.one/)
-   [Script de shell](<>)
    -   [Bourne novamente Shell](https://www.gnu.org/software/bash/manual/)
    -   [Shebang](https://bash.cyberciti.biz/guide/Shebang)
    -   [Variáveis ​​de ambiente](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)
    -   [GNU Globbing](https://man7.org/linux/man-pages/man7/glob.7.html)
    -   [Globbing](https://linuxhint.com/bash_globbing_tutorial/)
    -   [Citando](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
    -   [Expressões regulares](https://www.gnu.org/software/grep/manual/html_node/Regular-Expressions.html)
    -   [Comando não encontrado](https://command-not-found.com/)
    -   [Bash gerador de prompt](https://bash-prompt-generator.org/)
    -   [Explique a casca](https://explainshell.com/)
    -   [Tutorial Vim](https://www.openvim.com/)
    -   [Tutorial de script linux shell](https://bash.cyberciti.biz/guide/Main_Page)
    -   [Comandos exemplos](https://www.geeksforgeeks.org/)
-   [Outras ferramentas](<>)
    -   [Bugzila](https://bugzilla.kernel.org/)
    -   [Crachás do github](https://github.com/alexandresanlim/Badges4-README.md-Profile)
-   [Definições de virtualização](<>)
    -   [Chapéu vermelho](https://www.redhat.com/pt-br/topics/virtualization/what-is-virtualization)
    -   [AWS](https://aws.amazon.com/pt/what-is/virtualization/)
    -   [IBM](https://www.ibm.com/topics/virtualization)
    -   [OpenSource.com](https://opensource.com/resources/virtualization)
-   [Alternar](<>)
    -   [Xenserver](https://www.xenserver.com/)
    -   [Wiki XenProject](https://wiki.xenproject.org/wiki/Main_Page)
    -   [Interfaces de rede](https://wiki.xenproject.org/wiki/Xen_Networking#Virtual_Network_Interfaces)
    -   [Ferramentas Xen](https://xen-tools.org/software/)
    -   [LPI Blog: Xen Virtualização e computação em nuvem #01: Introdução](https://www.lpi.org/pt-br/blog/2020/10/01/xen-virtualization-and-cloud-computing-01-introduction/)
    -   [LPI Blog: Xen Virtualização e computação em nuvem #02: Como Xen faz o trabalho](https://www.lpi.org/blog/2020/10/08/xen-virtualization-and-cloud-computing-02-how-xen-does-job/)
    -   [LPI Blog: Xen Virtualização e computação em nuvem #04: Contêineres, OpenStack e outras plataformas relacionadas](https://www.lpi.org/pt-br/blog/2020/10/22/xen-virtualization-and-cloud-computing-04-containers-openstack-and-other-related/)
    -   [Virtualização Xen e Computação em Cloud #05: O Projeto Xen, Unikernels e o Futuro](https://www.lpi.org/pt-br/blog/2020/10/29/xen-virtualization-and-cloud-computing-05-xen-project-unikernels-and-future/)
    -   [Guia para iniciantes do projeto Xen](https://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide#Installing_the_Xen_Project_Software)
    -   [Livro maluco](https://wiki.xenproject.org/wiki/Book/HelloXenProject/0-Contents)
-   [Unicernel](https://www.lpi.org/blog/2020/10/29/xen-virtualization-and-cloud-computing-05-xen-project-unikernels-and-future/)
    -   [Força única](https://github.com/unikraft/unikraft)
    -   [Mirageos](https://mirage.io/docs/hello-world)
    -   [Ruim](https://galois.com/project/halvm/)
    -   [Exclusivo](https://github.com/solo-io/unik/blob/master/docs/providers/virtualbox.md)
-   [KVM](<>)
    -   [Oficial Doc](https://linux-kvm.org/page/Main_Page)
    -   [KVM (máquinas virtuais do kernel por redhat)](https://www.redhat.com/pt-br/topics/virtualization/what-is-KVM)
    -   [Ferramentas de gerenciamento da KVM](https://www.linux-kvm.org/page/Management_Tools)
-   [Qemu](<>)
    -   [Oficial Doc](https://www.qemu.org/)
    -   [Baixar imagens](https://www.osboxes.org/)
-   [OpenStack Docs](<>)
    -   [Redhat](https://www.redhat.com/pt-br/topics/openstack)
-   [Aberto vswitch](<>)
    -   [OVS DOC 4LINUX](https://blog.4linux.com.br/open-vswitch-o-que-e-o-que-come-onde-vive)
-   [Exame LPIC-3 305-300](<>)
    -   [Lpic-3 305-300 Objetivos](https://www.lpi.org/our-certifications/exam-305-objectives/)
    -   [LPIC-3 305-300 Wiki](https://wiki.lpi.org/wiki/LPIC-305_Objectives_V3.0)
    -   [Lpic-3 305-300 Material de aprendizado](https://cursos.linuxsemfronteiras.com.br/courses/preparatorio-para-certificacao-lpic-3-305/)
    -   [LPIC-3 305-300 Exame simulado pela ITEXAMS](https://www.itexams.com/info/305-300)

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
