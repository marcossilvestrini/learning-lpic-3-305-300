```markdown
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

# APPRENTISSAGE LPIC-3 305-300

![LPIC3-305-300](images/lpic3-305-300.jpg)

<p align="center">
<strong>Explorer la doc »</strong></a>
    <br />
    <a href="https://marcossilvestrini.github.io/learning-lpic-3-305-300/">Site Web</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300">Page de code</a>
    -
    <a href="https://skynet-8.gitbook.io/learning-lpic-3-305-300">Gitbook</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">Signaler un bug</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">Demander une fonctionnalité</a>
</p>

---

## Résumé

<details>
  <summary><b>TABLE DES MATIÈRES</b></summary>
  <ol>
    <li>
      <a href="#about-the-project">À propos du projet</a>
    </li>
    <li>
      <a href="#getting-started">Débuter</a>
      <ul>
        <li><a href="#prerequisites">Prérequis</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Utilisation</a></li>
    <li><a href="#roadmap">Feuille de route</a></li>
    <li><a href="#freedoms">Quatre libertés essentielles</a></li>
    <li>
      <a href="#topic-351">Sujet 351 : Virtualisation complète</a>
      <ul>
        <li><a href="#topic-351.1">351.1 Concepts et théorie de la virtualisation</a></li>
        <li><a href="#topic-351.2">351.2 Xen</a></li>
        <li><a href="#topic-351.3">351.3 QEMU</a></li>
        <li><a href="#topic-351.4">351.4 Gestionnaire de machines virtuelles Libvirt</a></li>
        <li><a href="#topic-351.5">351.5 Gestion d’images de disques de machines virtuelles</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-352">Sujet 352 : Virtualisation de conteneurs</a>
      <ul>
        <li><a href="#topic-352.1">352.1 Concepts de virtualisation de conteneurs</a></li>
        <li><a href="#topic-352.2">352.2 LXC</a></li>
        <li><a href="#topic-352.3">352.3 Docker</a></li>
        <li><a href="#topic-352.4">352.4 Plateformes d’orchestration de conteneurs</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-353">Sujet 353 : Déploiement et provisionnement de VM</a>
      <ul>
        <li><a href="#topic-353.1">353.1 Outils de gestion cloud</a></li>
        <li><a href="#topic-353.2">353.2 Packer</a></li>
        <li><a href="#topic-353.3">353.3 cloud-init</a></li>
        <li><a href="#topic-353.4">353.4 Vagrant</a></li>
      </ul>
    </li>
    <li><a href="#license">Licence</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Remerciements</a></li>
  </ol>
</details><br>

---

<a name="about-the-project"></a>

## À propos du projet

> Ce projet vise à aider les étudiants ou professionnels à apprendre les concepts principaux de GNULinux
> et de logiciels libres
> Certaines distributions de GNULinux comme Debian et RPM seront couvertes
> L’installation et la configuration de certains paquets seront également abordées
> En faisant cela, vous pouvez donner à toute la communauté une chance de bénéficier de vos modifications.
> L’accès au code source est une condition préalable à cela.
> Utilisez vagrant pour lancer des machines et exécutez des labs et contenus de pratique dans cet article.
> J’ai publié dans le dossier Vagrant un Vagrantfile avec ce qui est nécessaire
> pour que vous puissiez déployer un environnement d’études

---

<p align="right">(<a href="#readme-top">retour en haut</a>)</p>

<a name="getting-started"></a>

## Débuter

Pour commencer l’apprentissage, voir la documentation ci-dessus.

<a name="prerequisites"></a>

### Prérequis

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [VMware Workstation](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
* [Vagrant VMWare Utility](https://developer.hashicorp.com/vagrant/install/vmware)
* [Vagrant](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### Installation

Cloner le dépôt

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

Personnaliser un modèle *Vagrantfile-topic-XXX*. Ce fichier contient une configuration de VM pour les labs. Exemple :

* Fichier [Vagrantfile-topic-351](vagrant/Vagrantfile-topic-351)
  * vm.clone_directory = "<lettre_du_dossier>:\\`<dossier>`\\<vers_machine>\\#{VM_NAME}-instance-1"
    Exemple : vm.clone_directory = "E:\\Serveurs\\VMWare\\#{VM_NAME}-instance-1"
  * vm.vmx["memsize"] = ""
  * vm.vmx["numvcpus"] = ""
  * vm.vmx["cpuid.coresPerSocket"] = ""

Personnaliser la configuration réseau dans les fichiers [configs/network](configs/network/).

---

<a name="usage"></a>

## Utilisation

Utilisez ce dépôt pour apprendre le contenu de l’examen LPIC-3 305-300

### Pour monter et arrêter

Changer le modèle *Vagrantfile-topic-xxx* et le copier dans un nouveau fichier nommé *Vagrantfile*

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### Pour redémarrer les VM

```sh
cd vagrant && vagrant reload
```

**Important :**
*Si vous redémarrez les VM sans vagrant, le dossier partagé ne sera pas monté après le démarrage.*

### Utiliser powershell pour monter et arrêter

Si vous utilisez Windows, j’ai créé un script powershell pour monter et arrêter les VM.

```powershell
vagrant/up.ps1
vagrant/destroy.ps1
```

### Schéma d’infrastructure Sujet 351

![topic-351](images/infraestructure-topic-351.png)

<p align="right">(<a href="#readme-top">retour en haut</a>)</p>

---

<a name="roadmap"></a>

## Feuille de route

* [X] Créer le dépôt
* [X] Créer des scripts pour la mise en service des labs
* [X] Créer des exemples pour le Sujet 351
* [X] Créer des exemples pour le Sujet 352
* [ ] Créer des exemples pour le Sujet 353
* [ ] Télécharger l’IT Exam simulé

---

<a name="freedoms"></a>

## Quatre libertés fondamentales

> 0.La liberté d'exécuter le programme comme vous le souhaitez, pour n'importe quel but (liberté 0).
> 1.La liberté d'étudier comment le programme fonctionne, et de le modifier afin qu'il corresponde
> à votre calcul (liberté 1).
> L'accès au code source est une condition préalable pour cela.
> 2.La liberté de redistribuer des copies pour aider les autres (liberté 2).
> 3.la liberté de distribuer des copies de vos versions modifiées à d'autres (liberté 3).

---

## Commandes d’inspection

```sh
type COMMANDE
apropos COMMANDE
whatis COMMANDE --long
whereis COMMANDE
COMMANDE --help, --h
man COMMANDE
```

<p align="right">(<a href="#readme-top">retour en haut</a>)</p>

---

<a name="topic-351"></a>

## Sujet 351 : Virtualisation complète

![LPIC3-305-300](images/virtualization-351.png)

---

<a name="topic-351.1"></a>

### 351.1 Concepts et théorie de la virtualisation

**Poids :** 6

**Description :** Les candidats doivent connaître et comprendre les concepts, la théorie et la terminologie de la virtualisation. Cela inclut la terminologie Xen, QEMU et libvirt.

**Domaines de connaissances clés :**

* 🖥️ Comprendre la terminologie de la virtualisation
* ⚖️ Comprendre les avantages et inconvénients de la virtualisation
* 🛠️ Comprendre les différentes variations d'hyperviseurs et de moniteurs de machines virtuelles
* 🔄 Comprendre les principaux aspects de la migration des machines physiques vers virtuelles
* 🚀 Comprendre les principaux aspects de la migration des machines virtuelles entre systèmes hôtes
* 📸 Comprendre les fonctionnalités et implications de la virtualisation pour une machine virtuelle, telles que la capture d’état (snapshot), la mise en pause, le clonage et les limites de ressources
* 🌐 Connaissance d’oVirt, Proxmox, systemd-machined et VirtualBox
* 🔗 Connaissance d’Open vSwitch

#### 351.1 Objets cités

```sh
Hyperviseur
Machine virtuelle matérielle (HVM)
Paravirtualisation (PV)
Émulation et simulation
Flags CPU
/proc/cpuinfo
Migration (P2V, V2V)
```

#### Hyperviseurs

##### Hyperviseur de type 1 (Hyperviseur bare-metal)

###### Définition du type 1

Fonctionne directement sur le matériel physique de l’hôte, fournissant une couche de gestion des VM sans besoin d’un système d’exploitation hôte.

###### Caractéristiques du type 1

* ⚡ Performance et efficacité élevées.
* ⏱️ Latence et surcharge réduites.
* 🏢 Souvent utilisé en entreprise et centres de données.

###### Exemples de type 1

* VMware ESXi : Un hyperviseur robuste et largement utilisé en entreprise.
* Microsoft Hyper-V : Intégré à Windows Server, offrant de solides performances et fonctionnalités de gestion.
* Xen : Hyperviseur open source utilisé par de nombreux fournisseurs de cloud.
* KVM (Kernel-based Virtual Machine) : Intégré au noyau Linux, offrant de hautes performances pour les systèmes Linux.

##### Hyperviseur de type 2 (Hyperviseur hébergé)

###### Définition du type 2

Fonctionne au-dessus d'un système d'exploitation classique, s’appuyant sur celui-ci pour la gestion des ressources et support périphériques.

###### Caractéristiques du type 2

* 🛠️ Plus facile à mettre en place et utiliser, surtout sur ordinateur personnel.
* 🔧 Plus flexible pour le développement, le test et les déploiements à petite échelle.
* 🐢 Typiquement moins efficace que le type 1 en raison d’un surcoût de l’hôte.

###### Exemples de type 2

* VMware Workstation : Hyperviseur puissant pour faire tourner plusieurs OS sur un même poste.
* Oracle VirtualBox : Hyperviseur open source reconnu pour sa flexibilité.
* Parallels Desktop : Conçu pour Mac pour faire tourner Windows et autres OS simultanément.
* QEMU (Quick EMUlator) : Émulateur et virtualiseur open source, souvent en complément avec KVM.

##### Différences clés entre hyperviseur de type 1 et 2

* Environnement de déploiement :
  * Hyperviseurs de type 1 déployés généralement en centres de données / entreprises pour leur interaction directe avec le matériel et haute performance.
  * Hyperviseurs de type 2 plus adaptés à l’usage personnel, développement, test et petits déploiements.
* Performance :
  * Hyperviseurs de type 1 offrent généralement une meilleure performance et une latence plus faible car ils ne dépendent pas d’un OS hôte.
  * Hyperviseurs de type 2 peuvent subir une dégradation de performance en raison d’une surcharge additionnelle par l’OS hôte.
* Gestion et facilité d’utilisation :
  * Hyperviseurs de type 1 nécessitent des configurations plus complexes mais offrent des fonctionnalités avancées et une meilleure scalabilité.
  * Hyperviseurs de type 2 plus simples à installer et utiliser, idéaux pour utilisateur individuel ou petits projets.

##### Types de migration

Dans le contexte des hyperviseurs, qui sont des technologies pour créer et gérer des machines virtuelles, les termes P2V migration et V2V migration sont couramment utilisés dans la virtualisation.
Ils désignent les processus de migration entre différentes plateformes.

##### P2V - Migration physique vers virtuelle

La migration P2V consiste à déplacer un serveur physique vers une machine virtuelle.C’est-à-dire, un système d’exploitation et ses applications, tournant sur un matériel dédié, qui sont "convertis" et déplacés vers une VM sur un hyperviseur (ex. VMware, Hyper-V, KVM).

* Exemple : vous avez un serveur physique sous Windows ou Linux, et souhaitez le migrer vers un environnement virtuel, comme une infrastructure cloud ou un hyperviseur interne.
  Le processus implique la copie de tout l’état du système, y compris système d’exploitation, pilotes, données, pour créer une VM équivalente qui pourra tourner comme sur le matériel physique.

##### V2V - Migration virtuelle vers virtuelle

V2V désigne la migration d’une VM d’un hyperviseur à un autre.
Par exemple, une VM en cours d’exécution sur VMware, et on souhaite la déplacer vers Hyper-V ou un autre serveur VMware.

* Exemple : vous avez une VM sur VMware et souhaitez la transférer vers Hyper-V. La migration V2V convertit la VM d’un format ou hyperviseur à un autre pour qu’elle continue à fonctionner correctement.

#### HVM et Paravirtualisation

##### Virtualisation assistée par matériel (HVM)

###### Définition de HVM

Utilise les extensions matérielles fournies par les CPU modernes pour virtualiser le matériel, permettant la création et gestion de VM avec un peu de surcharge de performance.

###### Caractéristiques clés de HVM

* 🖥️ **Support matériel** : Nécessite la prise en charge par le CPU des extensions de virtualisation, Intel VT-x ou AMD-V.
* 🛠️ **Virtualisation complète :** VM peut exécuter un OS invité non modifié, l’hyperviseur fournit une émulation complète du matériel.
* ⚡ **Performance :** Offre généralement des performances proches du natif, car l’exécution des codes invités se fait directement sur le CPU.
* 🔒 **Isolation :** Fournit une forte isolation entre VM, chaque VM semblant avoir son propre matériel dédié.

###### Exemples HVM

VMware ESXi, Microsoft Hyper-V, KVM.

###### Avantages HVM

* ✅ **Compatibilité :** Peut exécuter n’importe quel OS invité sans modifications.
* ⚡ **Performance :** Haute performance grâce au support matériel.
* 🔒 **Sécurité :** Isolation et sécurité renforcées par le matériel.

###### Inconvénients HVM

* 🛠️ **Dépendance matérielle :** Nécessite des fonctionnalités matérielles spécifiques, limitant la compatibilité avec des anciens systèmes.
* 🔧 **Complexité :** Peut demander une configuration et gestion plus avancée.

##### Paravirtualisation

###### Définition de paravirtualisation

Impliquant de modifier l’OS invité pour qu’il soit conscient de l’environnement virtualisé, une communication plus efficace avec l’hyperviseur est possible.

###### Caractéristiques clés de la paravirtualisation

* 🛠️ **Modification de l'invité :** Nécessite des changements dans l’OS invité pour communiquer directement par hypercalls avec l’hyperviseur.
* ⚡ **Performance :** Peut être plus efficace que la virtualisation complète traditionnelle, en réduisant la surcharge d’émulation du matériel.
* 🔗 **Compatibilité :** Limitée aux OS modifiés pour la paravirtualisation.

###### Exemples de paravirtualisation

Xen avec invités paravirt, outils VMware dans certaines configurations, et certains paramètres KVM.

###### Avantages paravirtualisation

* ⚡ **Efficacité :** Réduit la surcharge d’émulation matérielle, avec de meilleures performances pour certains workloads.
* ✅ **Utilisation efficace des ressources :** Communication directe entre OS invité et hyperviseur.

###### Inconvénients paravirtualisation

* 🛠️ **Modification de l’OS invité :** Limite la compatibilité à certains OS supportés.
* 🔧 **Complexité :** Plus de configuration nécessaire dans l’OS invité pour hypercalls.

##### Différences clés

###### Exigences pour OS invité

* **HVM :** Peut faire tourner OS non modifié.
* **Paravirtualisation :** Nécessite une modification de l’OS invité.

###### Performance

* **HVM :** Offrant une performance proche du natif grâce à l’assistance matérielle.
* **Paravirtualisation :** Performance potentiellement meilleure par réduction de l’émulation, mais dépend d’OS modifiés.

###### Dépendance matérielle

* **HVM :** Requiert certaines fonctionnalités CPU (VT-x, AMD-V).
* **Paravirtualisation :** Pas besoin de fonctionnalités CPU spécifiques, mais modification nécessaire de l’OS invité.

###### Isolement

* **HVM :** Forte isolation via fonctionnalités matérielles.
* **Paravirtualisation :** Isolation logicielle, moins robuste que matérielle.

###### Complexité

* **HVM :** Plus simple à déployer, supportant OS non modifié.
* **Paravirtualisation :** Plus complexe avec modifications OS.

#### NUMA (Mémoire non uniforme)

NUMA (Non-Uniform Memory Access) est une architecture mémoire utilisée dans les systèmes multiprocesseurs pour optimiser l’accès mémoire par les processeurs.
Dans un système NUMA, la mémoire est distribuée de façon déséquilibrée entre processeurs, chaque processeur ayant un accès plus rapide à une partie de la mémoire (sa "mémoire locale") qu’à une mémoire située plus loin (mémoire "distante") associée à d’autres processeurs.

##### Caractéristiques clés de l’architecture NUMA

1. **Mémoire locale et distante** : chaque processeur a sa propre mémoire locale, plus rapide d’accès. Il peut aussi accéder à la mémoire d’autres processeurs, mais cela prend plus de temps.
2. **Latence différenciée** : la latence d’accès mémoire varie selon que le processeur accède à sa mémoire locale ou distante. La mémoire locale est plus rapide.
3. **Scalabilité** : conçu pour améliorer la scalabilité dans de grands systèmes multiprocesseurs. En ajoutant des processeurs, la mémoire est aussi répartie, évitant le goulot d’étranglement d’une architecture UMA (Mémoire uniforme).
 
##### Avantages de NUMA

* ⚡ Meilleure performance dans les grands systèmes : chaque processeur peut travailler plus efficacement sans trop concurrencer pour l’accès mémoire.
* 📈 Scalabilité : NUMA permet à des systèmes avec beaucoup de processeurs et de grandes quantités de mémoire de mieux évoluer.

##### Inconvénients

* 🛠️ Complexité de programmation : optimiser l’utilisation de la mémoire locale ou distante est nécessaire.
* 🐢 Pénalités de performance potentielles : accès fréquent à la mémoire distante, avec latence plus longue.
  Cette architecture est courante dans les systèmes serveurs haute performance, comme dans les supercalculateurs où la scalabilité et l’optimisation mémoire sont critiques.

#### Solutions open source

* 🌐 oVirt: [https://www.ovirt.org/](https://www.ovirt.org/)
* 🌐 Proxmox: [https://www.proxmox.com/en/proxmox-virtual-environment/overview](https://www.proxmox.com/en/proxmox-virtual-environment/overview)
* 🌐 Oracle VirtualBox: [https://www.virtualbox.org/](https://www.virtualbox.org/)
* 🌐 Open vSwitch: [https://www.openvswitch.org/](https://www.openvswitch.org/)

#### Types de virtualisation

##### Virtualisation matérielle (virtualisation serveur)

###### Définition du HV

Abstraction du matériel physique pour créer des VM tournant avec leur propre OS et applications.

###### Cas d’usage HV

Centres de données, cloud, consolidation de serveurs.

###### Exemples HV

VMware ESXi, Microsoft Hyper-V, KVM.

##### Virtualisation du système d'exploitation (conteneurisation)

###### Définition de conteneur

Permet l’exécution de multiples espaces utilisateur isolés (conteneurs) sur un seul noyau OS.

###### Cas d’usage conteneur

Architecture microservices, développement et test.

###### Exemples conteneur

Docker, Kubernetes, LXC.

##### Virtualisation réseau

###### Définition Virtualisation réseau

Regroupe ressources réseau matérielles et logicielles dans une entité administrative unique en logiciel.

###### Cas d’usage Virtualisation réseau

Réseaux définis par logiciel (SDN), virtualisation des fonctions réseau (NFV).

###### Exemples Virtualisation réseau

VMware NSX, Cisco ACI, OpenStack Neutron.

##### Virtualisation stockage

###### Définition virtualisation stockage

Pool de stockage physique provenant de plusieurs dispositifs en une unité de stockage virtuelle centralisée.

###### Cas d’usage virtualisation stockage

Gestion de données, optimisation du stockage, récupération après sinistre.

###### Exemples virtualisation stockage

IBM SAN Volume Controller, VMware vSAN, NetApp ONTAP.

##### Virtualisation bureau

###### Définition virtualisation bureau

Permet à un OS de bureau de s’exécuter sur une VM hébergée sur un serveur.

###### Cas d’usage virtualisation bureau

Infrastructure de bureau virtuel (VDI), solutions de télétravail.

###### Exemples virtualisation bureau

Citrix Virtual Apps and Desktops, VMware Horizon, Microsoft Remote Desktop Services.

##### Virtualisation applications

###### Définition virtualisation applications

Sépare les applications du matériel et OS sous-jacent, pour qu’elles fonctionnent dans des environnements isolés.

###### Cas d’usage virtualisation applications

Simplification déploiement, tests de compatibilité.

###### Exemples virtualisation applications

VMware ThinApp, Microsoft App-V, Citrix XenApp.

##### Virtualisation données

###### Définition virtualisation données

Intègre des données provenant de diverses sources sans les consolider physiquement, pour une vue unifiée en analyse et reporting.

###### Cas d’usage virtualisation données

Intelligence d’affaires, intégration de données en temps réel.

###### Exemples virtualisation données

Denodo, Red Hat JBoss Data Virtualization, IBM InfoSphere.

##### Avantages de la virtualisation

* ⚡ Utilisation efficace des ressources physiques.
* 💰 Économies.
* 📈 Facilité de mise à l’échelle.
* 🔧 Flexibilité.
* 🔄 Récupération après sinistre.
* 🔒 Isolation.

#### Émulation

L’émulation simule le comportement du matériel ou logiciel sur une plateforme différente de celle initiale.

Cela permet à un logiciel destiné à un système d’exécuter sur un autre, avec architecture ou environnement différent.

L’émulation offre une grande flexibilité, mais implique généralement une surcharge de performances, car le système émulé doit interpréter et traduire les instructions.

Malgré cette surcharge, elle est utile pour faire fonctionner des logiciels anciens, tester sur différentes plateformes ou développer en cross-platform.

#### systemd-machined

Le service systemd-machined gère les machines virtuelles et conteneurs dans l’écosystème systemd.
Il offre des fonctionnalités essentielles pour contrôler, surveiller et maintenir ces instances virtuelles, avec une intégration robuste dans Linux.

<p align="right">(<a href="#topic-351.1">retour sous thème 351.1</a>)</p>
<p align="right">(<a href="#topic-351">retour au sujet 351</a>)</p>
<p align="right">(<a href="#readme-top">retour en haut</a>)</p>
```