<h1><a name="readme-top"></a></h1>

[![Create Release](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml)[![Translate README](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml)[![Deploy GitHub Pages](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml)[![Generate HTML and PDF](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml)[![PSScriptAnalyzer](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml)[![Slack Notification](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml)

* * *

[![MIT License][license-shield]][license-url][![Forks][forks-shield]][forks-url][![Stargazers][stars-shield]][stars-url][![Contributors][contributors-shield]][contributors-url][![Issues][issues-shield]][issues-url][![LinkedIn][linkedin-shield]][linkedin-url]

* * *

# LPIC-3 305-300 の学習

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

## まとめ

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

## プロジェクトについて

> このプロジェクトは、学生や専門家が GNULinux の主要な概念を学習できるようにすることを目的としています。
> およびフリー ソフトウェア\\
> Debian や RPM などの一部の GNULinux ディストリビューションがカバーされます\\
> 一部のパッケージのインストールと構成についても説明します\\
> こうすることで、コミュニティ全体が変更から恩恵を受ける機会を得ることができます。\\
> ソース コードへのアクセスがその前提条件です。\\
> 稼働中のマシンには vagrant を使用し、ラボを実行して、この記事の内容を実践してください。\\
> 必要なものを含む Vagrantfile をフォルダー Vagrant に公開しました\\
> 学習環境をアップロードするため

* * *

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<a name="getting-started"></a>

## はじめる

学習を開始するには、上記のドキュメントを参照してください。

<a name="prerequisites"></a>

### 前提条件

-   ギット
-   Virtual Box と拡張機能
-   V_a_g_r_a_n_t

<a name="installation"></a>

### インストール

リポジトリのクローンを作成する

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
```

* * *

<a name="usage"></a>

## 使用法

LPIC2 202-450 試験について学習するには、このリポジトリを使用してください

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="roadmap"></a>

## ロードマップ

-   [x] リポジトリの作成
-   [ ] トピック 351 に関する例を作成する
-   [ ] トピック 352 に関する例を作成する
-   [ ] トピック 353 に関する例を作成する
-   [ ] シミュレートされた itexam をアップロードする

* * *

<a name="freedoms"></a>

## 4 つの必須の自由

> 0.目的を問わず、プログラムを自由に実行できる (自由 0)。\\
> 1.プログラムがどのように動作するかを研究し、そのように変更する自由\\
> あなたのコンピューティングを思いのままに (自由 1)。\\
> ソース コードへのアクセスがその前提条件です。\\
> 2.他の人を助けるためにコピーを再配布する自由 (自由 2)。\\
> 3\. 修正したバージョンのコピーを他の人に配布する自由 (自由 3)。

* * *

## コマンドを検査する

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

## トピック 351: 完全仮想化

![virtualization](images/virtualization-351.png)

* * *

<a name="topic-351.1"></a>

### 351.1 仮想化の概念と理論

**重さ：**６

**説明：**受験者は、仮想化の一般的な概念、理論、用語を理解し、理解している必要があります。これには、Xen、QEMU、libvirt の用語が含まれます。

**主要な知識領域:**

-   仮想化用語を理解する
-   仮想化の長所と短所を理解する
-   ハイパーバイザーと仮想マシン モニターのさまざまなバリエーションを理解する
-   物理マシンから仮想マシンへの移行の主な側面を理解する
-   ホスト システム間での仮想マシンの移行の主な側面を理解する
-   スナップショット、一時停止、クローン作成、リソース制限など、仮想マシンの仮想化の機能と影響を理解する
-   oVirt、Proxmox、systemd-machined、VirtualBox の認識
-   Open vSwitch の認識

#### 351.1 引用オブジェクト

```sh
Hypervisor
Hardware Virtual Machine (HVM)
Paravirtualization (PV)
Emulation and Simulation
CPU flags
/proc/cpuinfo
Migration (P2V, V2V)
```

#### ハイパーバイザー

##### タイプ 1 ハイパーバイザー (ベアメタル ハイパーバイザー)

**意味：**ホストの物理ハードウェア上で直接実行され、ホスト オペレーティング システムを必要とせずに VM を管理するための基本レイヤーを提供します。

**特徴:**

-   高いパフォーマンスと効率。
-   レイテンシとオーバーヘッドが低減されます。
-   エンタープライズ環境やデータセンターでよく使用されます。

**例:**

-   VMware ESXi: 企業環境で広く使用されている堅牢なハイパーバイザー。
-   Microsoft Hyper-V: Windows Server と統合され、強力なパフォーマンスと管理機能を提供します。
-   Xen: 多くのクラウド サービス プロバイダーによって使用されているオープンソースのハイパーバイザー。
-   KVM (カーネルベースの仮想マシン): Linux カーネルに統合され、Linux ベースのシステムに高いパフォーマンスを提供します。

##### タイプ 2 ハイパーバイザー (ホスト型ハイパーバイザー)

**意味：**従来のオペレーティング システム上で実行され、リソース管理とデバイス サポートをホスト OS に依存します。

**特徴:**

-   特にパーソナルコンピュータでのセットアップと使用が簡単になります。
-   開発、テスト、小規模な導入に対してより柔軟に対応します。
-   通常、ホスト OS からのオーバーヘッドが追加されるため、タイプ 1 ハイパーバイザーよりも効率が低くなります。

**例:**

-   VMware Workstation: 単一のデスクトップ上で複数のオペレーティング システムを実行するための強力なハイパーバイザー。
-   Oracle VirtualBox: 柔軟性と使いやすさで知られるオープンソースのハイパーバイザー。
-   Parallels Desktop: Mac ユーザーが Windows やその他のオペレーティング システムを macOS と一緒に実行できるように設計されています。
-   QEMU (Quick EMUlator): オープンソースのエミュレーターおよびバーチャライザーであり、KVM と組み合わせてよく使用されます。

##### タイプ 1 ハイパーバイザーとタイプ 2 ハイパーバイザーの主な違い

-   導入環境:
    -   タイプ 1 ハイパーバイザーは、ハードウェアとの直接対話と高いパフォーマンスのため、一般にデータセンターやエンタープライズ環境に導入されます。
    -   タイプ 2 ハイパーバイザーは、個人使用、開発、テスト、および小規模な仮想化タスクにより適しています。
-   パフォーマンス：
    -   タイプ 1 ハイパーバイザーは、ホスト OS に依存しないため、一般にパフォーマンスが向上し、遅延が低くなります。
    -   タイプ 2 ハイパーバイザーは、ホスト OS 上で実行するオーバーヘッドにより、パフォーマンスが低下する可能性があります。
-   管理と使いやすさ:
    -   タイプ 1 ハイパーバイザーは、より複雑なセットアップと管理を必要としますが、大規模な展開向けの高度な機能と拡張性を提供します。
    -   タイプ 2 ハイパーバイザーはインストールと使用が簡単で、個人ユーザーや小規模プロジェクトに最適です。

ハードウェア支援仮想化 (HVM)
定義: HVM は、最新の CPU によって提供されるハードウェア拡張機能を利用してハードウェアを仮想化し、最小限のパフォーマンス オーバーヘッドで VM の作成と管理を可能にします。

主な特徴:

ハードウェア サポート: Intel VT-x や AMD-V などの仮想化拡張機能に対する CPU サポートが必要です。
完全仮想化: ハイパーバイザーがハードウェア環境の完全なエミュレーションを提供するため、VM は変更されていないゲスト オペレーティング システムを実行できます。
パフォーマンス: CPU 上でゲスト コードが直接実行されるため、通常はネイティブに近いパフォーマンスが提供されます。
分離: 各 VM は独自の専用ハードウェアがあるかのように動作するため、VM 間に強力な分離が提供されます。
例: VMware ESXi、Microsoft Hyper-V、KVM (カーネルベースの仮想マシン)。
利点:

互換性: 変更を加えることなく、あらゆるオペレーティング システムを実行できます。
パフォーマンス: ハードウェアのサポートによる高いパフォーマンス。
セキュリティ: ハードウェアによって提供される強化された分離機能とセキュリティ機能。
短所:

ハードウェアの依存関係: 特定のハードウェア機能が必要なため、古いシステムとの互換性が制限されます。
複雑さ: より複雑な構成と管理が必要になる場合があります。
準仮想化
定義: 準仮想化には、仮想環境を認識するようにゲスト オペレーティング システムを変更し、ハイパーバイザーとより効率的に対話できるようにすることが含まれます。

主な特徴:

ゲストの変更: ハイパーコールを使用してハイパーバイザーと直接通信するには、ゲスト オペレーティング システムを変更する必要があります。
パフォーマンス: ハードウェアのエミュレーションに関連するオーバーヘッドが削減されるため、従来の完全仮想化よりも効率的になる可能性があります。
互換性: 準仮想化用に変更されたオペレーティング システムに限定されます。
例: 準仮想化ゲストを備えた Xen、特定の構成の VMware ツール、および一部の KVM 構成。
利点:

効率: ハードウェアの仮想化のオーバーヘッドを削減し、特定のワークロードのパフォーマンスを向上させる可能性があります。
リソース使用率: ゲスト OS とハイパーバイザー間の直接通信により、システム リソースがより効率的に使用されます。
短所:

ゲスト OS の変更: ゲスト OS を変更する必要があり、サポートされているオペレーティング システムへの互換性が制限されます。
複雑さ: ハイパーコールの実装にはゲスト OS に追加の複雑さが必要です。
主な違い
ゲスト OS の要件:

HVM: 変更されていないゲスト オペレーティング システムを実行できます。
準仮想化: ハイパーバイザーと連携するには、ゲスト オペレーティング システムを変更する必要があります。
パフォーマンス：

HVM: 通常、ハードウェア支援による実行により、ネイティブに近いパフォーマンスが提供されます。
準仮想化: ハードウェア エミュレーションのオーバーヘッドを削減することで効率的なパフォーマンスを提供できますが、変更されたゲスト OS に依存します。
ハードウェアの依存関係:

HVM: 特定の CPU 機能 (Intel VT-x、AMD-V) が必要です。
準仮想化: 特定の CPU 機能は必要ありませんが、変更されたゲスト OS が必要です。
分離：

HVM: ハードウェア機能を使用して強力な分離を提供します。
準仮想化: ソフトウェア ベースの分離に依存しますが、ハードウェア ベースの分離ほど堅牢ではない可能性があります。
複雑：

HVM: 変更されていない OS をサポートするため、一般に導入がより簡単です。
準仮想化: ゲスト OS への追加のセットアップと変更が必要となり、複雑さが増します。

#### 仮想化の種類

##### ハードウェア仮想化（サーバー仮想化）

**意味：**物理ハードウェアを抽象化して、個別のオペレーティング システムとアプリケーションを実行する仮想マシン (VM) を作成します。  
**使用例:**データセンター、クラウドコンピューティング、サーバー統合。**例:**VMware ESXi、Microsoft Hyper-V、KVM。

##### オペレーティング システムの仮想化 (コンテナ化)

**意味：**複数の分離されたユーザー空間インスタンス (コンテナー) を単一の OS カーネル上で実行できるようにします。**使用例:**マイクロサービス アーキテクチャ、開発およびテスト環境。**例:**Docker、Kubernetes、LXC。

##### ネットワーク仮想化

**意味：**ハードウェアとソフトウェアのネットワーク リソースを単一のソフトウェア ベースの管理エンティティに結合します。**使用例:**ソフトウェア定義ネットワーキング (SDN)、ネットワーク機能仮想化 (NFV)。**例:**VMware NSX、Cisco ACI、OpenStack Neutron。

##### ストレージ仮想化

**意味：**複数のデバイスの物理ストレージを単一の仮想ストレージ ユニットにプールし、一元管理できます。**使用例:**データ管理、ストレージの最適化、災害復旧。**例:**IBM SAN ボリューム コントローラー、VMware vSAN、NetApp ONTAP。

##### デスクトップ仮想化

**意味：**サーバー上でホストされている仮想マシン上でデスクトップ オペレーティング システムを実行できるようにします。**使用例:**仮想デスクトップ インフラストラクチャ (VDI)、リモート ワーク ソリューション。**例:**Citrix Virtual Apps and Desktops、VMware Horizo​​n、Microsoft リモート デスクトップ サービス。

##### アプリケーションの仮想化

**意味：**アプリケーションを基盤となるハードウェアやオペレーティング システムから分離し、隔離された環境で実行できるようにします。**使用例:**アプリケーションの導入、互換性テストの簡素化。**例:**VMware ThinApp、Microsoft App-V、Citrix XenApp。

##### データ仮想化

**意味：**さまざまなソースからのデータを物理的に統合することなく統合し、分析とレポートのための統一されたビューを提供します。**使用例:**ビジネス インテリジェンス、リアルタイム データ統合。**例:**Denodo、Red Hat JBoss Data Virtualization、IBM InfoSphere。

##### 仮想化のメリット

**リソース効率:**物理リソースの有効活用。**コスト削減:**ハードウェアおよび運用コストの削減。**スケーラビリティ:**需要に応じて簡単にスケールアップまたはスケールダウンできます。**柔軟性:**さまざまなワークロードとアプリケーションをサポートします。**災害からの回復：**バックアップとリカバリのプロセスが簡素化されました。**分離：**環境の分離によるセキュリティの向上。

<p align="right">(<a href="#topic-351.1">back to sub Topic 351.1</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.2"></a>

### 351.2ゼン

**重さ：**３

**説明：**受験者は、Xen インストールのインストール、構成、保守、移行、およびトラブルシューティングができる必要があります。 Xen バージョン 4.x に焦点を当てています。

**主要な知識領域:**

-   ネットワークやストレージを含む Xen のアーキテクチャを理解する
-   Xen ノードとドメインの基本構成
-   Xen ノードとドメインの基本的な管理
-   Xen インストールの基本的なトラブルシューティング
-   錠剤の強さ
-   XenStoreの認知度
-   Xenブートパラメータの認識
-   xm ユーティリティの認識

#### 351.2 引用オブジェクト

```sh
Domain0 (Dom0), DomainU (DomU)
PV-DomU, HVM-DomU
/etc/xen/
xl
xl.cfg
xl.conf
xentop
```

#### 351.2 重要なコマンド

##### ふー

```sh
foo
```

<p align="right">(<a href="#topic-351.2">back to sub Topic 351.2</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.3"></a>

### 351.3QEMU

**重さ：**４

**説明：**受験者は、QEMU インストールのインストール、構成、保守、移行、およびトラブルシューティングを行うことができる必要があります。

**主要な知識領域:**

-   KVM、ネットワーキング、ストレージなどの QEMU のアーキテクチャを理解する
-   コマンドラインからQEMUインスタンスを起動する
-   QEMU モニターを使用してスナップショットを管理する
-   QEMU ゲスト エージェントと VirtIO デバイス ドライバーをインストールする
-   ネットワークやストレージを含む QEMU インストールのトラブルシューティング
-   重要な QEMU 構成パラメータの認識

#### 351.3 引用オブジェクト

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

#### 351.3 重要なコマンド

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

### 351.4 Libvirt仮想マシン管理

**重さ：**９

**説明：**受験者は、libvirt および関連ツールを使用して仮想化ホストと仮想マシン (「libvirt ドメイン」) を管理できる必要があります。

**主要な知識領域:**

-   libvirt のアーキテクチャを理解する
-   libvirt 接続とノードを管理する
-   QEMU および Xen ドメイン (スナップショットを含む) を作成および管理する
-   ドメインのリソース消費を管理および分析する
-   ストレージプールとボリュームの作成と管理
-   仮想ネットワークの作成と管理
-   ノード間でドメインを移行する
-   libvirt が Xen および QEMU とどのように対話するかを理解する
-   libvirt が dnsmasq や radvd などのネットワーク サービスとどのように対話するかを理解する
-   libvirt XML 構成ファイルを理解する
-   virtlogd と virtlockd の認識

#### 351.4 引用オブジェクト

```sh
libvirtd
/etc/libvirt/
virsh (including relevant subcommands)
```

#### 351.4 重要なコマンド

##### ふー

```sh
foo
```

<p align="right">(<a href="#topic-351.4">back to sub Topic 351.4</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.5"></a>

### 351.5 仮想マシンのディスクイメージの管理

**重さ：**３

**説明：**受験者は、仮想マシンのディスク イメージを管理できる必要があります。これには、さまざまな形式とハイパーバイザー間でのディスク イメージの変換や、イメージ内に保存されているデータへのアクセスが含まれます。

**主要な知識領域:**

-   Raw イメージ、qcow2、VMDK などのさまざまな仮想ディスク イメージ形式の機能を理解する
-   qemu-img を使用して仮想マシンのディスク イメージを管理する
-   libguestfish を使用してパーティションをマウントし、仮想マシンのディスク イメージに含まれるファイルにアクセスする
-   物理ディスクの内容を仮想マシンのディスクイメージにコピーする
-   さまざまな仮想マシンのディスク イメージ形式間でディスク コンテンツを移行する
-   オープン仮想化フォーマット (OVF) の認識

#### 351.5 引用オブジェクト

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

#### 351.5 重要なコマンド

##### ふー

```sh
foo
```

<p align="right">(<a href="#topic-351.5">back to sub Topic 351.5</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352"></a>

## トピック 352: コンテナの仮想化

* * *

<a name="topic-352.1"></a>

### 352.1 コンテナ仮想化の概念

**重さ：**７

**説明：**受験者はコンテナ仮想化の概念を理解している必要があります。これには、コンテナ仮想化の実装に使用される Linux コンポーネントの理解と、これらのコンポーネントのトラブルシューティングのための標準 Linux ツールの使用が含まれます。

**主要な知識領域:**

-   システムとアプリケーションコンテナの概念を理解する
-   カーネル名前空間を理解して分析する
-   コントロールグループの理解と分析
-   能力の理解と分析
-   コンテナ仮想化における seccomp、SELinux、AppArmor の役割を理解する
-   LXC と Docker が名前空間、cgroup、機能、seccomp、MAC をどのように活用するかを理解する
-   runcの原理を理解する
-   CRI-Oとcontainerdの原理を理解する
-   OCI ランタイムとイメージ仕様の認識
-   Kubernetes Container Runtime Interface (CRI) の認識
-   ポッドマン、ビルダ、スコペオの認識
-   Linux およびその他の無料オペレーティング システム (rkt、OpenVZ、systemd-nspawn、BSD Jails など) における他のコンテナ仮想化アプローチの認識

#### 352.1 引用オブジェクト

```sh
nsenter
unshare
ip (including relevant subcommands)
capsh
/sys/fs/cgroups
/proc/[0-9]+/ns
/proc/[0-9]+/status
```

#### 352.1 重要なコマンド

##### ふー

```sh
foo
```

<p align="right">(<a href="#topic-352.1">back to sub topic 352.1</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.2"></a>

### 352.2LXC

**重さ：**６

**説明：**受験者は、LXC および LXD を使用してシステム コンテナを使用できる必要があります。対象となる LXC のバージョンは 3.0 以降です。

**主要な知識領域:**

-   LXC と LXD のアーキテクチャを理解する
-   LXD を使用して既存のイメージに基づいて LXC コンテナー (ネットワーキングやストレージを含む) を管理する
-   LXCコンテナのプロパティを構成する
-   LXC コンテナーのリソース使用量を制限する
-   LXD プロファイルを使用する
-   LXC イメージを理解する
-   従来の LXC ツールの認識

#### 352.2 引用オブジェクト

```sh
lxd
lxc (including relevant subcommands)
```

#### 352.2 重要なコマンド

##### ふー

```sh
foo
```

<p align="right">(<a href="#topic-352.2">back to sub topic 352.2</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.3"></a>

### 352.3 ドッカー

**重さ：**９

**説明：**受験者は、Docker ノードと Docker コンテナを管理できる必要があります。これには、Docker のアーキテクチャを理解するだけでなく、Docker がノードの Linux システムとどのように対話するかを理解することが含まれます。

**主要な知識領域:**

-   Docker のアーキテクチャとコンポーネントを理解する
-   Docker レジストリのイメージを使用して Docker コンテナを管理する
-   Dockerコンテナのイメージとボリュームを理解して管理する
-   Docker コンテナのログを理解して管理する
-   Docker のネットワークを理解して管理する
-   Dockerfile を使用してコンテナー イメージを作成する
-   レジストリ Docker イメージを使用して Docker レジストリを実行する

#### 352.3 引用オブジェクト

```sh
dockerd
/etc/docker/daemon.json
/var/lib/docker/
docker
Dockerfile
```

#### 352.3 重要なコマンド

##### 港湾労働者

```sh
# Examples of docker
```

<p align="right">(<a href="#topic-352.3">back to sub topic 352.3</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.4"></a>

### 352.4 コンテナ オーケストレーション プラットフォーム

**重さ：**３

**説明：**受験者は、コンテナ オーケストレーションの重要性と、コンテナ オーケストレーションを実装するために Docker Swarm と Kubernetes が提供する重要な概念を理解する必要があります。

**主要な知識領域:**

-   コンテナオーケストレーションの関連性を理解する
-   Docker Compose と Docker Swarm の主要な概念を理解する
-   Kubernetes と Helm の主要な概念を理解する
-   OpenShift、Rancher、Mesosphere DC/OS の認識

<p align="right">(<a href="#topic-352.4">back to sub topic 352.4</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353"></a>

## トピック 353: VM の展開とプロビジョニング

* * *

<a name="topic-353.1"></a>

### 353.1 クラウド管理ツール

**重さ：**２

**説明：**受験者は、パブリック クラウドの一般的なサービスを理解し、一般的に利用可能なクラウド管理ツールの基本的な機能知識を持っている必要があります。

**主要な知識領域:**

-   パブリック クラウドの一般的なサービスを理解する
-   OpenStack の基本的な機能の知識
-   Terraform の基本的な機能の知識
-   CloudStack、Eucalyptus、OpenNebula の認識

#### 353.1 引用オブジェクト

```sh
IaaS, PaaS, SaaS
OpenStack
Terraform
```

#### 353.1 重要なコマンド

##### ふー

```sh
# examples
```

<p align="right">(<a href="#topic-353.1">back to sub topic 353.1</a>)</p>
<p align="right">(<a href="#topic-353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.2"></a>

### 353.2 パッカー

**重さ：**２

**説明：**受験者は、Packer を使用してシステム イメージを作成できる必要があります。これには、さまざまなパブリックおよびプライベート クラウド環境での Packer の実行や、LXC/LXD 用のコンテナ イメージの構築が含まれます。

**主要な知識領域:**

-   Packer の機能と特徴を理解する
-   テンプレート ファイルの作成と保守
-   さまざまなビルダーを使用してテンプレート ファイルからイメージを構築する

#### 353.2 引用オブジェクト

```sh
packer
```

#### 353.2 重要なコマンド

##### パッカー

```sh
# examples
```

<p align="right">(<a href="#topic-353.2">back to sub topic 353.2</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.3"></a>

### 353.3 クラウド初期化

**重さ：**３

**説明：**受験者は、cloud-init を使用して、標準化されたイメージから作成された仮想マシンを構成できる必要があります。これには、利用可能なハードウェア リソース、特にディスク領域とボリュームに合わせて仮想マシンを調整することが含まれます。  
さらに、受験者は安全な SSH ログインを許可し、特定のソフトウェア パッケージのセットをインストールできるようにインスタンスを構成できる必要があります。  
さらに、受験者は、cloud-init サポートを備えた新しいシステム イメージを作成できる必要があります。

**主要な知識領域:**

-   ユーザーデータ、cloud-init の初期化と構成など、cloud-init の機能と概念を理解する
-   Cloud-init を使用して、ファイル システムの作成、サイズ変更、マウントを行い、SSH キーなどのログイン資格情報を含むユーザー アカウントを構成し、ディストリビューションのリポジトリからソフトウェア パッケージをインストールします。
-   Cloud-init をシステム イメージに統合する
-   テストには構成ドライブ データソースを使用する

#### 353.3 引用オブジェクト

```sh
cloud-init
user-data
/var/lib/cloud/
```

#### 353.3 重要なコマンド

##### ふー

```sh
# examples
```

<p align="right">(<a href="#topic-353.3">back to sub topic 353.3</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.4"></a>

### 353.4 浮浪者

**重さ：**３

**説明：**受験者は、仮想マシンのプロビジョニングなど、Vagrant を使用して仮想マシンを管理できる必要があります。

**主要な知識領域:**

-   ストレージやネットワークなど、Vagrant のアーキテクチャと概念を理解する
-   アトラスからボックスを取得して使用する
-   Vagrantfile を作成して実行する
-   Vagrant 仮想マシンにアクセスする
-   Vagrant 仮想マシンとホスト システム間でフォルダーを共有および同期する
-   Vagrant プロビジョニング、つまりファイル プロビジョナーとシェル プロビジョナーを理解する
-   マルチマシンのセットアップを理解する

#### 353.4 引用オブジェクト

```sh
vagrant
Vagrantfile
```

#### 353.4 重要なコマンド

##### 浮浪者

```sh
# examples
```

<p align="right">(<a href="#topic-353.4">back to sub topic 353.4</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## 貢献する

オープンソース コミュニティを素晴らしい場所にするのは、コントリビューションのおかげです。
学び、インスピレーションを与え、創造します。あなたが行う貢献はすべて、**とても感謝しています**。

これを改善する提案がある場合は、リポジトリをフォークしてください。
プルリクエストを作成します。 「拡張」タグを付けて問題を開くこともできます。
プロジェクトにスターを付けることを忘れないでください。再度、感謝します！

1.  プロジェクトをフォークする
2.  機能ブランチを作成します (`git checkout -b feature/AmazingFeature`）
3.  変更をコミットします (`git commit -m 'Add some AmazingFeature'`）
4.  ブランチにプッシュ (`git push origin feature/AmazingFeature`）
5.  プルリクエストを開く

* * *

## ライセンス

-   このプロジェクトは MIT ライセンスに基づいてライセンスされています \* 詳細については LICENSE.md ファイルを参照してください

* * *

## 接触

マルコス・シルヴェストリーニ -[まｒこｓ。しｌゔぇｓｔりに＠ｇまいｌ。こｍ](mailto:marcos.silvestrini@gmail.com)￥[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/mrsilvestrini.svg?style=social&label=Follow%20%40mrsilvestrini)](https://twitter.com/mrsilvestrini)

プロジェクトリンク:[ｈっｔｐｓ：／／ぎてゅｂ。こｍ／まｒこっしｌゔぇｓｔりに／ぇあｒにんｇーｌぴｃー３ー３０５ー３００](https://github.com/marcossilvestrini/learning-lpic-3-305-300)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## 謝辞

-   [リチャード・ストールマンの](http://www.stallman.org/)
-   [Richard Stallman による GNU/Linux FAQ](https://www.gnu.org/gnu/gnu-linux-faq.html)
-   [GNU](https://www.gnu.org/)
-   [GNU オペレーティング システム](https://www.gnu.org/gnu/thegnuproject.html)
-   [GCC コンパイラ](https://gcc.gnu.org/wiki/History)
-   [GNU TR](https://www.gnu.org/software/tar/)
-   [GNU Make](https://www.gnu.org/software/make/)
-   [GNU Emacs](https://en.wikipedia.org/wiki/Emacs)
-   [GNU パッケージ](https://www.gnu.org/software/)
-   [GNU/Linux コレクション](https://directory.fsf.org/wiki/Collection:GNU/Linux)
-   [GNU Grub ブートローダー](https://www.gnu.org/software/grub/)
-   [GNU ハード](https://www.gnu.org/software/hurd/hurd/what_is_the_gnu_hurd.html)
-   [カーネル](https://www.kernel.org/)
-   [Linux カーネルのマニュアル ページ](https://www.kernel.org/doc/man-pages/)
-   [Linux標準ベース](https://en.wikipedia.org/wiki/Linux_Standard_Base)
-   [ファイルシステム階層の標準](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)
-   [ファイル階層構造](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.pdf)
-   [FSF](https://www.fsf.org)
-   [フリーソフトウェアディレクトリ](https://directory.fsf.org/wiki/Free_Software_Directory:Free_software_replacements)
-   [フリーソフトウェア](https://www.gnu.org/philosophy/free-sw.html)
-   [コピーレフト](https://www.gnu.org/licenses/copyleft.en.html)
-   [GPL](https://www.gnu.org/licenses/quick-guide-gplv3.html)
-   [GNU 劣等一般公衆利用許諾書](https://www.gnu.org/licenses/lgpl-3.0.html)
-   [BSD](https://opensource.org/licenses/BSD-3-Clause)
-   [オープンソースイニシアチブ](https://opensource.org/)
-   [クリエイティブ・コモンズ](https://creativecommons.org/)
-   [ライセンスLTS](https://en.wikipedia.org/wiki/Long-term_support)
-   [Debian フリーソフトウェアのガイドライン](https://www.debian.org/social_contract#guidelines)
-   [X11組織](https://www.x.org/wiki/)
-   [ウェイランド](https://wayland.freedesktop.org/)
-   [GNU GNOME](https://www.gnu.org/press/gnome-1.0.html)
-   [GNOME](https://www.gnome.org/)
-   [XFCE](https://xfce.org/)
-   [KDEプラズマ](https://kde.org/plasma-desktop/)
-   [調和](https://en.wikipedia.org/wiki/Harmony_(toolkit))
-   [xRDP](https://bytexd.com/xrdp-centos/)
-   [NTP](https://www.ntppool.org/en/)
-   [ボーン・アゲイン シェル](https://www.gnu.org/software/bash/manual/)
-   [シバン](https://bash.cyberciti.biz/guide/Shebang)
-   [環境変数](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)
-   [GNU グロビング](https://man7.org/linux/man-pages/man7/glob.7.html)
-   [グロビング](https://linuxhint.com/bash_globbing_tutorial/)
-   [引用](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
-   [正規表現](https://www.gnu.org/software/grep/manual/html_node/Regular-Expressions.html)
-   [Linux ディストリビューションのリスト](https://en.wikipedia.org/wiki/List_of_Linux_distributions)
-   [ディストロウォッチ](https://distrowatch.com/)
-   [Linux ディストリビューションの比較](https://en.wikipedia.org/wiki/Comparison_of_Linux_distributions)
-   [パッケージをダウンロードする](https://pkgs.org/)
-   [パッケージのインストール](https://installati.one/)
-   [パッケージのインストールガイド](https://installati.one/)
-   [バグジラ](https://bugzilla.kernel.org/)
-   [コマンドが見つかりません](https://command-not-found.com/)
-   [ディストリビューションテスト](https://distrotest.net/index.php)
-   [Bashrc ジェネレーター](http://bashrcgenerator.com/)
-   [エクスプレインシェル](https://explainshell.com/)
-   [Vim チュートリアル](https://www.openvim.com/)
-   [Linux シェル スクリプトのチュートリアル](https://bash.cyberciti.biz/guide/Main_Page)
-   [Github バッジ](https://github.com/alexandresanlim/Badges4-README.md-Profile)
-   [コマンドの例](https://www.geeksforgeeks.org/)
-   [カーネルをコンパイルする](https://wiki.linuxquestions.org/wiki/How_to_build_and_install_your_own_Linux_kernel)
-   [練る](https://www.isc.org/bind/)
-   [バインドロギング](https://www.zytrax.com/books/dns/ch7/logging.html)
-   [DNSレコードタイプのリスト](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
-   [DNSレコードタイプのリスト](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
-   [W3テック](https://w3techs.com/)
-   [アパッチ](https://www.apache.org/)
-   [Apache ディレクティブ][def]
-   [HTTPステータスコード](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
-   [Apache、nginx、Lighttpd の強力な暗号](https://cipherlist.eu/)
-   [SSL チュートリアル](https://www.golinuxcloud.com/blog/)
-   [SSL 構成 Mozilla](https://ssl-config.mozilla.org/)
-   仮想化の定義
    -   [レッドハット](https://www.redhat.com/pt-br/topics/virtualization/what-is-virtualization)
    -   [AWS](https://aws.amazon.com/pt/what-is/virtualization/)
    -   [IBM](https://www.ibm.com/topics/virtualization)
    -   [おペン層ｒせ。小ｍ](https://opensource.com/resources/virtualization)
-   [KVM(カーネル仮想マシン)](https://www.redhat.com/pt-br/topics/virtualization/what-is-KVM)
-   [KVM管理ツール](https://www.linux-kvm.org/page/Management_Tools)
-   [ウィキ Xenプロジェクト](https://wiki.xenproject.org/wiki/Book/HelloXenProject/1-Chapter)
-   [LPI ブログ: Xen 仮想化とクラウド コンピューティング #01: はじめに](https://www.lpi.org/pt-br/blog/2020/10/01/xen-virtualization-and-cloud-computing-01-introduction/)
-   オープンスタックのドキュメント
    -   [レッドハット](https://www.redhat.com/pt-br/topics/openstack)
-   [LPIC-3 305-300 の目的](https://www.lpi.org/our-certifications/exam-305-objectives/)
-   [LPIC-3 305-300 Wiki](https://wiki.lpi.org/wiki/LPIC-305_Objectives_V3.0)
-   [LPIC-3 305-300 学習教材](https://cursos.linuxsemfronteiras.com.br/courses/preparatorio-para-certificacao-lpic-3-305/)
-   [ITexams による LPIC-3 305-300 模擬試験](https://www.itexams.com/info/305-300)

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
