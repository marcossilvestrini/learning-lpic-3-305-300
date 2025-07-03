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

# APRENDIENDO LPIC-3 305-300 - PRUEBA TRADUCCIÓN 02/07/2025

![LPIC3-305-300](images/lpic3-305-300.jpg)

<p align="center">
<strong>Explora la documentación »</strong></a>
    <br />
    <a href="https://marcossilvestrini.github.io/learning-lpic-3-305-300/">Sitio Web</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300">Página de Código</a>
    -
    <a href="https://skynet-8.gitbook.io/learning-lpic-3-305-300">Gitbook</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">Reportar Error</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">Solicitar Característica</a>
</p>

---

## Resumen

<details>
  <summary><b>TABLA DE CONTENIDO</b></summary>
  <ol>
    <li>
      <a href="#about-the-project">Acerca del Proyecto</a>
    </li>
    <li>
      <a href="#getting-started">Comenzando</a>
      <ul>
        <li><a href="#prerequisites">Requisitos Previos</a></li>
        <li><a href="#installation">Instalación</a></li>
      </ul>
    </li>
    <li><a href="#usage">Uso</a></li>
    <li><a href="#roadmap">Hoja de Ruta</a></li>
    <li><a href="#freedoms">Cuatro Libertades Esenciales</a></li>
    <li>
      <a href="#topic-351">Tema 351: Virtualización Completa</a>
      <ul>
        <li><a href="#topic-351.1">351.1 Conceptos y Teoría de Virtualización </a></li>
        <li><a href="#topic-351.2">351.2 Xen</a></li>
        <li><a href="#topic-351.3">351.3 QEMU</a></li>
        <li><a href="#topic-351.4">351.4 Gestión de Máquinas Virtuales Libvirt</a></li>
        <li><a href="#topic-351.5">351.5 Gestión de Imágenes de Disco de Máquinas Virtuales</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-352">Tema 352: Virtualización de Contenedores</a>
      <ul>
        <li><a href="#topic-352.1">352.1 Conceptos de Virtualización de Contenedores</a></li>
        <li><a href="#topic-352.2">352.2 LXC</a></li>
        <li><a href="#topic-352.3">352.3 Docker</a></li>
        <li><a href="#topic-352.4">352.4 Plataformas de Orquestación de Contenedores</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-353">Tema 353: Implementación y Aprovisionamiento de VM</a>
      <ul>
        <li><a href="#topic-353.1">353.1 Herramientas de Gestión en la Nube</a></li>
        <li><a href="#topic-353.2">353.2 Packer</a></li>
        <li><a href="#topic-353.3">353.3 cloud-init</a></li>
        <li><a href="#topic-353.4">353.4 Vagrant</a></li>
      </ul>
    </li>
    <li><a href="#license">Licencia</a></li>
    <li><a href="#contact">Contacto</a></li>
    <li><a href="#acknowledgments">Agradecimientos</a></li>
  </ol>
</details><br>

---

<a name="about-the-project"></a>

## Acerca del Proyecto

> Este proyecto tiene como objetivo ayudar a estudiantes o profesionales a aprender los conceptos principales de GNULinux
> y software libre
> Algunas distribuciones de GNULinux como Debian y RPM serán cubiertas
> La instalación y configuración de algunos paquetes también serán cubiertas
> Al hacer esto, puedes dar a toda la comunidad la oportunidad de beneficiarse de tus cambios.
> El acceso al código fuente es una condición previa para esto.
> Usa vagrant para levantar máquinas y ejecutar laboratorios y contenido práctico en este artículo.
> He publicado en la carpeta Vagrant un Vagrantfile con lo necesario
> para que puedas subir un entorno para estudios

---

<p align="right">(<a href="#readme-top">volver al inicio</a>)</p>

<a name="getting-started"></a>

## Comenzando

Para comenzar el aprendizaje, consulta la documentación anterior.

<a name="prerequisites"></a>

