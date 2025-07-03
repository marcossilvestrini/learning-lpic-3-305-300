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

# 學習 LPIC-3 305-300

![LPIC3-305-300](images/lpic3-305-300.jpg)

<p align="center">
<strong>探索文件 »</strong></a>
    <br />
    <a href="https://marcossilvestrini.github.io/learning-lpic-3-305-300/">網站</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300">代碼頁面</a>
    -
    <a href="https://skynet-8.gitbook.io/learning-lpic-3-305-300">Gitbook</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">報告錯誤</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">請求功能</a>
</p>

---

## 摘要

<details>
  <summary><b>目錄</b></summary>
  <ol>
    <li>
      <a href="#about-the-project">關於專案</a>
    </li>
    <li>
      <a href="#getting-started">開始使用</a>
      <ul>
        <li><a href="#prerequisites">先決條件</a></li>
        <li><a href="#installation">安裝</a></li>
      </ul>
    </li>
    <li><a href="#usage">使用</a></li>
    <li><a href="#roadmap">路線圖</a></li>
    <li><a href="#freedoms">四項基本自由</a></li>
    <li>
      <a href="#topic-351">主題 351：完整虛擬化</a>
      <ul>
        <li><a href="#topic-351.1">351.1 虛擬化概念與理論 </a></li>
        <li><a href="#topic-351.2">351.2 Xen</a></li>
        <li><a href="#topic-351.3">351.3 QEMU</a></li>
        <li><a href="#topic-351.4">351.4 Libvirt 虛擬機</a></li>
        <li><a href="#topic-351.5">351.5 虛擬機磁碟映像管理</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-352">主題 352：容器虛擬化</a>
      <ul>
        <li><a href="#topic-352.1">352.1 容器虛擬化概念</a></li>
        <li><a href="#topic-352.2">352.2 LXC</a></li>
        <li><a href="#topic-352.3">352.3 Docker</a></li>
        <li><a href="#topic-352.4">352.4 容器編排平台</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-353">主題 353：虛擬機部署與配置</a>
      <ul>
        <li><a href="#topic-353.1">353.1 雲管理工具</a></li>
        <li><a href="#topic-353.2">353.2 Packer</a></li>
        <li><a href="#topic-353.3">353.3 cloud-init</a></li>
        <li><a href="#topic-353.4">353.4 Vagrant</a></li>
      </ul>
    </li>
    <li><a href="#license">許可證</a></li>
    <li><a href="#contact">聯絡</a></li>
    <li><a href="#acknowledgments">致謝</a></li>
  </ol>
</details><br>

---

<a name="about-the-project"></a>

## 關於專案

> 本專案旨在幫助學生或專業人士學習 GNULinux 的主要概念
> 和自由軟體
> 將涵蓋一些 GNULinux 發行版，如 Debian 和 RPM
> 也將涵蓋一些套件的安裝和配置
> 通過這樣做，您可以讓整個社區有機會受益於您的變更。
> 訪問源代碼是這一點的前提。
> 使用 vagrant 來啟動機器並執行本文中的實驗室和練習內容。
> 我已在 Vagrant 資料夾中發佈了一個 Vagrantfile，裡面包含您上傳學習環境所需的內容。

---

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

<a name="getting-started"></a>

## 開始使用

要開始學習，請參見上面的文檔。

<a name="prerequisites"></a>

