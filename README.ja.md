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

# LEARNING LPIC-3 305-300

![LPIC3-305-300](images/lpic3-305-300.jpg)

<p align="center">
<strong>ドキュメントを探る »</strong></a>
    <br />
    <a href="https://marcossilvestrini.github.io/learning-lpic-3-305-300/">ウェブサイト</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300">コードページ</a>
    -
    <a href="https://skynet-8.gitbook.io/learning-lpic-3-305-300">Gitbook</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">バグを報告</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">機能をリクエスト</a>
</p>

---

## 概要

<details>
  <summary><b>目次</b></summary>
  <ol>
    <li>
      <a href="#about-the-project">プロジェクトについて</a>
    </li>
    <li>
      <a href="#getting-started">はじめに</a>
      <ul>
        <li><a href="#prerequisites">前提条件</a></li>
        <li><a href="#installation">インストール</a></li>
      </ul>
    </li>
    <li><a href="#usage">使用法</a></li>
    <li><a href="#roadmap">ロードマップ</a></li>
    <li><a href="#freedoms">4つの基本的自由</a></li>
    <li>
      <a href="#topic-351">トピック351: フル仮想化</a>
      <ul>
        <li><a href="#topic-351.1">351.1 仮想化の概念と理論</a></li>
        <li><a href="#topic-351.2">351.2 Xen</a></li>
        <li><a href="#topic-351.3">351.3 QEMU</a></li>
        <li><a href="#topic-351.4">351.4 Libvirt仮想マシン</a></li>
        <li><a href="#topic-351.5">351.5 仮想マシンディスクイメージ管理</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-352">トピック352: コンテナ仮想化</a>
      <ul>
        <li><a href="#topic-352.1">352.1 コンテナ仮想化の概念</a></li>
        <li><a href="#topic-352.2">352.2 LXC</a></li>
        <li><a href="#topic-352.3">352.3 Docker</a></li>
        <li><a href="#topic-352.4">352.4 コンテナオーケストレーションプラットフォーム</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-353">トピック353: VMのデプロイとプロビジョニング</a>
      <ul>
        <li><a href="#topic-353.1">353.1 クラウド管理ツール</a></li>
        <li><a href="#topic-353.2">353.2 Packer</a></li>
        <li><a href="#topic-353.3">353.3 cloud-init</a></li>
        <li><a href="#topic-353.4">353.4 Vagrant</a></li>
      </ul>
    </li>
    <li><a href="#license">ライセンス</a></li>
    <li><a href="#contact">連絡先</a></li>
    <li><a href="#acknowledgments">謝辞</a></li>
  </ol>
</details><br>

---

<a name="about-the-project"></a>

## プロジェクトについて

> このプロジェクトは、学生や専門家がGNULinuxの主要な概念を学ぶのを助けることを目的としています
> およびフリーソフトウェア
> DebianやRPMなどのいくつかのGNULinuxディストリビューションがカバーされます
> 一部のパッケージのインストールと構成もカバーされます
> これを行うことで、コミュニティ全体があなたの変更から利益を得る機会を与えることができます。
> ソースコードへのアクセスは、その前提条件です。
> Vagrantを使用してマシンを起動し、この記事のラボや実践コンテンツを実行します。
> Vagrantフォルダに、学習環境をアップロードするために必要なVagrantfileを公開しました。

---

<p align="right">(<a href="#readme-top">トップに戻る</a>)</p>

<a name="getting-started"></a>

## はじめに

学習を開始するには、上記のドキュメントを参照してください。

<a name="prerequisites"></a>