### Requisitos Previos

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [VMware Workstation](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
* [Vagrant VMWare Utility](https://developer.hashicorp.com/vagrant/install/vmware)
* [Vagrant](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### Instalación

Clona el repositorio

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

Personaliza una plantilla *Vagrantfile-topic-XXX*. Este archivo contiene una configuración de vms para laboratorios. Ejemplo:

* Archivo [Vagrantfile-topic-351](vagrant/Vagrantfile-topic-351)
  * vm.clone_directory = "<tu_letra_de_controlador>:\\`<carpeta>`\\<a_maquina>\\#{VM_NAME}-instance-1"
    Ejemplo: vm.clone_directory = "E:\\Servers\\VMWare\\#{VM_NAME}-instance-1"
  * vm.vmx["memsize"] = ""
  * vm.vmx["numvcpus"] = ""
  * vm.vmx["cpuid.coresPerSocket"] = ""

Personaliza la configuración de red en los archivos [configs/network](configs/network/).

---

<a name="usage"></a>

## Uso

Usa este repositorio para aprender sobre el examen LPIC-3 305-300

### Para levantar y bajar

Cambia una plantilla *Vagrantfile-topic-xxx* y copia a un nuevo archivo con el nombre *Vagrantfile*

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### Para reiniciar vms

```sh
cd vagrant && vagrant reload
```

**Importante:**
*Si reinicias vms sin vagrant, la carpeta compartida no se montará después del arranque.*

### Usa powershell para levantar y bajar

Si usas la plataforma Windows, he creado un script de powershell para levantar y bajar vms.

```powershell
vagrant/up.ps1
vagrant/destroy.ps1
```

### Esquema de Infraestructura Tema 351

![topic-351](images/infraestructure-topic-351.png)

<p align="right">(<a href="#readme-top">volver al inicio</a>)</p>

---

<a name="roadmap"></a>

## Hoja de Ruta

* [X] Crear repositorio
* [X] Crear scripts para aprovisionar laboratorios
* [X] Crear ejemplos sobre el Tema 351
* [X] Crear ejemplos sobre el Tema 352
* [ ] Crear ejemplos sobre el Tema 353
* [ ] Subir examen simulado

---

<a name="freedoms"></a>

## Cuatro Libertades Esenciales

> 0.La libertad de ejecutar el programa como desees, para cualquier propósito (libertad 0).
> 1.La libertad de estudiar cómo funciona el programa y cambiarlo para que haga
> tu computación como desees (libertad 1).
> El acceso al código fuente es una condición previa para esto.
> 2.La libertad de redistribuir copias para que puedas ayudar a otros (libertad 2).
> 3.la libertad de distribuir copias de tus versiones modificadas a otros (libertad 3).

---

## Comandos de Inspección

```sh
type COMMAND
apropos COMMAND
whatis COMMAND --long
whereis COMMAND
COMMAND --help, --h
man COMMAND
```

<p align="right">(<a href="#readme-top">volver al inicio</a>)</p>

---

<a name="topic-351"></a>

## Tema 351: Virtualización Completa

![LPIC3-305-300](images/virtualization-351.png)

---

<a name="topic-351.1"></a>

### 351.1 Conceptos y Teoría de Virtualización

**Peso:** 6

**Descripción:** Los candidatos deben conocer y entender los conceptos generales, la teoría y la terminología de la virtualización. Esto incluye la terminología de Xen, QEMU y libvirt.

**Áreas de Conocimiento Clave:**

* 🖥️ Entender la terminología de virtualización
* ⚖️ Entender los pros y los contras de la virtualización
* 🛠️ Entender las diversas variaciones de hipervisores y monitores de máquinas virtuales
* 🔄 Entender los aspectos principales de la migración de máquinas físicas a virtuales
* 🚀 Entender los aspectos principales de la migración de máquinas virtuales entre sistemas host
* 📸 Entender las características e implicaciones de la virtualización para una máquina virtual, como la creación de instantáneas, la pausa, la clonación y los límites de recursos
* 🌐 Conocimiento de oVirt, Proxmox, systemd-machined y VirtualBox
* 🔗 Conocimiento de Open vSwitch

#### 351.1 Objetos Citados

```sh
Hypervisor
Máquina Virtual Asistida por Hardware (HVM)
Paravirtualización (PV)
Emulación y Simulación
Banderas de CPU
/proc/cpuinfo
Migración (P2V, V2V)
```

#### Hipervisores

##### Hipervisor Tipo 1 (Hipervisor Bare-Metal)

###### Definición Tipo 1

Se ejecuta directamente en el hardware físico del host, proporcionando una capa base para gestionar VMs sin necesidad de un sistema operativo host.

###### Características Tipo 1

* ⚡ Alto rendimiento y eficiencia.
* ⏱️ Menor latencia y sobrecarga.
* 🏢 A menudo utilizado en entornos empresariales y centros de datos.

###### Ejemplos Tipo 1

* VMware ESXi: Un hipervisor robusto y ampliamente utilizado en entornos empresariales.
* Microsoft Hyper-V: Integrado con Windows Server, ofreciendo un fuerte rendimiento y características de gestión.
* Xen: Un hipervisor de código abierto utilizado por muchos proveedores de servicios en la nube.
* KVM (Máquina Virtual Basada en Kernel): Integrado en el núcleo de Linux, proporcionando un alto rendimiento para sistemas basados en Linux.

##### Hipervisor Tipo 2 (Hipervisor Alojado)

###### Definición Tipo 2

Se ejecuta sobre un sistema operativo convencional, dependiendo del OS host para la gestión de recursos y soporte de dispositivos.

###### Características Tipo 2

* 🛠️ Más fácil de configurar y usar, especialmente en computadoras personales.
* 🔧 Más flexible para desarrollo, pruebas y despliegues a pequeña escala.
* 🐢 Típicamente menos eficiente que los hipervisores Tipo 1 debido a la sobrecarga adicional del OS host.

###### Ejemplos Tipo 2

* VMware Workstation: Un hipervisor potente para ejecutar múltiples sistemas operativos en un solo escritorio.
* Oracle VirtualBox: Un hipervisor de código abierto conocido por su flexibilidad y facilidad de uso.
* Parallels Desktop: Diseñado para usuarios de Mac para ejecutar Windows y otros sistemas operativos junto a macOS.
* QEMU (Quick EMUlator): Un emulador y virtualizador de código abierto, a menudo utilizado junto con KVM.

##### Diferencias Clave Entre Hipervisores Tipo 1 y Tipo 2

* Entorno de Despliegue:
  * Los hipervisores Tipo 1 se despliegan comúnmente en centros de datos y entornos empresariales debido a su interacción directa con el hardware y alto rendimiento.
  * Los hipervisores Tipo 2 son más adecuados para uso personal, desarrollo, pruebas y tareas de virtualización a pequeña escala.
* Rendimiento:
  * Los hipervisores Tipo 1 generalmente ofrecen un mejor rendimiento y menor latencia porque no dependen de un OS host.
  * Los hipervisores Tipo 2 pueden experimentar cierta degradación del rendimiento debido a la sobrecarga de ejecutarse sobre un OS host.
* Gestión y Facilidad de Uso:
  * Los hipervisores Tipo 1 requieren una configuración y gestión más complejas, pero proporcionan características avanzadas y escalabilidad para despliegues a gran escala.
  * Los hipervisores Tipo 2 son más fáciles de instalar y usar, lo que los hace ideales para usuarios individuales y proyectos más pequeños.

##### Tipos de Migración

En el contexto de los hipervisores, que son tecnologías utilizadas para crear y gestionar máquinas virtuales, los términos migración P2V y migración V2V son comunes en entornos de virtualización.
Se refieren a procesos de migración de sistemas entre diferentes tipos de plataformas.

##### P2V - Migración de Física a Virtual

La migración P2V se refiere al proceso de migrar un servidor físico a una máquina virtual. En otras palabras, un sistema operativo y sus aplicaciones, que se ejecutan en hardware físico dedicado, son "convertidos" y trasladados a una máquina virtual que se ejecuta en un hipervisor (como VMware, Hyper-V, KVM, etc.).

* Ejemplo: Tienes un servidor físico que ejecuta un sistema Windows o Linux, y deseas moverlo a un entorno virtual, como una infraestructura en la nube o un servidor de virtualización interno.
  El proceso implica copiar todo el estado del sistema, incluyendo el sistema operativo, controladores y datos, para crear una máquina virtual equivalente que pueda ejecutarse como si estuviera en el hardware físico.

##### V2V  - Migración de Virtual a Virtual

La migración V2V se refiere al proceso de migrar una máquina virtual de un hipervisor a otro. En este caso, ya tienes una máquina virtual que se ejecuta en un entorno virtualizado (como VMware), y deseas moverla a otro entorno virtualizado (por ejemplo, a Hyper-V o a un nuevo servidor VMware).

* Ejemplo: Tienes una máquina virtual que se ejecuta en un servidor de virtualización VMware, pero decides migrarla a una plataforma Hyper-V. En este caso, la migración V2V convierte la máquina virtual de un formato o hipervisor a otro, asegurando que pueda seguir ejecutándose correctamente.

#### HVM y Paravirtualización

##### Virtualización Asistida por Hardware (HVM)

###### Definición HVM

HVM aprovecha las extensiones de hardware proporcionadas por las CPUs modernas para virtualizar hardware, permitiendo la creación y gestión de VMs con un mínimo de sobrecarga de rendimiento.

###### Características Clave de HVM

* 🖥️ **Soporte de Hardware**: Requiere soporte de CPU para extensiones de virtualización como Intel VT-x o AMD-V.
* 🛠️ **Virtualización Completa:** Las VMs pueden ejecutar sistemas operativos invitados no modificados, ya que el hipervisor proporciona una emulación completa del entorno de hardware.
* ⚡ **Rendimiento:** Ofrece típicamente un rendimiento casi nativo debido a la ejecución directa del código invitado en la CPU.
* 🔒 **Aislamiento:** Proporciona un fuerte aislamiento entre VMs, ya que cada VM opera como si tuviera su propio hardware dedicado.

###### Ejemplos de HVM

VMware ESXi, Microsoft Hyper