### 先決條件

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [VMware Workstation](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
* [Vagrant VMWare Utility](https://developer.hashicorp.com/vagrant/install/vmware)
* [Vagrant](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### 安裝

克隆倉庫

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

自定義模板 *Vagrantfile-topic-XXX*。此文件包含實驗室的虛擬機配置。範例：

* 文件 [Vagrantfile-topic-351](vagrant/Vagrantfile-topic-351)
  * vm.clone_directory = "<your_driver_letter>:\\`<folder>`\\<to_machine>\\#{VM_NAME}-instance-1"
    範例： vm.clone_directory = "E:\\Servers\\VMWare\\#{VM_NAME}-instance-1"
  * vm.vmx["memsize"] = ""
  * vm.vmx["numvcpus"] = ""
  * vm.vmx["cpuid.coresPerSocket"] = ""

自定義網絡配置在文件 [configs/network](configs/network/) 中。

---

<a name="usage"></a>

## 使用

使用此倉庫來學習 LPIC-3 305-300 考試

### 啟動和關閉

切換 *Vagrantfile-topic-xxx* 模板並複製到新文件，名稱為 *Vagrantfile*

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### 重新啟動虛擬機

```sh
cd vagrant && vagrant reload
```

**重要：**
*如果您在沒有 vagrant 的情況下重新啟動虛擬機，共享文件夾在啟動後不會掛載。*

### 使用 powershell 進行啟動和關閉

如果您使用 Windows 平台，我創建了一個 powershell 腳本來啟動和關閉虛擬機。

```powershell
vagrant/up.ps1
vagrant/destroy.ps1
```

### 基礎設施架構主題 351

![topic-351](images/infraestructure-topic-351.png)

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

---

<a name="roadmap"></a>

## 路線圖

* [X] 創建倉庫
* [X] 創建實驗室的配置腳本
* [X] 創建主題 351 的範例
* [X] 創建主題 352 的範例
* [ ] 創建主題 353 的範例
* [ ] 上傳模擬考試

---

<a name="freedoms"></a>

## 四項基本自由

> 0.自由地運行程序，為任何目的（自由 0）。
> 1.自由地研究程序的運作方式，並更改它，以便它能按照您的意願進行計算（自由 1）。
> 訪問源代碼是這一點的前提。
> 2.自由地重新分發副本，以便您可以幫助他人（自由 2）。
> 3.自由地將您修改過的版本的副本分發給他人（自由 3）。

---

## 檢查命令

```sh
type COMMAND
apropos COMMAND
whatis COMMAND --long
whereis COMMAND
COMMAND --help, --h
man COMMAND
```

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

---

<a name="topic-351"></a>

## 主題 351：完整虛擬化

![LPIC3-305-300](images/virtualization-351.png)

---

<a name="topic-351.1"></a>

### 351.1 虛擬化概念與理論

**權重：** 6

**描述：** 考生應該知道並理解虛擬化的一般概念、理論和術語。這包括 Xen、QEMU 和 libvirt 的術語。

**關鍵知識領域：**

* 🖥️ 理解虛擬化術語
* ⚖️ 理解虛擬化的優缺點
* 🛠️ 理解各種 Hypervisors 和虛擬機監控器的變化
* 🔄 理解將物理機器遷移到虛擬機的主要方面
* 🚀 理解在主機系統之間遷移虛擬機的主要方面
* 📸 理解虛擬化對虛擬機的特性和影響，例如快照、暫停、克隆和資源限制
* 🌐 了解 oVirt、Proxmox、systemd-machined 和 VirtualBox
* 🔗 了解 Open vSwitch

#### 351.1 引用對象

```sh
Hypervisor
Hardware Virtual Machine (HVM)
Paravirtualization (PV)
Emulation and Simulation
CPU flags
/proc/cpuinfo
Migration (P2V, V2V)
```

#### Hypervisors

##### 類型 1 Hypervisor（裸金屬 Hypervisor）

###### 類型 1 定義

直接在主機的物理硬體上運行，提供一個基層來管理虛擬機，而無需主機操作系統。

###### 類型 1 特徵

* ⚡ 高性能和效率。
* ⏱️ 更低的延遲和開銷。
* 🏢 通常用於企業環境和數據中心。

###### 類型 1 範例

* VMware ESXi：在企業環境中廣泛使用的穩健 Hypervisor。
* Microsoft Hyper-V：與 Windows Server 集成，提供強大的性能和管理功能。
* Xen：許多雲服務提供商使用的開源 Hypervisor。
* KVM（基於內核的虛擬機）：集成到 Linux 內核中，為基於 Linux 的系統提供高性能。

##### 類型 2 Hypervisor（託管 Hypervisor）

###### 類型 2 定義

在傳統操作系統之上運行，依賴主機操作系統進行資源管理和設備支持。

###### 類型 2 特徵

* 🛠️ 更容易設置和使用，特別是在個人電腦上。
* 🔧 更靈活，適合開發、測試和小規模部署。
* 🐢 通常效率低於類型 1 Hypervisors，因為主機操作系統的額外開銷。

###### 類型 2 範例

* VMware Workstation：在單個桌面上運行多個操作系統的強大 Hypervisor。
* Oracle VirtualBox：以靈活性和易用性著稱的開源 Hypervisor。
* Parallels Desktop：為 Mac 用戶設計，能夠在 macOS 旁邊運行 Windows 和其他操作系統。
* QEMU（快速模擬器）：一個開源模擬器和虛擬化工具，通常與 KVM 一起使用。

##### 類型 1 和類型 2 Hypervisors 之間的主要區別

* 部署環境：
  * 類型 1 Hypervisors 通常在數據中心和企業環境中部署，因為它們直接與硬體互動並提供高性能。
  * 類型 2 Hypervisors 更適合個人使用、開發、測試和小規模虛擬化任務。
* 性能：
  * 類型 1 Hypervisors 通常提供更好的性能和更低的延遲，因為它們不依賴主機操作系統。
  * 類型 2 Hypervisors 可能會因為在主機操作系統上運行而經歷一些性能下降。
* 管理和易用性：
  * 類型 1 Hypervisors 需要更複雜的設置和管理，但為大規模部署提供先進的功能和可擴展性。
  * 類型 2 Hypervisors 更容易安裝和使用，適合個人用戶和小型項目。

##### 遷移類型

在 Hypervisors 的上下文中，這些技術用於創建和管理虛擬機，P2V 遷移和 V2V 遷移是虛擬化環境中常見的術語。
它們指的是在不同類型的平台之間遷移系統的過程。

##### P2V - 物理到虛擬遷移

P2V 遷移是指將物理伺服器遷移到虛擬機的過程。換句話說，運行在專用物理硬體上的操作系統及其應用程序被“轉換”並移動到運行在 Hypervisor（如 VMware、Hyper-V、KVM 等）上的虛擬機中。

* 範例：您有一台運行 Windows 或 Linux 系統的物理伺服器，您想將其移動到虛擬環境中，例如雲基礎設施或內部虛擬化伺服器。
  此過程涉及複製整個系統狀態，包括操作系統、驅動程序和數據，以創建一個等效的虛擬機，該虛擬機可以像在物理硬體上一樣運行。

##### V2V - 虛擬到虛擬遷移

V2V 遷移是指將虛擬機從一個 Hypervisor 遷移到另一個的過程。在這種情況下，您已經在虛擬化環境中運行虛擬機（如 VMware），並希望將其移動到另一個虛擬化環境（例如，移動到 Hyper-V 或新的 VMware 伺服器）。

* 範例：您在 VMware 虛擬化伺服器上運行虛擬機，但決定將其遷移到 Hyper-V 平台