### 前提条件

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [VMware Workstation](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
* [Vagrant VMWare Utility](https://developer.hashicorp.com/vagrant/install/vmware)
* [Vagrant](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### インストール

リポジトリをクローンします

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

テンプレート *Vagrantfile-topic-XXX* をカスタマイズします。このファイルには、ラボ用のVM設定が含まれています。例：

* ファイル [Vagrantfile-topic-351](vagrant/Vagrantfile-topic-351)
  * vm.clone_directory = "<your_driver_letter>:\\`<folder>`\\<to_machine>\\#{VM_NAME}-instance-1"
    例: vm.clone_directory = "E:\\Servers\\VMWare\\#{VM_NAME}-instance-1"
  * vm.vmx["memsize"] = ""
  * vm.vmx["numvcpus"] = ""
  * vm.vmx["cpuid.coresPerSocket"] = ""

[configs/network](configs/network/) のファイルでネットワーク構成をカスタマイズします。

---

<a name="usage"></a>

## 使用法

このリポジトリを使用してLPIC-3 305-300試験について学びます

### 起動と停止

*Vagrantfile-topic-xxx* テンプレートを切り替え、新しいファイルに *Vagrantfile* という名前でコピーします。

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### VMの再起動

```sh
cd vagrant && vagrant reload
```

**重要:**
*VagrantなしでVMを再起動すると、共有フォルダが起動後にマウントされません。*

### Powershellを使用して起動と停止

Windowsプラットフォームを使用している場合、VMの起動と停止のためのPowershellスクリプトを作成しました。

```powershell
vagrant/up.ps1
vagrant/destroy.ps1
```

### インフラストラクチャスキーマ トピック 351

![topic-351](images/infraestructure-topic-351.png)

<p align="right">(<a href="#readme-top">トップに戻る</a>)</p>

---

<a name="roadmap"></a>

## ロードマップ

* [X] リポジトリを作成
* [X] ラボのプロビジョニング用スクリプトを作成
* [X] トピック351に関する例を作成
* [X] トピック352に関する例を作成
* [ ] トピック353に関する例を作成
* [ ] シミュレーション試験をアップロード

---

<a name="freedoms"></a>

## 4つの基本的自由

> 0.あなたが望む目的のためにプログラムを実行する自由 (自由0)。
> 1.プログラムがどのように機能するかを学び、あなたが望むように計算を行うために変更する自由 (自由1)。
> ソースコードへのアクセスは、その前提条件です。
> 2.他の人を助けるためにコピーを再配布する自由 (自由2)。
> 3.あなたの修正されたバージョンのコピーを他の人に配布する自由 (自由3)。

---

## コマンドの検査

```sh
type COMMAND
apropos COMMAND
whatis COMMAND --long
whereis COMMAND
COMMAND --help, --h
man COMMAND
```

<p align="right">(<a href="#readme-top">トップに戻る</a>)</p>

---

<a name="topic-351"></a>

## トピック351: フル仮想化

![LPIC3-305-300](images/virtualization-351.png)

---

<a name="topic-351.1"></a>

### 351.1 仮想化の概念と理論

**重み:** 6

**説明:** 候補者は、仮想化の一般的な概念、理論、および用語を知って理解している必要があります。これには、Xen、QEMU、およびlibvirtの用語が含まれます。

**主要な知識分野:**

* 🖥️ 仮想化用語を理解する
* ⚖️ 仮想化の利点と欠点を理解する
* 🛠️ ハイパーバイザーと仮想マシンモニターのさまざまなバリエーションを理解する
* 🔄 物理マシンから仮想マシンへの移行の主要な側面を理解する
* 🚀 ホストシステム間での仮想マシンの移行の主要な側面を理解する
* 📸 スナップショット、ポーズ、クローン作成、リソース制限など、仮想マシンに対する仮想化の特徴と影響を理解する
* 🌐 oVirt、Proxmox、systemd-machined、およびVirtualBoxの認識
* 🔗 Open vSwitchの認識

#### 351.1 引用されたオブジェクト

```sh
ハイパーバイザー
ハードウェア仮想マシン (HVM)
パラ仮想化 (PV)
エミュレーションとシミュレーション
CPUフラグ
/proc/cpuinfo
移行 (P2V, V2V)
```

#### ハイパーバイザー

##### タイプ1ハイパーバイザー (ベアメタルハイパーバイザー)

###### タイプ1の定義

ホストの物理ハードウェア上で直接実行され、ホストオペレーティングシステムを必要とせずにVMを管理するための基本レイヤーを提供します。

###### タイプ1の特徴

* ⚡ 高性能と効率。
* ⏱️ レイテンシとオーバーヘッドが低い。
* 🏢 企業環境やデータセンターでよく使用されます。

###### タイプ1の例

* VMware ESXi: 企業環境で広く使用されている堅牢なハイパーバイザー。
* Microsoft Hyper-V: Windows Serverに統合されており、強力なパフォーマンスと管理機能を提供します。
* Xen: 多くのクラウドサービスプロバイダーによって使用されるオープンソースのハイパーバイザー。
* KVM (カーネルベースの仮想マシン): Linuxカーネルに統合されており、Linuxベースのシステムに高いパフォーマンスを提供します。

##### タイプ2ハイパーバイザー (ホステッドハイパーバイザー)

###### タイプ2の定義

従来のオペレーティングシステムの上で実行され、リソース管理とデバイスサポートのためにホストOSに依存します。

###### タイプ2の特徴

* 🛠️ 特に個人用コンピュータでのセットアップと使用が簡単です。
* 🔧 開発、テスト、および小規模な展開に対してより柔軟です。
* 🐢 ホストOSからの追加のオーバーヘッドのため、通常はタイプ1ハイパーバイザーよりも効率が低いです。

###### タイプ2の例

* VMware Workstation: 単一のデスクトップで複数のオペレーティングシステムを実行するための強力なハイパーバイザー。
* Oracle VirtualBox: 柔軟性と使いやすさで知られるオープンソースのハイパーバイザー。
* Parallels Desktop: MacユーザーがWindowsや他のオペレーティングシステムをmacOSと並行して実行するために設計されています。
* QEMU (クイックエミュレータ): オープンソースのエミュレータおよび仮想化ツールで、KVMと組み合わせて使用されることがよくあります。

##### タイプ1とタイプ2ハイパーバイザーの主な違い

* デプロイメント環境:
  * タイプ1ハイパーバイザーは、ハードウェアとの直接的な相互作用と高いパフォーマンスのため、データセンターや企業環境で一般的に展開されます。
  * タイプ2ハイパーバイザーは、個人使用、開発、テスト、および小規模な仮想化タスクにより適しています。
* パフォーマンス:
  * タイプ1ハイパーバイザーは、ホストOSに依存しないため、一般的により良いパフォーマンスと低レイテンシを提供します。
  * タイプ2ハイパーバイザーは、ホストOSの上で実行されるため、パフォーマンスの低下がある場合があります。
* 管理と使いやすさ:
  * タイプ1ハイパーバイザーは、より複雑なセットアップと管理を必要としますが、大規模な展開のための高度な機能とスケーラビリティを提供します。
  * タイプ2ハイパーバイザーは、インストールと使用が簡単で、個々のユーザーや小規模なプロジェクトに最適です。

##### 移行タイプ

ハイパーバイザーの文脈では、仮想マシンを作成および管理するために使用される技術であり、P2V移行とV2V移行という用