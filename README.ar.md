<h1><a name="readme-top"></a></h1>

[![Create Release](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/release.yml)[![Translate README](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/translate.yml)[![Deploy GitHub Pages](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/jekyll-gh-pages.yml)[![Generate HTML and PDF](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/generate-html.yml)[![PSScriptAnalyzer](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/powershell.yml)[![Slack Notification](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml/badge.svg)](https://github.com/marcossilvestrini/learning-lpic-3-305-300/actions/workflows/slack.yml)

* * *

[![MIT License][license-shield]][license-url][![Forks][forks-shield]][forks-url][![Stargazers][stars-shield]][stars-url][![Contributors][contributors-shield]][contributors-url][![Issues][issues-shield]][issues-url][![LinkedIn][linkedin-shield]][linkedin-url]

* * *

# تعلم LPIC-3 305-300

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

## ملخص

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

## حول المشروع

> يهدف هذا المشروع إلى مساعدة الطلاب أو المحترفين على تعلم المفاهيم الأساسية لـ GNULinux
> والبرمجيات الحرة\\
> سيتم تغطية بعض توزيعات GNULinux مثل Debian وRPM\\
> سيتم أيضًا تناول تثبيت وتكوين بعض الحزم\\
> ومن خلال القيام بذلك، يمكنك منح المجتمع بأكمله فرصة للاستفادة من تغييراتك.\\
> يعد الوصول إلى الكود المصدري شرطًا مسبقًا لذلك.\\
> استخدم vagrant for up devices وقم بتنفيذ الدروس المعملية والتمرين على المحتوى في هذه المقالة.\\
> لقد قمت بنشر ملف Vagrantfile في المجلد Vagrant مع ما هو ضروري\\
> بالنسبة لك لتحميل بيئة للدراسات

* * *

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<a name="getting-started"></a>

## ابدء

لبدء التعلم، راجع الوثائق أعلاه.

<a name="prerequisites"></a>

### المتطلبات الأساسية

هذا مثال لكيفية إدراج الأشياء التي تحتاجها لاستخدام البرنامج
وكيفية تثبيتها.

-   شخص سخيف
-   الصندوق الافتراضي والامتداد
-   المتشرد

<a name="installation"></a>

### تثبيت

استنساخ الريبو

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
```

* * *

<a name="usage"></a>

## الاستخدام

استخدم هذا المستودع للتعرف على اختبار LPIC2 202-450

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="roadmap"></a>

## خريطة الطريق

-   [ ] إنشاء مستودع
-   [ ] إنشاء أمثلة حول الموضوع 351
-   [ ] إنشاء أمثلة حول الموضوع 352
-   [ ] إنشاء أمثلة حول الموضوع 353
-   [ ] تحميل itexam محاكاة

* * *

<a name="freedoms"></a>

## أربع حريات أساسية

> 0.حرية تشغيل البرنامج كما تريد ولأي غرض (حرية 0).\\
> 1.حرية دراسة آلية عمل البرنامج وتغييره حتى يعمل\\
> الكمبيوتر الخاص بك كما يحلو لك (الحرية 1).\\
> يعد الوصول إلى الكود المصدري شرطًا مسبقًا لذلك.\\
> 2.حرية إعادة توزيع النسخ حتى تتمكن من مساعدة الآخرين (الحرية 2).\\
> 3.حرية توزيع نسخ من نسختك المعدلة على الآخرين (الحرية 3).

* * *

## فحص الأوامر

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

## موضوع 351: المحاكاة الافتراضية الكاملة

* * *

<a name="topic-351.1"></a>

### 351.1 مفاهيم ونظرية المحاكاة الافتراضية

**وزن:**ط

**وصف:**يجب على المرشحين معرفة وفهم المفاهيم العامة ونظرية ومصطلحات المحاكاة الافتراضية. يتضمن ذلك مصطلحات Xen وQEMU وlibvirt.

**مجالات المعرفة الرئيسية:**

-   فهم مصطلحات المحاكاة الافتراضية
-   فهم إيجابيات وسلبيات المحاكاة الافتراضية
-   افهم الأشكال المختلفة لبرامج Hypervisor وشاشات الأجهزة الافتراضية
-   فهم الجوانب الرئيسية للانتقال الفعلي إلى الأجهزة الافتراضية
-   فهم الجوانب الرئيسية لترحيل الأجهزة الافتراضية بين الأنظمة المضيفة
-   فهم ميزات وتأثيرات المحاكاة الافتراضية على الأجهزة الافتراضية، مثل التقاط الصور والإيقاف المؤقت والاستنساخ وحدود الموارد
-   الوعي بـ oVirt وProxmox وsystemd-machined وVirtualBox
-   الوعي بـ Open vSwitch

#### 351.1 الكائنات المستشهد بها

```sh
Hypervisor
Hardware Virtual Machine (HVM)
Paravirtualization (PV)
Emulation and Simulation
CPU flags
/proc/cpuinfo
Migration (P2V, V2V)
```

#### 351.1 الأوامر الهامة

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-351.1">back to sub Topic 351.1</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.2"></a>

### 351.2 زين

**وزن:**ع

**وصف:**يجب أن يكون المرشحون قادرين على تثبيت وتكوين وصيانة وترحيل واستكشاف أخطاء تثبيتات Xen وإصلاحها. يتم التركيز على إصدار Xen 4.x.

**مجالات المعرفة الرئيسية:**

-   فهم بنية Xen، بما في ذلك الشبكات والتخزين
-   التكوين الأساسي لعقد ومجالات Xen
-   الإدارة الأساسية لعقد ومجالات Xen
-   استكشاف الأخطاء وإصلاحها الأساسية لعمليات تثبيت Xen
-   جشع الحبوب
-   الوعي بـ XenStore
-   الوعي بمعلمات التمهيد Xen
-   الوعي بأداة xm

#### 351.2 الكائنات المستشهد بها

```sh
Domain0 (Dom0), DomainU (DomU)
PV-DomU, HVM-DomU
/etc/xen/
xl
xl.cfg
xl.conf
xentop
```

#### 351.2 الأوامر الهامة

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-351.2">back to sub Topic 351.2</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.3"></a>

### 351.3 كيمو

**وزن:**٤

**وصف:**يجب أن يكون المرشحون قادرين على تثبيت وتكوين وصيانة وترحيل واستكشاف أخطاء تثبيت QEMU وإصلاحها.

**مجالات المعرفة الرئيسية:**

-   فهم بنية QEMU، بما في ذلك KVM والشبكات والتخزين
-   بدء تشغيل مثيلات QEMU من سطر الأوامر
-   إدارة اللقطات باستخدام شاشة QEMU
-   قم بتثبيت برامج تشغيل الأجهزة QEMU Guest Agent وVirtIO
-   استكشاف أخطاء عمليات تثبيت QEMU وإصلاحها، بما في ذلك الشبكات والتخزين
-   الوعي بمعلمات تكوين QEMU الهامة

#### 351.3 الكائنات المذكورة

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

#### 351.3 الأوامر الهامة

##### الملكية الفكرية

```sh
# list links
ip link show
```

<p align="right">(<a href="#topic-351.3">back to sub Topic 351.3</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.4"></a>

### 351.4 إدارة الآلة الافتراضية Libvirt

**وزن:**ص

**وصف:**يجب أن يكون المرشحون قادرين على إدارة مضيفي المحاكاة الافتراضية والأجهزة الافتراضية ("نطاقات libvirt") باستخدام libvirt والأدوات ذات الصلة.

**مجالات المعرفة الرئيسية:**

-   فهم بنية libvirt
-   إدارة اتصالات وعقد libvirt
-   إنشاء وإدارة مجالات QEMU وXen، بما في ذلك اللقطات
-   إدارة وتحليل استهلاك الموارد للمجالات
-   إنشاء وإدارة مجموعات التخزين ووحدات التخزين
-   إنشاء وإدارة الشبكات الافتراضية
-   ترحيل المجالات بين العقد
-   فهم كيفية تفاعل libvirt مع Xen وQEMU
-   فهم كيفية تفاعل libvirt مع خدمات الشبكة مثل dnsmasq وradvd
-   فهم ملفات تكوين libvirt XML
-   الوعي بـvirtlogd وvirtlockd

#### 351.4 الكائنات المذكورة

```sh
libvirtd
/etc/libvirt/
virsh (including relevant subcommands)
```

#### 351.4 الأوامر الهامة

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-351.4">back to sub Topic 351.4</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-351.5"></a>

### 351.5 إدارة صور قرص الجهاز الظاهري

**وزن:**ع

**وصف:**يجب أن يكون المرشحون قادرين على إدارة صور قرص الأجهزة الافتراضية. يتضمن ذلك تحويل صور القرص بين التنسيقات المختلفة وبرامج Hypervisor والوصول إلى البيانات المخزنة داخل الصورة.

**مجالات المعرفة الرئيسية:**

-   فهم ميزات تنسيقات صور القرص الافتراضية المختلفة، مثل الصور الأولية وqcow2 وVMDK
-   إدارة صور قرص الجهاز الظاهري باستخدام qemu-img
-   قم بتثبيت الأقسام والوصول إلى الملفات الموجودة في صور قرص الجهاز الظاهري باستخدام libguestfish
-   انسخ محتوى القرص الفعلي إلى صورة قرص الجهاز الظاهري
-   ترحيل محتوى القرص بين تنسيقات صور قرص الجهاز الظاهري المختلفة
-   الوعي بتنسيق المحاكاة الافتراضية المفتوحة (OVF)

#### 351.5 الكائنات المذكورة

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

#### 351.5 أوامر هامة

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-351.5">back to sub Topic 351.5</a>)</p>
<p align="right">(<a href="#topic-351">back to Topic 351</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352"></a>

## موضوع 352: محاكاة الحاوية

* * *

<a name="topic-352.1"></a>

### 352.1 مفاهيم المحاكاة الافتراضية للحاويات

**وزن:**ح

**وصف:**يجب أن يفهم المرشحون مفهوم المحاكاة الافتراضية للحاوية. يتضمن ذلك فهم مكونات Linux المستخدمة لتنفيذ المحاكاة الافتراضية للحاويات بالإضافة إلى استخدام أدوات Linux القياسية لاستكشاف أخطاء هذه المكونات وإصلاحها.

**مجالات المعرفة الرئيسية:**

-   فهم مفاهيم النظام وحاوية التطبيق
-   فهم وتحليل مساحات أسماء النواة
-   فهم وتحليل المجموعات الضابطة
-   فهم وتحليل القدرات
-   فهم دور seccomp وSELinux وAppArmor في المحاكاة الافتراضية للحاويات
-   افهم كيف تستفيد LXC وDocker من مساحات الأسماء ومجموعات التحكم والإمكانات وseccomp وMAC
-   فهم مبدأ runc
-   فهم مبدأ CRI-O والحاويات
-   الوعي بوقت تشغيل OCI ومواصفات الصورة
-   الوعي بواجهة تشغيل حاوية Kubernetes (CRI)
-   الوعي بالبودمان والبناء والسكوبيو
-   الوعي بأساليب المحاكاة الافتراضية للحاويات الأخرى في Linux وأنظمة التشغيل المجانية الأخرى، مثل rkt أو OpenVZ أو systemd-nspawn أو BSD Jails

#### 352.1 الكائنات المستشهد بها

```sh
nsenter
unshare
ip (including relevant subcommands)
capsh
/sys/fs/cgroups
/proc/[0-9]+/ns
/proc/[0-9]+/status
```

#### 352.1 الأوامر الهامة

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-352.1">back to sub topic 352.1</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.2"></a>

### 352.2 إل إكس سي

**وزن:**ط

**وصف:**يجب أن يكون المرشحون قادرين على استخدام حاويات النظام باستخدام LXC وLXD. إصدار LXC المغطى هو 3.0 أو أعلى.

**مجالات المعرفة الرئيسية:**

-   فهم بنية LXC وLXD
-   إدارة حاويات LXC بناءً على الصور الموجودة باستخدام LXD، بما في ذلك الشبكات والتخزين
-   قم بتكوين خصائص حاوية LXC
-   الحد من استخدام موارد حاوية LXC
-   استخدم ملفات تعريف LXD
-   فهم صور LXC
-   الوعي بأدوات LXC التقليدية

#### 352.2 الكائنات المذكورة

```sh
lxd
lxc (including relevant subcommands)
```

#### 352.2 الأوامر الهامة

##### foo

```sh
foo
```

<p align="right">(<a href="#topic-352.2">back to sub topic 352.2</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.3"></a>

### 352.3 عامل الميناء

**وزن:**ص

**وصف:**يجب أن يكون المرشح قادرًا على إدارة عقد Docker وحاويات Docker. يتضمن ذلك فهم بنية Docker بالإضافة إلى فهم كيفية تفاعل Docker مع نظام Linux الخاص بالعقدة.

**مجالات المعرفة الرئيسية:**

-   فهم بنية ومكونات Docker
-   إدارة حاويات Docker باستخدام الصور من سجل Docker
-   فهم وإدارة الصور ووحدات التخزين لحاويات Docker
-   فهم وإدارة التسجيل لحاويات Docker
-   فهم وإدارة الشبكات لـ Docker
-   استخدم Dockerfiles لإنشاء صور الحاوية
-   قم بتشغيل سجل Docker باستخدام صورة التسجيل Docker

#### 352.3 الكائنات المذكورة

```sh
dockerd
/etc/docker/daemon.json
/var/lib/docker/
docker
Dockerfile
```

#### 352.3 الأوامر الهامة

##### عامل ميناء

```sh
# Examples of docker
```

<p align="right">(<a href="#topic-352.3">back to sub topic 352.3</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-352.4"></a>

### 352.4 منصات تنسيق الحاويات

**وزن:**ع

**وصف:**يجب أن يفهم المرشحون أهمية تنسيق الحاويات والمفاهيم الأساسية التي يوفرها Docker Swarm وKubernetes لتنفيذ تنسيق الحاويات.

**مجالات المعرفة الرئيسية:**

-   فهم أهمية تنسيق الحاويات
-   فهم المفاهيم الأساسية لـ Docker Compose وDocker Swarm
-   فهم المفاهيم الأساسية لـ Kubernetes وHelm
-   الوعي بأنظمة OpenShift وRancher وMesosphere DC/OS

<p align="right">(<a href="#topic-352.4">back to sub topic 352.4</a>)</p>
<p align="right">(<a href="#topic-352">back to topic 352</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353"></a>

## الموضوع 353: نشر الأجهزة الافتراضية وتوفيرها

* * *

<a name="topic-353.1"></a>

### 353.1 أدوات إدارة السحابة

**وزن:**أ

**وصف:**يجب أن يفهم المرشحون العروض الشائعة في السحابة العامة وأن يكون لديهم معرفة بالميزات الأساسية لأدوات إدارة السحابة المتوفرة بشكل شائع.

**مجالات المعرفة الرئيسية:**

-   فهم العروض المشتركة في السحابة العامة
-   معرفة الميزات الأساسية لـ OpenStack
-   معرفة الميزات الأساسية لـ Terraform
-   الوعي بـ CloudStack و Eucalyptus و OpenNebula

#### 353.1 الكائنات المستشهد بها

```sh
IaaS, PaaS, SaaS
OpenStack
Terraform
```

#### 353.1 الأوامر الهامة

##### foo

```sh
# examples
```

<p align="right">(<a href="#topic-353.1">back to sub topic 353.1</a>)</p>
<p align="right">(<a href="#topic-353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.2"></a>

### 353.2 باكر

**وزن:**أ

**وصف:**يجب أن يكون المرشحون قادرين على استخدام Packer لإنشاء صور النظام. يتضمن ذلك تشغيل Packer في العديد من البيئات السحابية العامة والخاصة بالإضافة إلى إنشاء صور الحاويات لـ LXC/LXD.

**مجالات المعرفة الرئيسية:**

-   فهم وظائف وميزات Packer
-   إنشاء وصيانة ملفات القالب
-   أنشئ صورًا من ملفات القوالب باستخدام أدوات إنشاء مختلفة

#### 353.2 الكائنات المستشهد بها

```sh
packer
```

#### 353.2 الأوامر الهامة

##### باكر

```sh
# examples
```

<p align="right">(<a href="#topic-353.2">back to sub topic 353.2</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.3"></a>

### 353.3 سحابة البداية

**وزن:**ع

**وصف:**يجب أن يكون المرشحون قادرين على استخدام cloud-init لتكوين الأجهزة الافتراضية التي تم إنشاؤها من الصور القياسية. يتضمن ذلك ضبط الأجهزة الافتراضية لتتناسب مع موارد الأجهزة المتوفرة لديها، وتحديدًا مساحة القرص ووحدات التخزين.  
بالإضافة إلى ذلك، يجب أن يكون المرشحون قادرين على تكوين المثيلات للسماح بتسجيلات الدخول الآمنة إلى SSH وتثبيت مجموعة محددة من حزم البرامج.  
علاوة على ذلك، يجب أن يكون المرشحون قادرين على إنشاء صور نظام جديدة بدعم من cloud-init.

**مجالات المعرفة الرئيسية:**

-   فهم ميزات ومفاهيم cloud-init، بما في ذلك بيانات المستخدم، وتهيئة وتكوين cloud-init
-   استخدم cloud-init لإنشاء أنظمة الملفات وتغيير حجمها وتركيبها وتكوين حسابات المستخدمين، بما في ذلك بيانات اعتماد تسجيل الدخول مثل مفاتيح SSH وتثبيت حزم البرامج من مستودع التوزيع
-   دمج cloud-init في صور النظام
-   استخدم مصدر بيانات محرك التكوين للاختبار

#### 353.3 الكائنات المذكورة

```sh
cloud-init
user-data
/var/lib/cloud/
```

#### 353.3 الأوامر الهامة

##### foo

```sh
# examples
```

<p align="right">(<a href="#topic-353.3">back to sub topic 353.3</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

<a name="topic-353.4"></a>

### 353.4 المتشرد

**وزن:**ع

**وصف:**يجب أن يكون المرشح قادرًا على استخدام Vagrant لإدارة الأجهزة الافتراضية، بما في ذلك توفير الجهاز الظاهري.

**مجالات المعرفة الرئيسية:**

-   فهم بنية ومفاهيم Vagrant، بما في ذلك التخزين والشبكات
-   استرداد واستخدام الصناديق من أطلس
-   إنشاء وتشغيل Vagrantfiles
-   الوصول إلى الأجهزة الافتراضية Vagrant
-   مشاركة المجلد ومزامنته بين جهاز Vagrant الظاهري والنظام المضيف
-   فهم توفير Vagrant، أي مقدمي الملفات وShell
-   فهم إعداد الأجهزة المتعددة

#### 353.4 الكائنات المذكورة

```sh
vagrant
Vagrantfile
```

#### 353.4 الأوامر الهامة

##### المتشرد

```sh
# examples
```

<p align="right">(<a href="#topic-353.4">back to sub topic 353.4</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## المساهمة

المساهمات هي ما يجعل مجتمع المصادر المفتوحة مكانًا رائعًا للتفاعل معه
التعلم والإلهام والإبداع. أي مساهمات تقدمها هي**اقدر هذا جدا**.

إذا كان لديك اقتراح من شأنه أن يجعل هذا أفضل، يرجى شوكة الريبو و
إنشاء طلب سحب. يمكنك أيضًا ببساطة فتح مشكلة بالعلامة "التحسين".
لا تنس أن تعطي المشروع نجمة! شكرًا لك مرة أخرى!

1.  شوكة المشروع
2.  قم بإنشاء فرع الميزات الخاص بك (`git checkout -b feature/AmazingFeature`)
3.  تنفيذ التغييرات (`git commit -m 'Add some AmazingFeature'`)
4.  ادفع إلى الفرع (`git push origin feature/AmazingFeature`)
5.  افتح طلب السحب

* * *

## رخصة

-   تم ترخيص هذا المشروع بموجب ترخيص MIT \* راجع ملف LICENSE.md للحصول على التفاصيل

* * *

## اتصال

ماركوس سيلفستريني -[ماركوس.سيلفسترن@جميل.كوم](mailto:marcos.silvestrini@gmail.com)\\[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/mrsilvestrini.svg?style=social&label=Follow%20%40mrsilvestrini)](https://twitter.com/mrsilvestrini)

رابط المشروع:[هتبص://جذب.كوم/ماركسيلفصترن/ليارنينج-لبيس-٣-٣٠٥-٣٠٠](https://github.com/marcossilvestrini/learning-lpic-3-305-300)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

* * *

## شكر وتقدير

-   [ريتشارد ستالمان](http://www.stallman.org/)
-   [الأسئلة الشائعة حول جنو/لينكس بقلم ريتشارد ستالمان](https://www.gnu.org/gnu/gnu-linux-faq.html)
-   [جنو](https://www.gnu.org/)
-   [نظام التشغيل جنو](https://www.gnu.org/gnu/thegnuproject.html)
-   [مترجم دول مجلس التعاون الخليجي](https://gcc.gnu.org/wiki/History)
-   [جنو تر](https://www.gnu.org/software/tar/)
-   [صنع جنو](https://www.gnu.org/software/make/)
-   [جنو إيماكس](https://en.wikipedia.org/wiki/Emacs)
-   [حزم جنو](https://www.gnu.org/software/)
-   [مجموعة جنو/لينكس](https://directory.fsf.org/wiki/Collection:GNU/Linux)
-   [محمل الإقلاع GNU Grub](https://www.gnu.org/software/grub/)
-   [جنو هيرد](https://www.gnu.org/software/hurd/hurd/what_is_the_gnu_hurd.html)
-   [نواة](https://www.kernel.org/)
-   [صفحات Linux Kernel Man](https://www.kernel.org/doc/man-pages/)
-   [قاعدة لينكس القياسية](https://en.wikipedia.org/wiki/Linux_Standard_Base)
-   [معيار التسلسل الهرمي لنظام الملفات](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)
-   [هيكل التسلسل الهرمي للملف](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.pdf)
-   [إف إس إف](https://www.fsf.org)
-   [دليل البرمجيات الحرة](https://directory.fsf.org/wiki/Free_Software_Directory:Free_software_replacements)
-   [البرمجيات الحرة](https://www.gnu.org/philosophy/free-sw.html)
-   [الحقوق المتروكة](https://www.gnu.org/licenses/copyleft.en.html)
-   [جي بي إل](https://www.gnu.org/licenses/quick-guide-gplv3.html)
-   [رخصة جنو العمومية الصغرى](https://www.gnu.org/licenses/lgpl-3.0.html)
-   [بي إس دي](https://opensource.org/licenses/BSD-3-Clause)
-   [مبادرة المصدر المفتوح](https://opensource.org/)
-   [المشاع الإبداعي](https://creativecommons.org/)
-   [ترخيص LTS](https://en.wikipedia.org/wiki/Long-term_support)
-   [المبادئ التوجيهية للبرمجيات الحرة دبيان](https://www.debian.org/social_contract#guidelines)
-   [منظمة X11](https://www.x.org/wiki/)
-   [وايلاند](https://wayland.freedesktop.org/)
-   [جنو جنوم](https://www.gnu.org/press/gnome-1.0.html)
-   [جنوم](https://www.gnome.org/)
-   [XFCE](https://xfce.org/)
-   [كيدي بلازما](https://kde.org/plasma-desktop/)
-   [انسجام](https://en.wikipedia.org/wiki/Harmony_(toolkit))
-   [xRDP](https://bytexd.com/xrdp-centos/)
-   [نتب](https://www.ntppool.org/en/)
-   [بورن قذيفة ثانية](https://www.gnu.org/software/bash/manual/)
-   [كوخ](https://bash.cyberciti.biz/guide/Shebang)
-   [متغيرات البيئة](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)
-   [غنو جلوبينج](https://man7.org/linux/man-pages/man7/glob.7.html)
-   [الكرة](https://linuxhint.com/bash_globbing_tutorial/)
-   [نقلا عن](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
-   [التعبيرات العادية](https://www.gnu.org/software/grep/manual/html_node/Regular-Expressions.html)
-   [قائمة توزيعات لينكس](https://en.wikipedia.org/wiki/List_of_Linux_distributions)
-   [توزيعة](https://distrowatch.com/)
-   [مقارنة توزيعات لينكس](https://en.wikipedia.org/wiki/Comparison_of_Linux_distributions)
-   [تنزيل الحزم](https://pkgs.org/)
-   [تثبيت الحزم](https://installati.one/)
-   [دليل تثبيت الحزم](https://installati.one/)
-   [بوجزيلا](https://bugzilla.kernel.org/)
-   [القيادة لم يتم العثور](https://command-not-found.com/)
-   [توزيعة](https://distrotest.net/index.php)
-   [مولد باشرك](http://bashrcgenerator.com/)
-   [شرح](https://explainshell.com/)
-   [دروس فيم](https://www.openvim.com/)
-   [البرنامج التعليمي للبرمجة النصية لنظام التشغيل Linux Shell](https://bash.cyberciti.biz/guide/Main_Page)
-   [شارات جيثب](https://github.com/alexandresanlim/Badges4-README.md-Profile)
-   [أمثلة على الأوامر](https://www.geeksforgeeks.org/)
-   [تجميع النواة الخاصة بك](https://wiki.linuxquestions.org/wiki/How_to_build_and_install_your_own_Linux_kernel)
-   [ربط](https://www.isc.org/bind/)
-   [ربط التسجيل](https://www.zytrax.com/books/dns/ch7/logging.html)
-   [قائمة أنواع سجلات DNS](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
-   [قائمة أنواع سجلات DNS](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
-   [W3Techs](https://w3techs.com/)
-   [أباتشي](https://www.apache.org/)
-   [توجيهات أباتشي][def]
-   [رموز حالة HTTP](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
-   [شفرات قوية لـ Apache وnginx وLighttpd](https://cipherlist.eu/)
-   [دروس SSL](https://www.golinuxcloud.com/blog/)
-   [تكوين SSL موزيلا](https://ssl-config.mozilla.org/)
-   [LPIC-3 305-300 الأهداف](https://www.lpi.org/our-certifications/exam-305-objectives/)
-   [LPIC-3 305-300 ويكي](https://wiki.lpi.org/wiki/LPIC-305_Objectives_V3.0)
-   [LPIC-3 305-300 المواد التعليمية](https://cursos.linuxsemfronteiras.com.br/courses/preparatorio-para-certificacao-lpic-3-305/)
-   [LPIC-3 305-300 محاكاة الامتحان بواسطة ITexams](https://www.itexams.com/info/305-300)

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
