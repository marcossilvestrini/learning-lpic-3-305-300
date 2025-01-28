<h1><a name="readme-top"></a></h1>

[![Create Release](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml)[![Translate README](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml)[![Deploy GitHub Pages](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml)[![Generate HTML and PDF](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml)[![PSScriptAnalyzer](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml)[![Slack Notification](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml)

* * *

[![MIT License][license-shield]][license-url][![Forks][forks-shield]][forks-url][![Stargazers][stars-shield]][stars-url][![Contributors][contributors-shield]][contributors-url][![Issues][issues-shield]][issues-url][![LinkedIn][linkedin-shield]][linkedin-url]

* * *

# Apprendre le LPIC-3 305-300

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

## Résumé

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

## À propos du projet

> Ce projet vise à aider les étudiants ou les professionnels à apprendre les principaux concepts de Gnulinux
> et logiciel gratuit \\
> Certaines distributions Gnunux comme Debian et RPM seront couvertes \\
> L'installation et la configuration de certains packages seront également couvertes \\
> En faisant cela, vous pouvez donner à toute la communauté une chance de bénéficier de vos modifications. \\
> L'accès au code source est une condition préalable à cela. \\
> Utilisez Vagrant pour les machines UP et exécutez des laboratoires et pratiquez le contenu de cet article. \\
> J'ai publié dans Folder Vagrant A Vagrantfile avec ce qui est nécessaire \\
> Pour que vous puissiez télécharger un environnement pour les études

* * *

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<a name="getting-started"></a>

## Commencer

Pour commencer l'apprentissage, consultez la documentation ci-dessus.

<a name="prerequisites"></a>

### Condition préalable

-   [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
-   [Passe de travail VMware](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
-   [Utilitaire VMware vaginal](https://developer.hashicorp.com/vagrant/install/vmware)
-   [Vagabond](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### Installation

Cloner le repo

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

Personnaliser un modèle_Vagrantfile-topic-xxx_. Ce fichier contient une configuration VMS pour les laboratoires. Exemple:

-   Déposer[Vagrantfile-topic-351](./vagrant/Vagrantfile-topic-351)
    -   vm.clone_directory = "&lt;your_driver_letter>:\\<folder>\\&lt;to_machine>\\# {Vm_name} -instance-1 "
        Exemple: vm.clone_directory = "E:\\Serveurs\\Vmware\\# {Vm_name} -instance-1 "
    -   vm.vmx["memsize"]= ""
    -   vm.vmx["Numvcpus"]= ""
    -   vm.vmx["CPUID.CorRrespersoCout"]= ""

Personnaliser la configuration du réseau dans les fichiers[configs / réseau](configs/network/).

* * *

<a name="usage"></a>

## Usage

Utilisez ce référentiel pour obtenir un apprentissage sur l'examen LPIC-3 305-300

### Pour de haut en bas

Changer un_Vagrantfile-topic-xxx_modèle et copier pour un nouveau fichier avec nom_Vagabond_

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### Pour redémarrer les machines virtuelles

```sh
cd vagrant && vagrant reload
```

**Important:**_Si vous redémarrez les machines virtuelles sans vagabond, le dossier partagé ne monte pas après le démarrage._

### Utiliser PowerShell pour le haut et le bas

Si vous utilisez la plate-forme Windows, je crée un script PowerShell pour les machines virtuelles de haut en bas.

```powershell
vagrant/up.ps1
vagrant/destroy.ps1
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="roadmap"></a>

## Feuille de route

-   [x] Créer un référentiel
-   [x] Créer des scripts pour l'approvisionnement des laboratoires
-   [x] Créer des exemples sur le sujet 351
-   [ ] Créer des exemples sur le sujet 352
-   [ ] Créer des exemples sur le sujet 353
-   [ ] Télécharger simulé iTexam

* * *

<a name="freedoms"></a>

## Quatre libertés essentielles

> 0\. La liberté d'exécuter le programme comme vous le souhaitez, à quelque fin que ce soit (liberté 0). \\
> 1.La liberté d'étudier le fonctionnement du programme et de le changer pour qu'il ait \\
> votre informatique comme vous le souhaitez (Freedom 1). \\
> L'accès au code source est une condition préalable à cela. \\
> 2\. La liberté de redistribuer des copies afin que vous puissiez aider les autres (Freedom 2). \\
> 3\. Freedom pour distribuer des copies de vos versions modifiées à d'autres (Freedom 3).

* * *

## Inspecter les commandes

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

## Sujet 351: Virtualisation complète

![LPIC3-305-300](images/virtualization-351.png)

* * *

<a name="topic-351.1"></a>

### 351.1 Concepts de virtualisation et théorie

**Poids:**6

**Description:**Les candidats doivent connaître et comprendre les concepts généraux, la théorie et la terminologie de la virtualisation. Cela comprend la terminologie Xen, Qemu et Libvirt.

**Zones de connaissances clés:**

-   Comprendre la terminologie de la virtualisation
-   Comprendre les avantages et les inconvénients de la virtualisation
-   Comprendre les différentes variations des hyperviseurs et des moniteurs de machines virtuelles
-   Comprendre les principaux aspects de la migration physique vers des machines virtuelles
-   Comprendre les principaux aspects de la migration des machines virtuelles entre les systèmes hôtes
-   Comprendre les caractéristiques et les implications de la virtualisation pour une machine virtuelle, comme les instantanés, la pause, le clonage et les limites de ressources
-   Sensibilisation à OVIRT, Proxmox, Systemd-Machine et VirtualBox
-   Sensibilisation de l'Open Vswitch

#### 351.1 objets cités

```sh
Hypervisor
Hardware Virtual Machine (HVM)
Paravirtualization (PV)
Emulation and Simulation
CPU flags
/proc/cpuinfo
Migration (P2V, V2V)
```

#### Hyperviseurs

##### Hyperviseur de type 1 (hyperviseur à métal nu)

###### Définition de type 1

S'exécute directement sur le matériel physique de l'hôte, fournissant une couche de base pour gérer les machines virtuelles sans avoir besoin d'un système d'exploitation hôte.

###### Caractéristiques de type 1

-   Haute performance et efficacité.
-   Latence plus faible et les frais généraux.
-   Souvent utilisé dans les environnements et centres de données d'entreprise.

###### Exemples de type 1

-   VMware ESXi: un hyperviseur robuste et largement utilisé dans les paramètres d'entreprise.
-   Microsoft Hyper-V: intégré à Windows Server, offrant des performances et des fonctionnalités de gestion solides.
-   Xen: un hyperviseur open source utilisé par de nombreux fournisseurs de services cloud.
-   KVM (machine virtuelle basée sur le noyau): intégré dans le noyau Linux, offrant des performances élevées pour les systèmes basés sur Linux.

##### Hyperviseur de type 2 (hyperviseur hébergé)

###### Définition de type 2

Exécute sur un système d'exploitation conventionnel, en s'appuyant sur le système d'exploitation hôte pour la gestion des ressources et la prise en charge des appareils.

###### Caractéristiques de type 2

-   Plus facile à configurer et à utiliser, en particulier sur les ordinateurs personnels.
-   Plus flexible pour le développement, les tests et les déploiements à plus petite échelle.
-   Généralement moins efficace que les hyperviseurs de type 1 en raison des frais généraux supplémentaires du système d'exploitation hôte.

###### Exemples de type 2

-   VMware Workstation: un puissant hyperviseur pour exécuter plusieurs systèmes d'exploitation sur un seul bureau.
-   Oracle VirtualBox: un hyperviseur open source connu pour sa flexibilité et sa facilité d'utilisation.
-   Parallels Desktop: Conçu pour que les utilisateurs de Mac puissent exécuter Windows et d'autres systèmes d'exploitation aux côtés de macOS.
-   Qemu (émulateur rapide): un émulateur et virtualiseur open source, souvent utilisés en conjonction avec KVM.

##### Différences clés entre les hyperviseurs de type 1 et de type 2

-   Environnement de déploiement:
    -   Les hyperviseurs de type 1 sont couramment déployés dans les centres de données et les environnements d'entreprise en raison de leur interaction directe avec le matériel et des performances élevées.
    -   Les hyperviseurs de type 2 conviennent plus à un usage personnel, au développement, aux tests et aux tâches de virtualisation à petite échelle.
-   Performance:
    -   Les hyperviseurs de type 1 offrent généralement de meilleures performances et une latence plus faible car elles ne comptent pas sur un système d'exploitation hôte.
    -   Les hyperviseurs de type 2 peuvent subir une certaine dégradation des performances en raison des frais généraux de fonctionnement au-dessus d'un système d'exploitation hôte.
-   Gestion et facilité d'utilisation:
    -   Les hyperviseurs de type 1 nécessitent une configuration et une gestion plus complexes, mais fournissent des fonctionnalités avancées et une évolutivité pour les déploiements à grande échelle.
    -   Les hyperviseurs de type 2 sont plus faciles à installer et à utiliser, ce qui les rend idéaux pour les utilisateurs individuels et les petits projets.

##### Types de migration

Dans le contexte des hyperviseurs, qui sont des technologies utilisées pour créer et gérer les machines virtuelles, les termes migration P2V et migration V2V sont courants dans les environnements de virtualisation.  
Ils se réfèrent aux processus de migration des systèmes entre différents types de plates-formes.

##### P2V - Migration physique à virtuelle

La migration P2V fait référence au processus de migration d'un serveur physique vers une machine virtuelle.  
En d'autres termes, un système d'exploitation et ses applications, fonctionnant sur du matériel physique dédié, sont "convertis" et déplacés vers une machine virtuelle qui s'exécute sur un hyperviseur (comme VMware, Hyper-V, KVM, etc.).

-   Exemple: vous avez un serveur physique exécutant un système Windows ou Linux, et vous souhaitez le déplacer vers un environnement virtuel, comme une infrastructure cloud ou un serveur de virtualisation interne.  
    Le processus consiste à copier l'ensemble de l'état du système, y compris le système d'exploitation, les pilotes et les données, pour créer une machine virtuelle équivalente qui peut s'exécuter comme si elle se trouvait sur le matériel physique.

##### V2V - Migration virtuelle à virtuelle

La migration V2V fait référence au processus de migration d'une machine virtuelle d'un hyperviseur à un autre.  
Dans ce cas, vous avez déjà une machine virtuelle exécutée dans un environnement virtualisé (comme VMware), et vous souhaitez le déplacer vers un autre environnement virtualisé (par exemple, à Hyper-V ou vers un nouveau serveur VMware).

-   Exemple: vous avez une machine virtuelle en cours d'exécution sur un serveur de virtualisation VMware, mais vous décidez de le migrer vers une plate-forme Hyper-V. Dans ce cas, la migration V2V convertit la machine virtuelle d'un format ou d'un hyperviseur à un autre, garantissant qu'il peut continuer à fonctionner correctement.

#### HVM et paravirtualisation

##### Virtualisation assistée par matériel (HVM)

###### HVM Definition

HVM exploite les extensions matérielles fournies par les processeurs modernes pour virtualiser le matériel, permettant la création et la gestion des machines virtuelles avec des frais généraux minimaux.

###### Caractéristiques clés HVM

-   **Support matériel**: Nécessite une prise en charge du processeur pour les extensions de virtualisation telles que Intel VT-X ou AMD-V.
-   **Virtualisation complète:**Les VM peuvent exécuter des systèmes d'exploitation invités non modifiés, car l'hyperviseur fournit une émulation complète de l'environnement matériel.
-   **Performance:**Offre généralement des performances presque natives en raison de l'exécution directe du code invité sur le CPU.
-   **Isolement:**Fournit une forte isolement entre les machines virtuelles car chaque machine virtuelle fonctionne comme si elle avait son propre matériel dédié.

###### HVM Examples

VMware Esxi, Microsoft Hyper-V, KVM (machine virtuelle basée sur le noyau).

###### HVM Advantages

-   **Compatibilité:**Peut exécuter n'importe quel système d'exploitation sans modification.
-   **Performance:**Haute performances en raison de la prise en charge matérielle.
-   **Sécurité:**Des fonctionnalités d'isolement et de sécurité améliorées fournies par le matériel.

###### HVM Disadvantages

-   **Dépendance matérielle:**Nécessite des fonctionnalités matérielles spécifiques, limitant la compatibilité avec les systèmes plus anciens.
-   **Complexité:**Peut impliquer une configuration et une gestion plus complexes.

##### Paravirtualisation

###### Définition de paravirtualisation

La paravirtualisation consiste à modifier le système d'exploitation invité pour être conscient de l'environnement virtuel, ce qui lui permet d'interagir plus efficacement avec l'hyperviseur.

###### Paravirtualisation des caractéristiques clés

-   **Modification des invités:**Nécessite des modifications apportées au système d'exploitation des invités pour communiquer directement avec l'hyperviseur à l'aide d'hypercaux.
-   **Performance:**Peut être plus efficace que la virtualisation complète traditionnelle car elle réduit les frais généraux associés à l'émulation de matériel.
-   **Compatibilité:**Limité aux systèmes d'exploitation qui ont été modifiés pour la paravirtualisation.

###### Exemples de paravirtualisation

Xen avec des invités paravirtualisés, des outils VMware dans certaines configurations et certaines configurations KVM.

###### Avantages de paravirtualisation

-   **Efficacité:**Réduit les frais généraux du matériel de virtualisation, offrant potentiellement de meilleures performances pour certaines charges de travail.
-   **Utilisation des ressources:**Utilisation plus efficace des ressources système en raison de la communication directe entre le système d'exploitation invité et l'hyperviseur.

###### Inconvénients de paravirtualisation

-   **Modification du système d'exploitation invité:**Nécessite des modifications au système d'exploitation invité, limitant la compatibilité aux systèmes d'exploitation pris en charge.
-   **Complexité:**Nécessite une complexité supplémentaire dans le système d'exploitation invité pour les implémentations hypercall.

##### Différences clés

###### Exigences du système d'exploitation invité

-   **HVM:**Peut exécuter des systèmes d'exploitation invités non modifiés.
-   **Paravirtualisation:**Exige que les systèmes d'exploitation invités soient modifiés pour travailler avec l'hyperviseur.

###### Performance

-   **HVM:**Offre généralement des performances presque natives en raison de l'exécution assistée par le matériel.
-   **Paravirtualisation:**Peut offrir des performances efficaces en réduisant les frais généraux de l'émulation matérielle, mais repose sur un système d'exploitation invité modifié.

###### Dépendance matérielle

-   **HVM:**Nécessite des fonctionnalités CPU spécifiques (Intel VT-X, AMD-V).
-   **Paravirtualisation:**Ne nécessite pas de fonctionnalités CPU spécifiques mais nécessite un système d'exploitation invité modifié.

###### Isolement

-   **HVM:**Fournit une forte isolement à l'aide de fonctionnalités matérielles.
-   **Paravirtualisation:**S'appuie sur l'isolement logiciel, qui peut ne pas être aussi robuste que l'isolement matériel.

###### Complexité

-   **HVM:**Généralement plus simple à déployer car il prend en charge le système d'exploitation non modifié.
-   **Paravirtualisation:**Nécessite une configuration et des modifications supplémentaires pour le système d'exploitation invité, augmentant la complexité.

#### NUMA (accès à la mémoire non uniforme)

NUMA (Accès à la mémoire non uniforme) est une architecture de mémoire utilisée dans les systèmes multiprocesseurs pour optimiser l'accès à la mémoire par les processeurs.  
Dans un système NUMA, la mémoire est distribuée de manière inégale entre les processeurs, ce qui signifie que chaque processeur a un accès plus rapide à une partie de la mémoire (sa "mémoire locale") qu'à la mémoire qui est physiquement plus loin (appelée "mémoire distante") et associée avec d'autres processeurs.

##### Caractéristiques clés de l'architecture NUMA

1.  **Mémoire locale et distante**: Chaque processeur a sa propre mémoire locale, à laquelle elle peut accéder plus rapidement. Cependant, il peut également accéder à la mémoire d'autres processeurs, bien que cela prenne plus de temps.
2.  **Latence différenciée**: La latence de l'accès à la mémoire varie selon que le processeur accéde à sa mémoire locale ou à la mémoire d'un autre nœud. L'accès à la mémoire locale est plus rapide, tandis que l'accès à la mémoire d'un autre nœud (télécommande) est plus lent.
3.  **Évolutivité**: L'architecture NUMA est conçue pour améliorer l'évolutivité des systèmes avec de nombreux processeurs. À mesure que davantage de processeurs sont ajoutés, la mémoire est également distribuée, en évitant le goulot d'étranglement qui se produirait dans une architecture d'accès à la mémoire uniforme (UMA).

##### Avantages de Numa

-   De meilleures performances dans les grands systèmes: puisque chaque processeur a une mémoire locale, il peut fonctionner plus efficacement sans concurrencer autant avec d'autres processeurs pour l'accès à la mémoire.
-   Évolutivité: NUMA permet des systèmes avec de nombreux processeurs et de grandes quantités de mémoire pour évoluer plus efficacement par rapport à une architecture UMA.

##### Désavantage

-   Complexité de programmation: les programmeurs doivent savoir quelles régions de mémoire sont locales ou éloignées, optimisant l'utilisation de la mémoire locale pour obtenir de meilleures performances.
-   Pénalités de performance potentielles: si un processeur accède fréquemment à la mémoire distante, les performances peuvent souffrir en raison d'une latence plus élevée.
    Cette architecture est courante dans les systèmes multiprocesseurs haute performance, tels que les serveurs et les superordinateurs, où l'évolutivité et l'optimisation de la mémoire sont essentielles.

#### Opensource Solutions

-   Ovirt:<https://www.ovirt.org/>

-   Proxmox:<https://www.proxmox.com/en/proxmox-virtual-environment/overview>

-   Oracle VirtualBox:<https://www.virtualbox.org/>

-   Open VSwitch:<https://www.openvswitch.org/>

#### Types de virtualisation

##### Virtualisation matérielle (virtualisation du serveur)

###### Définition HV

Résumé matériel physique pour créer des machines virtuelles (VM) qui exécutent des systèmes d'exploitation et des applications distincts.

###### Cas d'utilisation HV

Centres de données, cloud computing, consolidation de serveurs.

###### Exemples HV

VMware Esxi, Microsoft Hyper-V, KVM.

##### Virtualisation du système d'exploitation (conteneurisation)

###### Définition de conteneurisation

Permet à plusieurs instances d'espace utilisateur isolées (conteneurs) d'exécuter sur un seul noyau de système d'exploitation.

###### Cas d'utilisation de la conteneurisation

Environnements d'architecture, de développement et de test des microservices.

###### Exemples de conteneurisation

Docker, Kubernetes, LXC.

##### Virtualisation du réseau

###### Définition de virtualisation du réseau

Combine les ressources matérielles et réseau logicielles dans une seule entité administrative basée sur un logiciel.

###### Cas d'utilisation de la virtualisation du réseau

Réseaux définis par logiciel (SDN), virtualisation des fonctions du réseau (NFV).

###### Exemples de virtualisation du réseau

VMware NSX, Cisco ACI, OpenStack Neutron.

##### Virtualisation de stockage

###### Définition de virtualisation de stockage

Poolets Stockage physique de plusieurs appareils dans une seule unité de stockage virtuel qui peut être géré de manière centralisée.

###### Définition de virtualisation de stockage Cas d'utilisation

Gestion des données, optimisation du stockage, reprise après sinistre.

###### Exemples de définition de virtualisation de stockage

Contrôleur de volume IBM SAN, VMware VSAN, NetApp ONTAP.

##### Virtualisation de bureau

###### Définition de virtualisation de bureau

Permet à un système d'exploitation de bureau d'exécuter une machine virtuelle hébergée sur un serveur.

###### Cas d'utilisation de définition de virtualisation de bureau

Infrastructure de bureau virtuelle (VDI), solutions de travail à distance.

###### Exemples de définition de virtualisation de bureau

Citrix Virtual Apps and Desktops, VMware Horizon, Microsoft Remote Desktop Services.

##### Virtualisation de l'application

###### Définition de virtualisation de l'application

Sépare les applications du matériel et du système d'exploitation sous-jacents, leur permettant d'exécuter dans des environnements isolés.

###### Application Virtualization Définition des cas d'utilisation

Déploiement simplifié des applications, tests de compatibilité.

###### Exemples de définition de virtualisation de l'application

VMware Thinapp, Microsoft App-V, Citrix XenApp.

##### Virtualisation des données

###### Définition de virtualisation des données

Intègre les données de diverses sources sans la consolider physiquement, fournissant une vue unifiée pour l'analyse et les rapports.

###### Data Virtualization Définition des cas d'utilisation

Business Intelligence, intégration de données en temps réel.

###### Exemples de définition de virtualisation des données

DÉNODO, Red Hat JBoss Data Virtualization, IBM Infosphere.

##### Avantages de la virtualisation

-   Efficacité des ressources: meilleure utilisation des ressources physiques.
-   Économies de coûts: réduction des coûts matériels et opérationnels.
-   Évolutivité: facile à évoluer ou à la baisse selon la demande.
-   Flexibilité: prend en charge une variété de charges de travail et d'applications.
-   Récupération des catastrophes: processus de sauvegarde et de récupération simplifiés.
-   Isolement: Sécurité améliorée par l'isolement des environnements.

<p align="right">(<a href="#topic-351.1">back to sub Topic 351.1</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.2"></a>

### 351.2 alternant

![xen-architecture](images/xen-achitecture.png)

![xen-architecture](images/xen-achitecture2.png)

**Poids:**3

**Description:**Les candidats doivent pouvoir installer, configurer, maintenir, migrer et dépanner les installations Xen. L'accent est mis sur Xen version 4.x.

**Zones de connaissances clés:**

-   Comprendre l'architecture de Xen, y compris le réseautage et le stockage
-   Configuration de base des nœuds et domaines Xen
-   Gestion de base des nœuds et domaines Xen
-   Dépannage de base des installations Xen
-   Avarines hors de la pilule
-   Sensibilisation de Xenstore
-   Conscience des paramètres de démarrage Xen
-   Conscience de l'utilitaire XM

#### Alterner

![panda](images/xen-panda.png)

Xen est un hyperviseur open source de type 1 (bare-metal), qui permet à plusieurs systèmes d'exploitation d'exécuter simultanément le même matériel physique.  
Xen fournit une couche entre le matériel physique et les machines virtuelles (VM), permettant un partage et un isolement efficaces des ressources.

-   **Architecture:**Xen fonctionne avec un système à deux niveaux où le domaine 0 (DOM0) est le domaine privilégié avec un accès matériel direct et gère l'hyperviseur. D'autres machines virtuelles, appelées Domain U (DOMU), exécutent des systèmes d'exploitation invités et sont gérées par DOM0.
-   **Types de virtualisation:**Xen prend en charge à la fois la paravirtualisation (PV), qui nécessite un système d'exploitation invité modifié, et la virtualisation assistée par le matériel (HVM), qui utilise des extensions matérielles (par exemple, Intel VT-X ou AMD-V) pour exécuter des systèmes d'exploitation invités non modifiés.
    Xen est largement utilisé dans les environnements cloud, notamment par Amazon Web Services (AWS) et d'autres fournisseurs de cloud à grande échelle.

#### Xensource

Xensource était la société fondée par les développeurs originaux de l'hyperviseur Xen à l'Université de Cambridge pour commercialiser Xen.  
La société a fourni des solutions d'entreprise basées sur Xen et a offert des outils et un support supplémentaires pour améliorer les capacités de Xen à usage d'entreprise.

-   **Acquisition par Citrix**: En 2007, Xensource a été acquis par Citrix Systems, Inc. Citrix a utilisé la technologie Xen comme base de son produit Citrix Xenserver, qui est devenu une plate-forme de virtualisation populaire de qualité d'entreprise basée sur Xen.
-   **Transition**: Après l'acquisition, le projet Xen s'est poursuivi en tant que projet open source, tandis que Citrix s'est concentré sur des offres commerciales comme Xenserver, en tirant parti de la technologie XenSource.

#### Projet Xen

Le projet Xen fait référence à la communauté open source et à l'initiative responsable du développement et du maintien de l'hyperviseur Xen après sa commercialisation.  
Le projet Xen fonctionne sous la Fondation Linux, en mettant l'accent sur la construction, l'amélioration et le soutien de Xen comme un effort collaboratif et axé sur la communauté.

-   **Objectifs:**Le projet Xen vise à faire progresser l'hyperviseur en améliorant ses performances, sa sécurité et son ensemble de fonctionnalités pour une large gamme de cas d'utilisation, notamment le cloud computing, la virtualisation axée sur la sécurité (par exemple, Qubes OS) et les systèmes intégrés.
-   **Contributeurs:**Le projet comprend des contributeurs de diverses organisations, notamment les principaux fournisseurs de cloud, les fournisseurs de matériel et les développeurs indépendants.
-   **Pilule et hédools:**Le projet Xen comprend également des outils tels que XAPI (Xenapi), qui est utilisé pour gérer les installations d'hyperviseur Xen, et divers autres utilitaires pour la gestion et l'optimisation du système.

#### Xenstore

Xen Store est un élément essentiel de l'hyperviseur Xen.  
Essentiellement, Xen Store est une base de données de valeur clé distribuée utilisée pour la communication et le partage d'informations entre l'hyperviseur Xen et les machines virtuelles (également appelées domaines).

Voici quelques aspects clés de Xen Store:

-   **Communication inter-domaine:**Xen Store permet la communication entre les domaines, tels que DOM0 (le domaine privilégié qui contrôle les ressources matérielles) et Domus (domaines utilisateur, qui sont les VM). Cela se fait via des entrées de valeur clé, où chaque domaine peut lire ou écrire des informations.

-   **Gestion de la configuration:**Il est utilisé pour stocker et accéder aux informations de configuration, telles que les périphériques virtuels, les réseaux et les paramètres de démarrage. Cela facilite la gestion et la configuration dynamiques des machines virtuelles.

-   **Événements et notifications:**Xen Store prend également en charge les notifications d'événements. Lorsqu'une clé ou valeur particulière dans le magasin Xen est modifiée, les domaines intéressés peuvent être informés pour réagir à ces modifications. Ceci est utile pour surveiller et gérer les ressources.

-   API simple: Xen Store fournit une API simple pour la lecture et l'écriture de données, ce qui permet aux développeurs d'intégrer facilement leurs applications avec le système de virtualisation Xen.

#### Pilule

XAPI, ou Xenapi, est l'interface de programmation d'application (API) utilisée pour gérer l'hyperviseur Xen et ses machines virtuelles (VM).  
XAPI est un composant clé de Xenserver (maintenant connu sous le nom d'hyperviseur Citrix) et fournit un moyen standardisé d'interagir avec l'hyperviseur Xen pour effectuer des opérations telles que la création, la configuration, la surveillance et le contrôle des machines virtuelles.

Voici quelques aspects importants de XAPI:

-   **Gestion de la machine virtuelle:**XAPI permet aux administrateurs de créer, de supprimer, de démarrer et d'arrêter les machines virtuelles.

-   **Automation:**Avec XAPI, il est possible d'automatiser la gestion des ressources virtuelles, y compris la mise en réseau, le stockage et l'informatique, ce qui est crucial pour les grands environnements cloud.

-   **Intégration:**XAPI peut être intégré à d'autres outils et scripts pour fournir une administration plus efficace et personnalisée de l'environnement XEN.

-   **Contrôle d'accès:**XAPI fournit également des mécanismes de contrôle d'accès pour s'assurer que seuls les utilisateurs autorisés peuvent effectuer des opérations spécifiques dans l'environnement virtuel.

XAPI est l'interface qui permet le contrôle et l'automatisation de l'hyperviseur Xen, ce qui facilite la gestion des environnements virtualisés.

#### Résumé Xen

-   **Intercalpring:**La technologie de base de l'hyperviseur permettant aux machines virtuelles de fonctionner sur du matériel physique.
-   **Xensource:**La société qui a commercialisé Xen, acquise plus tard par Citrix, conduisant au développement de Citrix Xenserver.
-   **Projet Xen:**L'initiative et la communauté open source qui continue de développer et de maintenir l'hyperviseur Xen sous la Fondation Linux.
-   **Xenstore:**Xen Store agit comme un intermédiaire de communication et de configuration entre l'hyperviseur Xen et les machines virtuelles, rationalisant le fonctionnement et la gestion des environnements virtualisés.
-   **Pilule**est l'interface qui permet le contrôle et l'automatisation de l'hyperviseur Xen, ce qui facilite la gestion des environnements virtualisés.

#### Domain0 (Dom0)

Domain0, ou Dom0, est le domaine de contrôle dans une architecture XEN. Il gère d'autres domaines (DOMUS) et a un accès direct au matériel.  
DOM0 exécute les pilotes de périphériques, permettant à Domus, qui manque d'accès matériel direct, à communiquer avec les appareils. En règle générale, il s'agit d'une instance complète d'un système d'exploitation, comme Linux, et est essentiel pour le fonctionnement de l'hyperviseur Xen.

#### Domaine (maison)

Domus sont des domaines non privilégiés qui exécutent des machines virtuelles.  
Ils sont gérés par DOM0 et n'ont pas accès direct au matériel. DOMUS peut être configuré pour exécuter différents systèmes d'exploitation et est utilisé à diverses fins, tels que les serveurs d'applications et les environnements de développement. Ils comptent sur DOM0 pour l'interaction matérielle.

#### PV-DomU (Paravirtualized DomainU)

PV-DOMUS utilise une technique appelée paravirtualisation. Dans ce modèle, le système d'exploitation DOMU est modifié pour savoir qu'il s'exécute dans un environnement virtualisé, lui permettant de communiquer directement avec l'hyperviseur pour des performances optimisées.  
Il en résulte des frais généraux plus faibles et une meilleure efficacité par rapport à la virtualisation complète.

#### HVM-DomU (Hardware Virtual Machine DomainU)

HVM-DOMUS sont des machines virtuelles qui utilisent une virtualisation complète, permettant aux systèmes d'exploitation non modifiés de s'exécuter. L'hyperviseur Xen fournit une émulation matérielle pour ces domus, leur permettant d'exécuter tout système d'exploitation qui prend en charge l'architecture matérielle sous-jacente.  
Bien que cela offre une plus grande flexibilité, cela peut entraîner des frais généraux plus élevés par rapport à PV-DOMUS.

#### Réseau Xen

Appareils réseau paravirtualisés![pv-networking](images/xen-networking2.png)

Pontage![pv-networking](images/xen-networking1.png)

#### 351.2 objets cités

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

#### 351.2 Notes

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
```

#### 351.2 Commandes importantes

##### xen-création-image

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

##### Xen-list-iMages

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

# manual conf
man xl.conf

# manual cfg - about guest configuration
man xl.cfg

# create DomainU - virtual machine
xl create /etc/xen/lpic3-pv-guest.cfg

# create DomainU virtual machine and connect to guest
xl create -c /etc/xen/lpic3-pv-guest.cfg

# create DomainU virtual machine HVM

## configure /etc/xen/lpic3-hvm-guest.cfg

## create logical volume
lvcreate -l +20%FREE -n lpic3-hvm-guest-disk  vg_xen

## create a ssh tunel for vnc
ssh -l vagrant -L 5900:localhost:5900  192.168.0.130

## create domain hvm
xl create /etc/xen/lpic3-hvm-guest.cfg

## open vcn conectio in your vnc client with localhost

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

### 351.3 Qemu

**Poids:**4

**Description:**Les candidats doivent pouvoir installer, configurer, maintenir, migrer et dépanner les installations QEMU.

**Zones de connaissances clés:**

-   Comprendre l'architecture de Qemu, y compris KVM, le réseautage et le stockage
-   Démarrer les instances Qemu à partir de la ligne de commande
-   Gérer les instantanés à l'aide du moniteur Qemu
-   Installez l'agent invité QEMU et les pilotes de l'appareil Virtio
-   Dépanner les installations QEMU, y compris la mise en réseau et le stockage
-   Conscience des paramètres de configuration QEMU importants

#### 351.3 objets cités

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

#### 351.3 Commandes importantes

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

### 351.4 Gestion de la machine virtuelle LibVirt

**Poids:**9

**Description:**Les candidats devraient être en mesure de gérer les hôtes de virtualisation et les machines virtuelles («Domains LibVirt») à l'aide de libvirt et d'outils connexes.

**Zones de connaissances clés:**

-   Comprendre l'architecture de libvirt
-   Gérer les connexions et les nœuds libvirt
-   Créer et gérer les domaines Qemu et Xen, y compris les instantanés
-   Gérer et analyser la consommation de ressources de domaines
-   Créer et gérer les pools de stockage et les volumes
-   Créer et gérer les réseaux virtuels
-   Migrer les domaines entre les nœuds
-   Comprendre comment Libvirt interagit avec Xen et Qemu
-   Comprendre comment LibVirt interagit avec les services de réseau tels que DNSMASQ et RADVD
-   Comprendre les fichiers de configuration XML LibVirt
-   Conscience de Virtlogd et Virtlockd

#### 351.4 objets cités

```sh
libvirtd
/etc/libvirt/
virsh (including relevant subcommands)
```

#### 351.4 Commandes importantes

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-351.4">back to sub Topic 351.4</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.5"></a>

### 351.5 Gestion de l'image du disque de machine virtuelle

**Poids:**3

**Description:**Les candidats devraient être en mesure de gérer des images de disque de machines virtuelles. Cela comprend la conversion d'images de disque entre différents formats et hyperviseurs et accéder aux données stockées dans une image.

**Zones de connaissances clés:**

-   Comprendre les fonctionnalités de divers formats d'image disque virtuels, tels que les images brutes, QCOW2 et VMDK
-   Gérer les images de disque de machine virtuelle à l'aide de Qemu-IMG
-   Les partitions de montage et les fichiers d'accès contenus dans les images de disque de machine virtuelle à l'aide de libguestfish
-   Copier le contenu du disque physique sur une image de disque de machine virtuelle
-   Migrer le contenu du disque entre divers formats d'image de disque de machine virtuelle
-   Conscience du format de virtualisation ouverte (OVF)

#### 351,5 objets cités

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

#### 351,5 Commandes importantes

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-351.5">back to sub Topic 351.5</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352"></a>

## Sujet 352: Virtualisation des conteneurs

* * *

<a name="topic-352.1"></a>

### 352.1 Concepts de virtualisation des conteneurs

**Poids:**7

**Description:**Les candidats doivent comprendre le concept de virtualisation des conteneurs. Cela comprend la compréhension des composants Linux utilisés pour implémenter la virtualisation des conteneurs ainsi que l'utilisation d'outils Linux standard pour dépanner ces composants.

**Zones de connaissances clés:**

-   Comprendre les concepts du système et du conteneur d'application
-   Comprendre et analyser les espaces de noms du noyau
-   Comprendre et analyser les groupes de contrôle
-   Comprendre et analyser les capacités
-   Comprendre le rôle de SecComp, Selinux et Apparmor pour la virtualisation des conteneurs
-   Comprenez comment LXC et Docker levier des espaces de noms, les CGROUP, les capacités, SecComp et Mac
-   Comprendre le principe de Runc
-   Comprendre le principe de Cri-O et de Containerd
-   Conscience des spécifications de l'exécution et de l'image OCI
-   Sensibilisation de l'interface d'exécution des conteneurs de Kubernetes (CRI)
-   Conscience de Podman, Buildah et Scopeo
-   Conscience des autres approches de virtualisation des conteneurs dans Linux et d'autres systèmes d'exploitation gratuits, tels que RKT, OpenVZ, Systemd-Nspawn ou BSD

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

#### 352.1 objets cités

```sh
nsenter
unshare
ip (including relevant subcommands)
capsh
/sys/fs/cgroups
/proc/[0-9]+/ns
/proc/[0-9]+/status
```

#### 352.1 Commandes importantes

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

**Poids:**6

**Description:**Les candidats doivent pouvoir utiliser des conteneurs système à l'aide de LXC et LXD. La version de LXC couverte est de 3,0 ou plus.

**Zones de connaissances clés:**

-   Comprendre l'architecture de LXC et LXD
-   Gérer les conteneurs LXC en fonction des images existantes à l'aide de LXD, y compris la mise en réseau et le stockage
-   Configurer les propriétés du conteneur LXC
-   Limiter l'utilisation des ressources de conteneur LXC
-   Utiliser les profils LXD
-   Comprendre les images LXC
-   Conscience des outils LXC traditionnels

#### 352.2 objets cités

```sh
lxd
lxc (including relevant subcommands)
```

#### 352.2 Commandes importantes

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

**Poids:**9

**Description:**Le candidat doit être en mesure de gérer les nœuds Docker et les conteneurs Docker. Cela inclut la compréhension de l'architecture de Docker ainsi que la compréhension de la façon dont Docker interagit avec le système Linux du nœud.

**Zones de connaissances clés:**

-   Comprendre l'architecture et les composants de Docker
-   Gérer les conteneurs Docker en utilisant des images à partir d'un registre Docker
-   Comprendre et gérer les images et les volumes pour les conteneurs Docker
-   Comprendre et gérer la journalisation des conteneurs Docker
-   Comprendre et gérer le réseautage pour Docker
-   Utilisez dockerfiles pour créer des images de conteneurs
-   Exécutez un registre Docker à l'aide de l'image du registre Docker

#### 352.3 objets cités

```sh
dockerd
/etc/docker/daemon.json
/var/lib/docker/
docker
Dockerfile
```

#### 352.3 Commandes importantes

##### docker

```sh
# Examples of docker
```

<p align="right">(<a href="#topic-352.3">back to sub topic 352.3</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.4"></a>

### 352.4 plates-formes d'orchestration en conteneurs

**Poids:**3

**Description:**Les candidats doivent comprendre l'importance de l'orchestration des conteneurs et les concepts clés Docker Swarm et Kubernetes fournissent pour implémenter l'orchestration des conteneurs.

**Zones de connaissances clés:**

-   Comprendre la pertinence de l'orchestration des conteneurs
-   Comprendre les concepts clés de Docker Compose et Docker Swarm
-   Comprendre les concepts clés de Kubernetes et Helm
-   Sensibilisation de l'OpenShift, du Rancher et de la Mesosphère DC / OS

<p align="right">(<a href="#topic-352.4">back to sub topic 352.4</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353"></a>

## Sujet 353: déploiement et provisionnement VM

* * *

<a name="topic-353.1"></a>

### 353.1 outils de gestion du cloud

**Poids:**2

**Description:**Les candidats doivent comprendre les offres communes dans les nuages ​​publics et avoir une connaissance de base des fonctionnalités des outils de gestion du cloud couramment disponibles.

**Zones de connaissances clés:**

-   Comprendre les offres communes dans les nuages ​​publics
-   Connaissance de base des fonctionnalités d'OpenStack
-   Connaissance des fonctionnalités de base de Terraform
-   Conscience de Cloudstack, Eucalyptus et Opennebula

#### 353.1 objets cités

```sh
IaaS, PaaS, SaaS
OpenStack
Terraform
```

#### 353.1 Commandes importantes

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

**Poids:**2

**Description:**Les candidats devraient pouvoir utiliser Packer pour créer des images système. Cela comprend l'exécution de Packer dans divers environnements cloud publics et privés ainsi que la construction d'images de conteneurs pour LXC / LXD.

**Zones de connaissances clés:**

-   Comprendre les fonctionnalités et les fonctionnalités de Packer
-   Créer et maintenir des fichiers de modèle
-   Créer des images à partir de fichiers de modèle à l'aide de différents constructeurs

#### 353,2 objets cités

```sh
packer
```

#### 353.2 Commandes importantes

##### emballeur

```sh
# examples
```

<p align="right">(<a href="#topic-353.2">back to sub topic 353.2</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.3"></a>

### 353.3 Cloud-init

**Poids:**3

**Description:**Les candidats doivent utiliser le cloud-init pour configurer des machines virtuelles créées à partir d'images standardisées. Cela comprend l'ajustement des machines virtuelles pour correspondre à leurs ressources matérielles disponibles, en particulier, l'espace disque et les volumes.  
De plus, les candidats devraient pouvoir configurer des instances pour permettre des connexions SSH sécurisées et installer un ensemble spécifique de packages logiciels.  
De plus, les candidats devraient être en mesure de créer de nouvelles images système avec un support Cloud-INT.

**Zones de connaissances clés:**

-   Comprendre les fonctionnalités et les concepts du cloud-init, y compris les données utilisateur, l'initialisation et la configuration du cloud-init
-   Utilisez le cloud-init pour créer, redimensionner et monter des systèmes de fichiers, configurer les comptes d'utilisateurs, y compris les informations d'identification de connexion telles que les clés SSH et installer des packages de logiciels à partir du référentiel de la distribution
-   Intégrer le cloud-init dans les images du système
-   Utilisez la source de données de configuration pour les tests

#### 353.3 objets cités

```sh
cloud-init
user-data
/var/lib/cloud/
```

#### 353.3 Commandes importantes

##### foo

```sh
# examples
```

<p align="right">(<a href="#topic-353.3">back to sub topic 353.3</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.4"></a>

### 353,4 vagabond

**Poids:**3

**Description:**Le candidat doit être en mesure d'utiliser Vagrant pour gérer les machines virtuelles, y compris l'approvisionnement de la machine virtuelle.

**Zones de connaissances clés:**

-   Comprendre l'architecture et les concepts vagabonds, y compris le stockage et le réseautage
-   Récupérez et utilisez des boîtes à partir de l'atlas
-   Créer et exécuter Vagrantfiles
-   Accéder aux machines virtuelles vagues
-   Partagez et synchronisez le dossier entre une machine virtuelle Vagrant et le système hôte
-   Comprendre l'approvisionnement vagabond, c'est-à-dire les provisions de fichiers et de shell
-   Comprendre la configuration multi-machine

#### 353.4 objets cités

```sh
vagrant
Vagrantfile
```

#### 353.4 Commandes importantes

##### vagabond

```sh
# examples
```

<p align="right">(<a href="#topic-353.4">back to sub topic 353.4</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## Contributif

Les contributions font de la communauté open source un endroit incroyable
Apprenez, inspirez et créez. Toutes les contributions que vous faites sont**très apprécié**.

Si vous avez une suggestion qui rendrait cela meilleur, veuillez enfiler le repo et
Créez une demande de traction. Vous pouvez également ouvrir simplement un problème avec la balise "amélioration".
N'oubliez pas de donner une étoile au projet! Merci encore!

1.  Fourk le projet
2.  Créez votre branche de fonctionnalité (`git checkout -b feature/AmazingFeature`)
3.  Engagez vos modifications (`git commit -m 'Add some AmazingFeature'`)
4.  Pousser à la branche (`git push origin feature/AmazingFeature`)
5.  Ouvrir une demande de traction

* * *

## Licence

-   Ce projet est sous licence en vertu de la licence MIT \* voir le fichier licence.md pour plus de détails

* * *

## Contact

Marcos Silvestrini -[marcos.silvestrini@gmail.com](mailto:marcos.silvestrini@gmail.com)\\[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/mrsilvestrini.svg?style=social&label=Follow%20%40mrsilvestrini)](https://twitter.com/mrsilvestrini)

Lien du projet:<https://github.com/marcossilvestrini/learning-lpic-3-305-300>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## Remerciements

-   [Richard Stallman's](http://www.stallman.org/)
-   [GNOU](<>)
    -   [FAQ GNU / Linux par Richard Stallman](https://www.gnu.org/gnu/gnu-linux-faq.html)
    -   [GNOU](https://www.gnu.org/)
    -   [Système d'exploitation GNU](https://www.gnu.org/gnu/thegnuproject.html)
    -   [Compilateur GCC](https://gcc.gnu.org/wiki/History)
    -   [Goudron de gnu](https://www.gnu.org/software/tar/)
    -   [GNU FAIT](https://www.gnu.org/software/make/)
    -   [GNU Emacs](https://en.wikipedia.org/wiki/Emacs)
    -   [Forfaits GNU](https://www.gnu.org/software/)
    -   [Collection GNU / Linux](https://directory.fsf.org/wiki/Collection:GNU/Linux)
    -   [Téléchargeur de démarrage GNU GRUB](https://www.gnu.org/software/grub/)
    -   [GNU HURD](https://www.gnu.org/software/hurd/hurd/what_is_the_gnu_hurd.html)
-   [Noyau](<>)
    -   [Noyau](https://www.kernel.org/)
    -   [Pages de noyau Linux](https://www.kernel.org/doc/man-pages/)
    -   [Compilez votre noyau](https://wiki.linuxquestions.org/wiki/How_to_build_and_install_your_own_Linux_kernel)
-   [Base standard Linux](<>)
    -   [Base standard Linux](https://en.wikipedia.org/wiki/Linux_Standard_Base)
    -   [Norme de hiérarchie du système de fichiers](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)
    -   [Structure de hiérarchie de fichiers](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.pdf)
-   [Logiciel gratuit](<>)
    -   [FSF](https://www.fsf.org)
    -   [Répertoire de logiciel gratuit](https://directory.fsf.org/wiki/Free_Software_Directory:Free_software_replacements)
-   [Licence](<>)
    -   [Logiciel gratuit](https://www.gnu.org/philosophy/free-sw.html)
    -   [Copyleft](https://www.gnu.org/licenses/copyleft.en.html)
    -   [GPL](https://www.gnu.org/licenses/quick-guide-gplv3.html)
    -   [Licence publique générale GNU moindre](https://www.gnu.org/licenses/lgpl-3.0.html)
    -   [BSD](https://opensource.org/licenses/BSD-3-Clause)
    -   [Initiative open source](https://opensource.org/)
    -   [Communes créatives](https://creativecommons.org/)
    -   [Licence LTS](https://en.wikipedia.org/wiki/Long-term_support)
-   [Distros](<>)
    -   [Directives de Debian Free Software](https://www.debian.org/social_contract#guidelines)
    -   [Liste de la distribution Linux](https://en.wikipedia.org/wiki/List_of_Linux_distributions)
    -   [Destrowatch](https://distrowatch.com/)
    -   [Comparaison Distributions Linux](https://en.wikipedia.org/wiki/Comparison_of_Linux_distributions)
-   [Environnements de bureau](<>)
    -   [X11 org](https://www.x.org/wiki/)
    -   [Wayland](https://wayland.freedesktop.org/)
    -   [GNU GNOME](https://www.gnu.org/press/gnome-1.0.html)
    -   [GNOME](https://www.gnome.org/)
    -   [Xfce](https://xfce.org/)
    -   [Où le plasma](https://kde.org/plasma-desktop/)
    -   [Harmonie](https://en.wikipedia.org/wiki/Harmony_(toolkit))
-   [Protocoles](<>)
    -   [Http](<>)
        -   [W3techs](https://w3techs.com/)
        -   [Apache](https://www.apache.org/)
        -   [Apache Directives][def]
        -   [Codes d'état HTTP](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
        -   [Ciphers forts pour Apache, Nginx et LightTPD](https://cipherlist.eu/)
        -   [Tutoriels SSL](https://www.golinuxcloud.com/blog/)
        -   [SSL Config Mozilla](https://ssl-config.mozilla.org/)
    -   [xrdp](https://bytexd.com/xrdp-centos/)
    -   [NTP](https://www.ntppool.org/en/)
-   [DNS](<>)
    -   [Lier](https://www.isc.org/bind/)
    -   [Lier la journalisation](https://www.zytrax.com/books/dns/ch7/logging.html)
    -   [Liste des types d'enregistrements DNS](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
    -   [Liste des types d'enregistrements DNS](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
-   [Gestionnaire de packages](<>)
    -   [Télécharger des packages](https://pkgs.org/)
    -   [Installer des packages](https://installati.one/)
    -   [Guide des packages d'installation](https://installati.one/)
-   [Script shell](<>)
    -   [Bourne à nouveau Shell](https://www.gnu.org/software/bash/manual/)
    -   [Case](https://bash.cyberciti.biz/guide/Shebang)
    -   [Variables d'environnement](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)
    -   [GNU GLOBBING](https://man7.org/linux/man-pages/man7/glob.7.html)
    -   [Global](https://linuxhint.com/bash_globbing_tutorial/)
    -   [Citation](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
    -   [Expressions régulières](https://www.gnu.org/software/grep/manual/html_node/Regular-Expressions.html)
    -   [Commande non trouvée](https://command-not-found.com/)
    -   [Générateur Bashrc](http://bashrcgenerator.com/)
    -   [Expliquer](https://explainshell.com/)
    -   [Tutoriel VIM](https://www.openvim.com/)
    -   [Tutoriel de script de shell Linux](https://bash.cyberciti.biz/guide/Main_Page)
    -   [Commandes Exemples](https://www.geeksforgeeks.org/)
-   [Autres outils](<>)
    -   [Bugzila](https://bugzilla.kernel.org/)
    -   [Badges Github](https://github.com/alexandresanlim/Badges4-README.md-Profile)
-   [Définitions de virtualisation](<>)
    -   [Chapeau rouge](https://www.redhat.com/pt-br/topics/virtualization/what-is-virtualization)
    -   [AWS](https://aws.amazon.com/pt/what-is/virtualization/)
    -   [Ibm](https://www.ibm.com/topics/virtualization)
    -   [OpenSource.com](https://opensource.com/resources/virtualization)
-   [Kvm](<>)
    -   [KVM (machines virtuelles du noyau)](https://www.redhat.com/pt-br/topics/virtualization/what-is-KVM)
    -   [Outils de gestion KVM](https://www.linux-kvm.org/page/Management_Tools)
-   [Alterner](<>)
    -   [Xenserver](https://www.xenserver.com/)
    -   [Wiki xenproject](https://wiki.xenproject.org/wiki/Main_Page)
    -   [Interfaces réseau](https://wiki.xenproject.org/wiki/Xen_Networking#Virtual_Network_Interfaces)
    -   [Outils Xen](https://xen-tools.org/software/)
    -   [Blog LPI: Virtualisation Xen et cloud computing # 01: Introduction](https://www.lpi.org/pt-br/blog/2020/10/01/xen-virtualization-and-cloud-computing-01-introduction/)
    -   [Blog LPI: Xen Virtualisation et cloud computing # 02: Comment Xen fait le travail](https://www.lpi.org/blog/2020/10/08/xen-virtualization-and-cloud-computing-02-how-xen-does-job/)
    -   [Blog LPI: Virtualisation Xen et cloud computing # 04: conteneurs, OpenStack et autres plateformes connexes](https://www.lpi.org/pt-br/blog/2020/10/22/xen-virtualization-and-cloud-computing-04-containers-openstack-and-other-related/)
    -   [Virtualisation Xen et cloud computing # 05: The Xen Project, Unikernell et l'avenir](https://www.lpi.org/pt-br/blog/2020/10/29/xen-virtualization-and-cloud-computing-05-xen-project-unikernels-and-future/)
    -   [Guide des débutants du projet Xen](https://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide#Installing_the_Xen_Project_Software)
    -   [Livre fou](https://wiki.xenproject.org/wiki/Book/HelloXenProject/0-Contents)
-   [Unicernel](https://www.lpi.org/blog/2020/10/29/xen-virtualization-and-cloud-computing-05-xen-project-unikernels-and-future/)
    -   [Force unique](https://github.com/unikraft/unikraft)
    -   [Mirageos](https://mirage.io/docs/hello-world)
    -   [Mauvais](https://galois.com/project/halvm/)
    -   [Unique](https://github.com/solo-io/unik/blob/master/docs/providers/virtualbox.md)
-   [Docs OpenStack](<>)
    -   [Redhat](https://www.redhat.com/pt-br/topics/openstack)
-   [VSWitch ouvert](<>)
    -   [Ovs doc 4linux](https://blog.4linux.com.br/open-vswitch-o-que-e-o-que-come-onde-vive)
-   [Examen LPIC-3 305-300](<>)
    -   [LPIC-3 305-300 Objectifs](https://www.lpi.org/our-certifications/exam-305-objectives/)
    -   [LPIC-3 305-300 Wiki](https://wiki.lpi.org/wiki/LPIC-305_Objectives_V3.0)
    -   [LPIC-3 305-300 Matériel d'apprentissage](https://cursos.linuxsemfronteiras.com.br/courses/preparatorio-para-certificacao-lpic-3-305/)
    -   [LPIC-3 305-300 Examen simulé par iTexams](https://www.itexams.com/info/305-300)

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
