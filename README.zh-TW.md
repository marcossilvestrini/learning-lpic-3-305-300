<h1><a name="readme-top"></a></h1>

[![Create Release](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml)[![Translate README](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml)[![Deploy GitHub Pages](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml)[![Generate HTML and PDF](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml)[![PSScriptAnalyzer](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml)[![Slack Notification](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml)

* * *

[![MIT License][license-shield]][license-url][![Forks][forks-shield]][forks-url][![Stargazers][stars-shield]][stars-url][![Contributors][contributors-shield]][contributors-url][![Issues][issues-shield]][issues-url][![LinkedIn][linkedin-shield]][linkedin-url]

* * *

# 學習 LPIC-3 305-300

![LPIC3-305-300](Images/lpic3-305-300.jpg)

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

## 概括

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

## 關於項目

> 該計畫旨在幫助學生或專業人士學習 GNULinux 的主要概念
> 和免費軟體\\
> 將涵蓋一些 GNULinux 發行版，例如 Debian 和 RPM\\
> 也將涵蓋一些軟體包的安裝和配置\\
> 透過這樣做，您可以讓整個社區有機會從您的更改中受益。
> 存取原始碼是實現此目的的先決條件。
> 使用 vagrant for up 機器並執行本文的實驗和練習內容。
> 我已經在 Vagrant 資料夾中發布了一個 Vagrantfile 以及必要的內容\\
> 供您上傳學習環境

* * *

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<a name="getting-started"></a>

## 入門

要開始學習，請參閱上面的文件。

<a name="prerequisites"></a>

### 先決條件

-   [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
-   [虛擬機器工作站](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
-   [Vagrant VMWare 實用程式](https://developer.hashicorp.com/vagrant/install/vmware)
-   [流浪漢](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### 安裝

克隆儲存庫

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
```

使用 Vagrantfile-topic-XXX 為實驗室自訂虛擬機器。

為您的環境設定一些配置：

-   文件[Vagrantfile-主題-351](./labs/vagrant/Vagrantfile-topic-351)
    -   vm.clone_directory = "&lt;您的驅動程式字母>:\\<folder>\\&lt;到機器>\\#{VM_NAME}-instance-1"
        範例： vm.clone_directory = "E:\\伺服器\\虛擬機器軟體\\#{VM_NAME}-instance-1"
    -   虛擬機器vmx[“記憶體大小”"]= ""
    -   虛擬機器vmx[“numvcpu”"]= ""
    -   虛擬機器vmx[“cpuid"coresPerSocket”.]= ""
    -   內嵌：“ifconfig eth1 &lt;your_public_ip_instanceX> 網路遮罩 255.255.255.0 向上”
    -   內聯：“路由新增預設閘道 &lt;your_public_gateway>”

* * *

<a name="usage"></a>

## 用法

使用此儲存庫了解 LPIC-3 305-300 考試

### 對於上下

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### 對於重新啟動虛擬機

```sh
cd vagrant && vagrant reload
```

**重要的：**_如果在沒有 vagrant 的情況下重新啟動虛擬機，則啟動後不會掛載共用資料夾。_

### 使用powershell進行向上和向下

流浪者/up.ps1
流浪者/destroy.ps1

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="roadmap"></a>

## 路線圖

-   [x] 建立儲存庫
-   [x] 為配置實驗室建立腳本
-   [x] 建立有關主題 351 的範例
-   [ ] 建立有關主題 352 的範例
-   [ ] 建立有關主題 353 的範例
-   [ ] 上傳模擬itexam

* * *

<a name="freedoms"></a>

## 四項基本自由

> 0.為任何目的隨意運行程序的自由（自由 0）。
> 1.自由地研究程序如何運作並對其進行更改\\
> 你可以隨心所欲地進行計算（自由 1）。
> 存取原始碼是實現此目的的先決條件。
> 2.重新分發副本的自由，以便您可以幫助他人（自由2）。
> 3.將修改版本的副本分發給其他人的自由（自由3）。

* * *

## 檢查命令

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

## 主題 351：完全虛擬化

![LPIC3-305-300](Images/virtualization-351.png)

* * *

<a name="topic-351.1"></a>

### 351.1 虛擬化概念與理論

**重量：**6

**描述：**考生應該了解並理解虛擬化的一般概念、理論和術語。這包括 Xen、QEMU 和 libvirt 術語。

**關鍵知識領域：**

-   了解虛擬化術語
-   了解虛擬化的優點和缺點
-   了解虛擬機器管理程式和虛擬機器監視器的各種變體
-   了解將實體機遷移到虛擬機器的主要方面
-   了解在主機系統之間遷移虛擬機器的主要方面
-   了解虛擬機器虛擬化的功能和影響，例如快照、暫停、複製和資源限制
-   了解 oVirt、Proxmox、systemd-machined 和 VirtualBox
-   對 Open vSwitch 的認識

#### 351.1 引用的對象

```sh
Hypervisor
Hardware Virtual Machine (HVM)
Paravirtualization (PV)
Emulation and Simulation
CPU flags
/proc/cpuinfo
Migration (P2V, V2V)
```

#### 管理程式

##### 類型 1 Hypervisor（裸機 Hypervisor）

###### 類型 1 定義

直接在主機的實體硬體上運行，提供基礎層來管理虛擬機，而無需主機作業系統。

###### 1 型特徵

-   高性能、高效率。
-   更低的延遲和開銷。
-   通常用於企業環境和資料中心。

###### 類型 1 範例

-   VMware ESXi：企業環境中強大且廣泛使用的虛擬機器管理程式。
-   Microsoft Hyper-V：與 Windows Server 集成，提供強大的效能和管理功能。
-   Xen：許多雲端服務供應商使用的開源虛擬機器管理程式。
-   KVM（基於核心的虛擬機器）：整合到Linux核心中，為基於Linux的系統提供高效能。

##### 類型 2 虛擬機器管理程式（託管虛擬機器管理程式）

###### 類型 2 定義

在傳統作業系統之上運行，依賴主機作業系統進行資源管理和設備支援。

###### 2 型特徵

-   更容易設定和使用，尤其是在個人電腦上。
-   更靈活地用於開發、測試和小規模部署。
-   由於主機作業系統的額外開銷，效率通常低於類型 1 虛擬機器管理程式。

###### 類型 2 範例

-   VMware Workstation：功能強大的虛擬機器管理程序，用於在單一桌面上執行多個作業系統。
-   Oracle VirtualBox：一款開源虛擬機器管理程序，以其靈活性和易用性而聞名。
-   Parallels Desktop：專為 Mac 使用者設計，可與 macOS 一起執行 Windows 和其他作業系統。
-   QEMU（Quick EMUlator）：開源模擬器和虛擬器，通常與 KVM 結合使用。

##### 類型 1 和類型 2 虛擬機器管理程序之間的主要區別

-   部署環境：
    -   由於 1 類虛擬機器管理程式與硬體直接互動且具有高效能，因此通常部署在資料中心和企業環境中。
    -   2 類虛擬機器管理程式更適合個人使用、開發、測試和小規模虛擬化任務。
-   表現：
    -   類型 1 虛擬機器管理程式通常提供更好的效能和更低的延遲，因為它們不依賴主機作業系統。
    -   由於在主機作業系統之上運行的開銷，2 類虛擬機器管理程式可能會遇到一些效能下降。
-   管理和易用性：
    -   1 類虛擬機器管理程式需要更複雜的設定和管理，但為大規模部署提供進階功能和可擴充性。
    -   2 類虛擬機器管理程式更易於安裝和使用，非常適合個人使用者和小型專案。

##### 遷移類型

在虛擬機器管理程式（用於建立和管理虛擬機器的技術）的上下文中，術語「P2V 遷移」和「V2V 遷移」在虛擬化環境中很常見。  
它們指的是不同類型的平台之間遷移系統的過程。

##### P2V - 實體到虛擬的遷移

P2V遷移是指將實體伺服器遷移到虛擬機器的過程。  
換句話說，運行在專用實體硬體上的作業系統及其應用程式被「轉換」並移動到運行在虛擬機器管理程式（例如 VMware、Hyper-V、KVM 等）上的虛擬機器。

-   範例：您有一台運行 Windows 或 Linux 系統的實體伺服器，並且希望將其移至虛擬環境，例如雲端基礎架構或內部虛擬化伺服器。  
    該過程涉及複製整個系統狀態，包括作業系統、驅動程式和數據，以建立可以像在實體硬體上一樣運行的等效虛擬機器。

##### V2V - 虛擬到虛擬的遷移

V2V 遷移是指將虛擬機器從一個虛擬機器管理程式遷移到另一個虛擬機器管理程式的過程。  
在這種情況下，您已經有一個在虛擬化環境（例如 VMware）中運行的虛擬機，並且您希望將其移至另一個虛擬化環境（例如，Hyper-V 或新的 VMware 伺服器）。

-   範例：您有一個在 VMware 虛擬化伺服器上執行的虛擬機，但您決定將其移轉到 Hyper-V 平台。在這種情況下，V2V 遷移將虛擬機器從一種格式或管理程序轉換為另一種格式或管理程序，確保其可以繼續正確運作。

#### HVM 與半虛擬化

##### 硬體輔助虛擬化 (HVM)

###### HVM定義

HVM 利用現代 CPU 提供的硬體擴充來虛擬化硬件，從而能夠以最小的效能開銷來建立和管理 VM。

###### HVM 主要特性

-   **硬體支援**：需要 CPU 支援虛擬化擴展，例如 Intel VT-x 或 AMD-V。
-   **全虛擬化：**虛擬機器可以運行未經修改的來賓作業系統，因為虛擬機器管理程式提供了硬體環境的完整模擬。
-   **表現：**由於在 CPU 上直接執行來賓程式碼，因此通常可提供接近本機的效能。
-   **隔離:**在虛擬機器之間提供強大的隔離，因為每個虛擬機器都像擁有自己的專用硬體一樣運作。

###### HVM 範例

VMware ESXi、Microsoft Hyper-V、KVM（基於核心的虛擬機器）。

###### HVM的優點

-   **相容性:**無需修改即可運行任何作業系統。
-   **表現：**高性能得益於硬體支援。
-   **安全：**硬體提供的增強隔離和安全功能。

###### HVM 的缺點

-   **硬體依賴性：**需要特定的硬體功能，限制了與舊系統的兼容性。
-   **複雜：**可能涉及更複雜的配置和管理。

##### 半虛擬化

###### 半虛擬化定義

半虛擬化涉及修改來賓作業系統以了解虛擬環境，從而使其能夠更有效地與虛擬機器管理程式互動。

###### 半虛擬化的主要特徵

-   **來賓修改：**需要更改來賓作業系統才能使用超級呼叫直接與虛擬機器管理程式進行通訊。
-   **表現：**比傳統的完全虛擬化更有效率，因為它減少了與模擬硬體相關的開銷。
-   **相容性:**僅限於已針對半虛擬化進行修改的作業系統。

###### 半虛擬化範例

具有半虛擬化來賓的 Xen、某些配置中的 VMware 工具以及某些 KVM 配置。

###### 半虛擬化優勢

-   **效率：**減少虛擬化硬件的開銷，有可能為某些工作負載提供更好的效能。
-   **資源利用：**由於來賓作業系統和虛擬機器管理程式之間的直接通信，可以更有效地利用系統資源。

###### 半虛擬化的缺點

-   **來賓作業系統修改：**需要對來賓作業系統進行修改，從而限制了對受支援作業系統的相容性。
-   **複雜：**需要在來賓作業系統中實作超級呼叫實作額外的複雜性。

##### 主要差異

###### 來賓作業系統要求

-   **虛擬機器：**可以運行未經修改的來賓作業系統。
-   **半虛擬化：**需要修改來賓作業系統才能與虛擬機器管理程式搭配使用。

###### 表現

-   **虛擬機器：**由於硬體輔助執行，通常可以提供接近本機的效能。
-   **半虛擬化：**可以透過減少硬體模擬的開銷來提供高效的效能，但依賴修改後的客戶作業系統。

###### 硬體依賴性

-   **虛擬機器：**需要特定的 CPU 功能（Intel VT-x、AMD-V）。
-   **半虛擬化：**不需要特定的 CPU 功能，但需要修改客戶作業系統。

###### 隔離

-   **虛擬機器：**使用硬體功能提供強大的隔離。
-   **半虛擬化：**依賴於基於軟體的隔離，該隔離可能不如基於硬體的隔離那麼強大。

###### 複雜

-   **虛擬機器：**通常部署起來更簡單，因為它支援未修改的作業系統。
-   **半虛擬化：**需要對來賓作業系統進行額外的設定和修改，從而增加了複雜性。

#### NUMA（非統一記憶體存取）

NUMA（非統一記憶體存取）是多處理器系統中使用的記憶體架構，用於最佳化處理器的記憶體存取。  
在NUMA 系統中，內部存在處理器之間分佈不均勻，這意味著每個處理器對部分內存（其“本地內存”）的訪問速度比對物理上較遠的內存（稱為“遠端內存” ）和關聯記憶體的存取速度要快。

##### NUMA 架構的主要特性

1.  **本地和遠端記憶體**：每個處理器都有自己的本地內存，可以更快地存取該內存。然而，它也可以存取其他處理器的內存，儘管這需要更長的時間。
2.  **差異化延遲**：記憶體存取的延遲取決於處理器是存取其本地記憶體還是另一個節點的記憶體。本地記憶體存取速度更快，而存取另一個節點（遠端）的記憶體速度較慢。
3.  **可擴展性**：NUMA 架構旨在提高具有多個處理器的系統的可擴充性。隨著更多處理器的添加，記憶體也被分配，避免了統一記憶體存取 (UMA) 架構中可能出現的瓶頸。

##### NUMA 的優點

-   大型系統中的更好性能：由於每個處理器都有本地內存，因此它可以更有效率地工作，而無需與其他處理器競爭內存存取。
-   可擴展性：與 UMA 架構相比，NUMA 允許具有許多處理器和大量記憶體的系統更有效地擴展。

##### 缺點

-   程式設計複雜性：程式設計師需要了解哪些記憶體區域是本地的或遠端的，優化本地記憶體的使用以獲得更好的效能。
-   潛在的效能損失：如果處理器經常存取遠端內存，則效能可能會因較高的延遲而受到影響。
    這種架構在高效能多處理器系統中很常見，例如伺服器和超級計算機，其中可擴展性和記憶體最佳化至關重要。

#### 開源解決方案

-   oVirt：<https://www.ovirt.org/>

-   普羅克斯莫克斯：<https://www.proxmox.com/en/proxmox-virtual-environment/overview>

-   甲骨文虛擬盒：<https://www.virtualbox.org/>

-   打開vSwitch：<https://www.openvswitch.org/>

#### 虛擬化的類型

##### 硬體虛擬化（伺服器虛擬化）

###### 高壓定義

抽象化實體硬體以建立運行單獨作業系統和應用程式的虛擬機器 (VM)。

###### 高壓用例

資料中心、雲端運算、伺服器整合。

###### 高壓範例

VMware ESXi、微軟 Hyper-V、KVM。

##### 作業系統虛擬化（容器化）

###### 貨櫃化定義

允許多個隔離的使用者空間實例（容器）在單一作業系統核心上運行。

###### 容器化用例

微服務架構、開發和測試環境。

###### 容器化範例

Docker、Kubernetes、LXC。

##### 網路虛擬化

###### 網路虛擬化定義

將硬體和軟體網路資源合併到一個基於軟體的管理實體。

###### 網路虛擬化用例

軟體定義網路（SDN）、網路功能虛擬化（NFV）。

###### 網路虛擬化範例

VMware NSX、思科 ACI、OpenStack Neutron。

##### 儲存虛擬化

###### 儲存虛擬化定義

將多個裝置的實體儲存池整合到可集中管理的單一虛擬儲存單元中。

###### 儲存虛擬化定義用例

資料管理、儲存最佳化、災難復原。

###### 儲存虛擬化定義範例

IBM SAN 磁碟區控制器、VMware vSAN、NetApp ONTAP。

##### 桌面虛擬化

###### 桌面虛擬化定義

允許桌面作業系統在伺服器託管的虛擬機器上運作。

###### 桌面虛擬化定義用例

虛擬桌面基礎架構 (VDI)、遠端工作解決方案。

###### 桌面虛擬化定義範例

Citrix 虛擬應用程式和桌面、VMware Horizo​​n、Microsoft 遠端桌面服務。

##### 應用虛擬化

###### 應用程式虛擬化定義

將應用程式與底層硬體和作業系統分開，允許它們在隔離的環境中運行。

###### 應用程式虛擬化定義用例

簡化應用程式部署、相容性測試。

###### 應用程式虛擬化定義範例

VMware ThinApp、Microsoft App-V、Citrix XenApp。

##### 資料虛擬化

###### 資料虛擬化定義

整合來自不同來源的數據，無需進行物理合併，為分析和報告提供統一的視圖。

###### 資料虛擬化定義用例

商業智能，即時數據整合。

###### 資料虛擬化定義範例

Denodo、紅帽 JBoss 資料虛擬化、IBM InfoSphere。

##### 虛擬化的好處

-   資源效率：更好地利用實體資源。
-   節省成本：降低硬體和營運成本。
-   可擴展性：根據需求輕鬆擴展或縮小。
-   靈活性：支援各種工作負載和應用程式。
-   災難復原：簡化的備份和復原過程。
-   隔離：透過隔離環境提高安全性。

<p align="right">(<a href="#topic-351.1">back to sub Topic 351.1</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.2"></a>

### 351.2 Xen

![xen-architecture](images/xen-achitecture.png)

![xen-architecture](images/xen-achitecture2.png)

**重量：**3

**描述：**考生應該能夠安裝、配置、維護、遷移 Xen 安裝並排除故障。重點是 Xen 版本 4.x。

**關鍵知識領域：**

-   了解 Xen 的架構，包括網路和存儲
-   Xen節點和域的基本配置
-   Xen節點和域的基本管理
-   Xen 安裝的基本故障排除
-   藥丸的多樣性
-   對 XenStore 的認知
-   了解 Xen 啟動參數
-   對 xm 實用程式的認識

#### Xen

![panda](Images/xen-panda.png)

Xen 是一個開源 type-1（裸機）虛擬機器管理程序，它允許多個作業系統在同一實體硬體上同時運行。  
Xen 在實體硬體和虛擬機器 (VM) 之間提供了一個層，可實現高效的資源共享和隔離。

-   **建築學：**Xen 使用兩層系統運行，其中 Domain 0 (Dom0) 是具有直接硬體存取權並管理虛擬機器管理程式的特權網域。其他虛擬機器稱為 Domain U (DomU)，運行來賓作業系統並由 Dom0 管理。
-   **虛擬化類型：**Xen 支援半虛擬化 (PV)（需要修改的來賓作業系統）和硬體輔助虛擬化 (HVM)（使用硬體擴充（例如 Intel VT-x 或 AMD-V）來執行未修改的來賓作業系統）。
    Xen 廣泛用於雲端環境，特別是 Amazon Web Services (AWS) 和其他大型雲端供應商。

#### XenSource

XenSource 是由劍橋大學 Xen 虛擬機器管理程式的原始開發人員創立的公司，旨在將 Xen 商業化。  
該公司提供基於Xen的企業解決方案，並提供額外的工具和支援來增強Xen的企業使用能力。

-   **由 Citrix 收購**：2007年，XenSource被Citrix Systems, Inc.收購。
-   **過渡**：收購後，Xen 項目繼續作為開源項目，而 Citrix 則專注於利用 XenSource 技術的 XenServer 等商業產品。

#### Xen項目

Xen專案是指在Xen虛擬機器管理程序商業化後負責開發和維護的開源社群和倡議。  
Xen 計畫在 Linux 基金會下運作，重點是建立、改進和支持 Xen，將其作為社群驅動的協作工作。

-   **目標：**Xen 專案旨在透過提高虛擬機器管理程式的效能、安全性和適用於各種用例的功能集來推進虛擬機器管理程序，包括雲端運算、注重安全的虛擬化（例如 Qubes OS）和嵌入式系統。
-   **貢獻者：**該專案包括來自不同組織的貢獻者，包括主要雲端供應商、硬體供應商和獨立開發人員。
-   **藥丸和漢工具：**Xen 專案還包括用於管理 Xen 虛擬機器管理程式安裝的 XAPI (XenAPI) 等工具，以及用於系統管理和最佳化的各種其他實用程式。

#### XenStore

Xen Store 是 Xen Hypervisor 的關鍵元件。  
本質上，Xen Store 是一個分散式鍵值資料庫，用於 Xen 虛擬機器管理程式與其管理的虛擬機器（也稱為域）之間的通訊和資訊共用。

以下是 Xen Store 的一些關鍵方面：

-   **域間通訊：**Xen Store 支援域之間的通信，例如 Dom0（控制硬體資源的特權域）和 DomU（用戶域，即 VM）。這是透過鍵值條目完成的，其中每個網域都可以讀取或寫入資訊。

-   **配置管理：**它用於儲存和存取配置信息，例如虛擬設備、網路和啟動參數。這有利於虛擬機器的動態管理和配置。

-   **事件和通知：**Xen Store 也支援事件通知。當 Xen Store 中的特定鍵或值被修改時，可以通知感興趣的網域對這些變更做出反應。這對於監視和管理資源很有用。

-   簡單的API：Xen Store提供了一個簡單的API來讀取和寫入數據，使開發人員可以輕鬆地將他們的應用程式與Xen虛擬化系統整合。

#### 丸

XAPI 或 XenAPI 是用於管理 Xen Hypervisor 及其虛擬機器 (VM) 的應用程式介面 (API)。  
XAPI 是 XenServer（現在稱為 Citrix Hypervisor）的關鍵元件，提供與 Xen 虛擬機器管理程式互動的標準化方式，以執行建立、設定、監控和控制 VM 等作業。

以下是 XAPI 的一些重要面向：

-   **虛擬機器管理：**XAPI 允許管理員以程式設計方式建立、刪除、啟動和停止虛擬機器。

-   **自動化：**透過 XAPI，可以自動管理虛擬資源，包括網路、儲存和運算，這對於大型雲端環境至關重要。

-   **一體化：**XAPI 可以與其他工具和腳本集成，以提供更有效率和客製化的 Xen 環境管理。

-   **存取控制：**XAPI還提供存取控制機制，確保只有授權使用者才能在虛擬環境中執行特定操作。

XAPI 是支援 Xen Hypervisor 控制和自動化的接口，使管理虛擬化環境變得更加容易。

#### Xen Summary

-   **克森：**核心管理程式技術使虛擬機器能夠在實體硬體上運行。
-   **Xen來源：**該公司將 Xen 商業化，後來被 Citrix 收購，導致了 Citrix XenServer 的開發。
-   **Xen專案：**在 Linux 基金會下繼續開發和維護 Xen 虛擬機器管理程式的開源倡議和社群。
-   **XenStore：**Xen Store 充當 Xen 虛擬機器管理程式和 VM 之間的通訊和配置中介，簡化虛擬化環境的操作和管理。
-   **丸**是支援 Xen Hypervisor 控制和自動化的接口，使管理虛擬化環境變得更加容易。

#### 域0 (Dom0)

Domain0 或 Dom0 是 Xen 架構中的控制域。它管理其他網域 (DomU) 並且可以直接存取硬體。  
Dom0 運行設備驅動程序，允許缺乏直接硬體存取的 DomU 與設備進行通訊。通常，它是作業系統（如 Linux）的完整實例，對於 Xen 虛擬機器管理程式操作至關重要。

#### 域U (DomU)

DomU 是運作虛擬機器的非特權網域。  
它們由 Dom0 管理，不能直接存取硬體。 DomU 可以配置為運行不同的作業系統並用於各種目的，例如應用程式伺服器和開發環境。它們依賴 Dom0 進行硬體互動。

#### PV-DOMU（超規範化域）

PV-DomU 使用一種稱為半虛擬化的技術。在此模型中，DomU 作業系統經過修改，可以意識到它在虛擬化環境中運行，從而允許它直接與虛擬機器管理程式通訊以優化效能。  
與完全虛擬化相比，這可以降低開銷並提高效率。

#### HVM-DomU（硬體虛擬機器DomainU）

HVM-DomU 是利用完全虛擬化的虛擬機，允許運行未經修改的作業系統。 Xen虛擬機器管理程式為這些DomU提供硬體模擬，使它們能夠運行任何支援底層硬體架構的作業系統。  
雖然這提供了更大的靈活性，但與 PV-DomU 相比，它可能會導致更高的開銷。

#### 351.2 引用的對象

```sh
Domain0 (Dom0), DomainU (DomU)
PV-DomU, HVM-DomU
/etc/xen/
xl
xl.cfg
xl.conf
xentop
```

#### 351.2 重要命令

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

# Limit mem Dom0
xl mem-set 0 2048

# Limite cpu (not permanent after boot)
xl vcpu-set 0 2
```

##### brctl

```sh
# list bridges linked
brctl show
```

<p align="right">(<a href="#topic-351.2">back to sub Topic 351.2</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.3"></a>

### 351.3 QEMU

**重量：**4

**描述：**考生應該能夠安裝、配置、維護、遷移 QEMU 以及對其安裝進行故障排除。

**關鍵知識領域：**

-   了解QEMU的架構，包括KVM、網路和存儲
-   從命令列啟動 QEMU 實例
-   使用 QEMU 監視器管理快照
-   安裝 QEMU Guest Agent 和 VirtIO 裝置驅動程式
-   對 QEMU 安裝進行故障排除，包括網路和存儲
-   了解重要的 QEMU 配置參數

#### 351.3 引用的對象

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

#### 351.3 重要命令

##### ip

```sh
# list links
ip link show
```

<p align="right">(<a href="#topic-351.3">back to sub Topic 351.3</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.4"></a>

### 351.4 Libvirt虛擬機器管理

**重量：**9

**描述：**考生應該能夠使用 libvirt 和相關工具管理虛擬化主機和虛擬機器（「libvirt 網域」）。

**關鍵知識領域：**

-   了解libvirt的架構
-   管理 libvirt 連線和節點
-   建立和管理 QEMU 和 Xen 網域，包括快照
-   管理和分析域的資源消耗
-   建立和管理儲存池和磁碟區
-   建立和管理虛擬網絡
-   在節點之間遷移域
-   了解 libvirt 如何與 Xen 和 QEMU 交互
-   了解 libvirt 如何與 dnsmasq 和 radvd 等網路服務交互
-   了解 libvirt XML 設定文件
-   對virtlogd和virtlockd的認識

#### 351.4 引用的對象

```sh
libvirtd
/etc/libvirt/
virsh (including relevant subcommands)
```

#### 351.4 重要命令

##### 富

```sh
foo
```

<p align="right">(<a href="#topic-351.4">back to sub Topic 351.4</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.5"></a>

### 351.5 虛擬機器磁碟映像管理

**重量：**3

**描述：**考生應該能夠管理虛擬機器磁碟映像。這包括在各種格式和虛擬機器管理程式之間轉換磁碟映像以及存取映像中儲存的資料。

**關鍵知識領域：**

-   了解各種虛擬磁碟映像格式的功能，例如原始映像、qcow2 和 VMDK
-   使用 qemu-img 管理虛擬機器磁碟映像
-   使用 libguestfish 掛載分割區並存取虛擬機器磁碟映像中包含的文件
-   將實體磁碟內容複製到虛擬機器磁碟映像
-   在各種虛擬機器磁碟映像格式之間遷移磁碟內容
-   對開放虛擬化格式 (OVF) 的認識

#### 351.5 引用的對象

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

#### 351.5 重要命令

##### 富

```sh
foo
```

<p align="right">(<a href="#topic-351.5">back to sub Topic 351.5</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352"></a>

## 主題 352：容器虛擬化

* * *

<a name="topic-352.1"></a>

### 352.1 容器虛擬化概念

**重量：**7

**描述：**考生應該了解容器虛擬化的概念。這包括了解用於實現容器虛擬化的 Linux 元件以及使用標準 Linux 工具對這些元件進行故障排除。

**關鍵知識領域：**

-   了解系統和應用程式容器的概念
-   理解並分析內核命名空間
-   了解並分析對照組
-   了解並分析能力
-   了解 seccomp、SELinux 和 AppArmor 在容器虛擬化中的作用
-   了解 LXC 和 Docker 如何利用命名空間、cgroup、功能、seccomp 和 MAC
-   了解runc的原理
-   了解CRI-O和containerd的原理
-   了解 OCI 執行時期和影像規範
-   了解 Kubernetes 容器執行時間介面 (CRI)
-   對 podman、buildah 和範圍的認識
-   了解 Linux 和其他免費作業系統中的其他容器虛擬化方法，例如 rkt、OpenVZ、systemd-nspawn 或 BSD Jails

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

#### 352.1 引用的對象

```sh
nsenter
unshare
ip (including relevant subcommands)
capsh
/sys/fs/cgroups
/proc/[0-9]+/ns
/proc/[0-9]+/status
```

#### 352.1 重要命令

##### 富

```sh
foo
```

<p align="right">(<a href="#topic-352.1">back to sub topic 352.1</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.2"></a>

### 352.2 LXC

**重量：**6

**描述：**考生應該能夠使用 LXC 和 LXD 的系統容器。所涵蓋的LXC版本為3.0或更高版本。

**關鍵知識領域：**

-   了解LXC和LXD的架構
-   使用 LXD 基於現有映像管理 LXC 容器，包括網路和存儲
-   配置 LXC 容器屬性
-   限制LXC容器資源使用
-   使用 LXD 設定檔
-   了解 LXC 影像
-   對傳統 LXC 工具的認識

#### 352.2 引用的對象

```sh
lxd
lxc (including relevant subcommands)
```

#### 352.2 重要命令

##### 富

```sh
foo
```

<p align="right">(<a href="#topic-352.2">back to sub topic 352.2</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.3"></a>

### 352.3 泊塢窗

**重量：**9

**描述：**候選人應該能夠管理 Docker 節點和 Docker 容器。這包括了解 Docker 的架構以及了解 Docker 如何與節點的 Linux 系統互動。

**關鍵知識領域：**

-   了解Docker的架構和組件
-   使用 Docker 註冊表中的映像管理 Docker 容器
-   了解和管理 Docker 容器的映像和磁碟區
-   了解並管理 Docker 容器的日誌記錄
-   了解並管理 Docker 網路
-   使用 Dockerfile 建立容器映像
-   使用註冊表 Docker 映像運行 Docker 註冊表

#### 352.3 引用的對象

```sh
dockerd
/etc/docker/daemon.json
/var/lib/docker/
docker
Dockerfile
```

#### 352.3 重要命令

##### 泊塢窗

```sh
# Examples of docker
```

<p align="right">(<a href="#topic-352.3">back to sub topic 352.3</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.4"></a>

### 352.4 容器編排平台

**重量：**3

**描述：**考生應該了解容器編排的重要性以及 Docker Swarm 和 Kubernetes 提供的用於實現容器編排的關鍵概念。

**關鍵知識領域：**

-   了解容器編排的相關性
-   了解 Docker Compose 和 Docker Swarm 的關鍵概念
-   了解 Kubernetes 和 Helm 的關鍵概念
-   對 OpenShift、Rancher 和 Mesosphere DC/OS 的認識

<p align="right">(<a href="#topic-352.4">back to sub topic 352.4</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353"></a>

## 主題 353：VM 部署與配置

* * *

<a name="topic-353.1"></a>

### 353.1 雲端管理工具

**重量：**2

**描述：**考生應了解公有雲中的常見產品，並具有常用雲端管理工具的基本功能知識。

**關鍵知識領域：**

-   了解公有雲中的常見產品
-   OpenStack基礎特性知識
-   Terraform的基本特徵知識
-   對 CloudStack、Eucalyptus 和 OpenNebula 的認識

#### 353.1 引用的對象

```sh
IaaS, PaaS, SaaS
OpenStack
Terraform
```

#### 353.1 重要命令

##### 富

```sh
# examples
```

<p align="right">(<a href="#topic-353.1">back to sub topic 353.1</a>)</p>
<p align="right">(<a href="#topic-353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.2"></a>

### 353.2 包裝機

**重量：**2

**描述：**考生應該能夠使用 Packer 建立系統映像。這包括在各種公有和私有雲環境中執行 Packer 以及為 LXC/LXD 建置容器映像。

**關鍵知識領域：**

-   了解Packer的功能和特點
-   建立和維護範本文件
-   使用不同的建構器從模板檔案建立映像

#### 353.2 引用的對象

```sh
packer
```

#### 353.2 重要命令

##### 包裝工

```sh
# examples
```

<p align="right">(<a href="#topic-353.2">back to sub topic 353.2</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.3"></a>

### 353.3 雲初始化

**重量：**3

**描述：**考生應該能夠使用 cloud-init 來配置從標準化映像創建的虛擬機器。這包括調整虛擬機器以匹配其可用的硬體資源，特別是磁碟空間和磁碟區。  
此外，考生應該能夠配置實例以允許安全 SSH 登入並安裝一組特定的軟體包。  
此外，考生應該能夠創建具有 cloud-init 支援的新系統映像。

**關鍵知識領域：**

-   了解cloud-init的功能和概念，包括使用者資料、初始化和配置cloud-init
-   使用 cloud-init 建立、調整大小和掛載檔案系統、設定使用者帳戶（包括 SSH 金鑰等登入憑證）以及從發行版儲存庫安裝軟體包
-   將 cloud-init 整合到系統映像中
-   使用配置驅動資料來源進行測試

#### 353.3 引用的對象

```sh
cloud-init
user-data
/var/lib/cloud/
```

#### 353.3 重要命令

##### 富

```sh
# examples
```

<p align="right">(<a href="#topic-353.3">back to sub topic 353.3</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.4"></a>

### 353.4 流浪者

**重量：**3

**描述：**候選人應該能夠使用 Vagrant 來管理虛擬機，包括配置虛擬機。

**關鍵知識領域：**

-   了解 Vagrant 架構和概念，包括儲存和網路
-   從 Atlas 檢索並使用盒子
-   建立並運行 Vagrantfiles
-   造訪 Vagrant 虛擬機
-   在 Vagrant 虛擬機器和主機系統之間共用和同步資料夾
-   了解 Vagrant 配置，即檔案和 Shell 配置程序
-   了解多機設定

#### 353.4 引用的對象

```sh
vagrant
Vagrantfile
```

#### 353.4 重要命令

##### 流浪漢

```sh
# examples
```

<p align="right">(<a href="#topic-353.4">back to sub topic 353.4</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## 貢獻

貢獻使開源社群成為一個令人驚嘆的地方
學習、啟發和創造。您所做的任何貢獻都是**非常感謝**.

如果您有更好的建議，請分叉該存儲庫並
建立拉取請求。您也可以簡單地使用標籤“增強”來開啟問題。
不要忘記給該項目一顆星！再次感謝！

1.  分叉項目
2.  建立您的功能分支（`git checkout -b feature/AmazingFeature`)
3.  提交您的更改（`git commit -m 'Add some AmazingFeature'`)
4.  推送到分支（`git push origin feature/AmazingFeature`)
5.  打開拉取請求

* * *

## 執照

-   該項目已獲得 MIT 許可證 \* 有關詳細信息，請參閱 LICENSE.md 文件

* * *

## 接觸

馬科斯·西爾維斯特里尼 -[marcos.silvestrini@gmail.com](mailto:marcos.silvestrini@gmail.com)\\[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/mrsilvestrini.svg?style=social&label=Follow%20%40mrsilvestrini)](https://twitter.com/mrsilvestrini)

項目連結：<https://github.com/marcossilvestrini/learning-lpic-3-305-300>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## 致謝

-   [理查德·斯托曼的](http://www.stallman.org/)
-   [GNU](<>)
    -   [Richard Stallman 的 GNU/Linux 常見問題解答](https://www.gnu.org/gnu/gnu-linux-faq.html)
    -   [GNU](https://www.gnu.org/)
    -   [GNU作業系統](https://www.gnu.org/gnu/thegnuproject.html)
    -   [海灣合作委員會編譯器](https://gcc.gnu.org/wiki/History)
    -   [GNU 焦油](https://www.gnu.org/software/tar/)
    -   [GNU 使](https://www.gnu.org/software/make/)
    -   [GNU Emacs](https://en.wikipedia.org/wiki/Emacs)
    -   [GNU 軟體包](https://www.gnu.org/software/)
    -   [GNU/Linux 集合](https://directory.fsf.org/wiki/Collection:GNU/Linux)
    -   [GNU Grub 引導程式](https://www.gnu.org/software/grub/)
    -   [GNU赫德](https://www.gnu.org/software/hurd/hurd/what_is_the_gnu_hurd.html)
-   [核心](<>)
    -   [核心](https://www.kernel.org/)
    -   [Linux 核心手冊頁](https://www.kernel.org/doc/man-pages/)
    -   [編譯你的內核](https://wiki.linuxquestions.org/wiki/How_to_build_and_install_your_own_Linux_kernel)
-   [Linux 標準函式庫](<>)
    -   [Linux 標準函式庫](https://en.wikipedia.org/wiki/Linux_Standard_Base)
    -   [檔案系統層次結構標準](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)
    -   [文件層次結構](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.pdf)
-   [自由軟體](<>)
    -   [FSF](https://www.fsf.org)
    -   [自由軟體目錄](https://directory.fsf.org/wiki/Free_Software_Directory:Free_software_replacements)
-   [執照](<>)
    -   [自由軟體](https://www.gnu.org/philosophy/free-sw.html)
    -   [版權左](https://www.gnu.org/licenses/copyleft.en.html)
    -   [通用公共許可證](https://www.gnu.org/licenses/quick-guide-gplv3.html)
    -   [GNU 較寬鬆的通用公共許可證](https://www.gnu.org/licenses/lgpl-3.0.html)
    -   [BSD](https://opensource.org/licenses/BSD-3-Clause)
    -   [開源倡議](https://opensource.org/)
    -   [知識共享](https://creativecommons.org/)
    -   [執照長期支持](https://en.wikipedia.org/wiki/Long-term_support)
-   [發行版](<>)
    -   [Debian 自由軟體指南](https://www.debian.org/social_contract#guidelines)
    -   [列出 Linux 發行版](https://en.wikipedia.org/wiki/List_of_Linux_distributions)
    -   [發行表](https://distrowatch.com/)
    -   [Linux 發行版比較](https://en.wikipedia.org/wiki/Comparison_of_Linux_distributions)
-   [桌面環境](<>)
    -   [X11組織](https://www.x.org/wiki/)
    -   [韋蘭](https://wayland.freedesktop.org/)
    -   [GNU 侏儒](https://www.gnu.org/press/gnome-1.0.html)
    -   [侏儒](https://www.gnome.org/)
    -   [XFCE](https://xfce.org/)
    -   [KDE等離子](https://kde.org/plasma-desktop/)
    -   [和諧](https://en.wikipedia.org/wiki/Harmony_(toolkit))
-   [協定](<>)
    -   [HTTP協定](<>)
        -   [W3科技](https://w3techs.com/)
        -   [阿帕契](https://www.apache.org/)
        -   [阿帕契指令][def]
        -   [HTTP 狀態碼](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
        -   [適用於 Apache、nginx 和 Lighttpd 的強密碼](https://cipherlist.eu/)
        -   [SSL 教程](https://www.golinuxcloud.com/blog/)
        -   [SSL 設定 Mozilla](https://ssl-config.mozilla.org/)
    -   [xRDP](https://bytexd.com/xrdp-centos/)
    -   [NTP](https://www.ntppool.org/en/)
-   [域名系統](<>)
    -   [綁定](https://www.isc.org/bind/)
    -   [綁定日誌記錄](https://www.zytrax.com/books/dns/ch7/logging.html)
    -   [DNS 記錄類型列表](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
    -   [DNS 記錄類型列表](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
-   [套件管理器](<>)
    -   [下載包](https://pkgs.org/)
    -   [安裝包](https://installati.one/)
    -   [指導安裝包](https://installati.one/)
-   [外殼腳本](<>)
    -   [諜影重重 外殼](https://www.gnu.org/software/bash/manual/)
    -   [舍邦](https://bash.cyberciti.biz/guide/Shebang)
    -   [環境變數](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)
    -   [GNU 通配符](https://man7.org/linux/man-pages/man7/glob.7.html)
    -   [通配符](https://linuxhint.com/bash_globbing_tutorial/)
    -   [引用](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
    -   [正規表示式](https://www.gnu.org/software/grep/manual/html_node/Regular-Expressions.html)
    -   [未找到指令](https://command-not-found.com/)
    -   [Bashrc 生成器](http://bashrcgenerator.com/)
    -   [解釋shell](https://explainshell.com/)
    -   [Vim 教程](https://www.openvim.com/)
    -   [Linux Shell 腳本編寫教程](https://bash.cyberciti.biz/guide/Main_Page)
    -   [命令範例](https://www.geeksforgeeks.org/)
-   [其他工具](<>)
    -   [布吉拉](https://bugzilla.kernel.org/)
    -   [Github 徽章](https://github.com/alexandresanlim/Badges4-README.md-Profile)
-   [虛擬化定義](<>)
    -   [紅帽](https://www.redhat.com/pt-br/topics/virtualization/what-is-virtualization)
    -   [AWS](https://aws.amazon.com/pt/what-is/virtualization/)
    -   [國際商業機器公司](https://www.ibm.com/topics/virtualization)
    -   [OpenSource.com](https://opensource.com/resources/virtualization)
-   [鍵盤虛擬機](<>)
    -   [KVM（核心虛擬機器）](https://www.redhat.com/pt-br/topics/virtualization/what-is-KVM)
    -   [KVM管理工具](https://www.linux-kvm.org/page/Management_Tools)
-   [Xen](<>)
    -   [Xen伺服器](https://www.xenserver.com/)
    -   [維基 Xen 項目](https://wiki.xenproject.org/wiki/Main_Page)
    -   [LPI 部落格：Xen 虛擬化與雲端運算 #01：簡介](https://www.lpi.org/pt-br/blog/2020/10/01/xen-virtualization-and-cloud-computing-01-introduction/)
    -   [LPI 部落格：Xen 虛擬化與雲端運算 #02：Xen 如何完成工作](https://www.lpi.org/blog/2020/10/08/xen-virtualization-and-cloud-computing-02-how-xen-does-job/)
    -   [LPI 部落格：Xen 虛擬化與雲端運算 #04：容器、OpenStack 和其他相關平台](https://www.lpi.org/pt-br/blog/2020/10/22/xen-virtualization-and-cloud-computing-04-containers-openstack-and-other-related/)
    -   [Xen 虛擬化與雲端運算 #05：Xen 專案、Unikernels 和未來](https://www.lpi.org/pt-br/blog/2020/10/29/xen-virtualization-and-cloud-computing-05-xen-project-unikernels-and-future/)
    -   [Xen 專案初學者指南](https://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide#Installing_the_Xen_Project_Software)
    -   [瘋狂的書](https://wiki.xenproject.org/wiki/Book/HelloXenProject/0-Contents)
-   [統一內核](https://www.lpi.org/blog/2020/10/29/xen-virtualization-and-cloud-computing-05-xen-project-unikernels-and-future/)
    -   [尤尼克拉夫特](https://github.com/unikraft/unikraft)
    -   [Mirage作業系統](https://mirage.io/docs/hello-world)
    -   [哈拉LVM](https://galois.com/project/halvm/)
    -   [獨特的](https://github.com/solo-io/unik/blob/master/docs/providers/virtualbox.md)
-   [Openstack 文件](<>)
    -   [紅帽](https://www.redhat.com/pt-br/topics/openstack)
-   [開放虛擬交換機](<>)
    -   [OVS 文檔 4Linux](https://blog.4linux.com.br/open-vswitch-o-que-e-o-que-come-onde-vive)
-   [LPIC-3 305-300 考試](<>)
    -   [LPIC-3 305-300 目標](https://www.lpi.org/our-certifications/exam-305-objectives/)
    -   [LPIC-3 305-300 維基](https://wiki.lpi.org/wiki/LPIC-305_Objectives_V3.0)
    -   [LPIC-3 305-300 學習教材](https://cursos.linuxsemfronteiras.com.br/courses/preparatorio-para-certificacao-lpic-3-305/)
    -   [LPIC-3 305-300 ITexams 模擬考試](https://www.itexams.com/info/305-300)

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
