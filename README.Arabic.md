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

# تعلم LPIC-3 305-300

![LPIC3-305-300](images/lpic3-305-300.jpg)

<p align="center">
<strong>استكشاف الوثائق »</strong></a>
    <br />
    <a href="https://marcossilvestrini.github.io/learning-lpic-3-305-300/">موقع الويب</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300">صفحة الكود</a>
    -
    <a href="https://skynet-8.gitbook.io/learning-lpic-3-305-300">Gitbook</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">الإبلاغ عن خطأ</a>
    -
    <a href="https://github.com/marcossilvestrini/learning-lpic-3-305-300/issues">طلب ميزة</a>
</p>

---

## ملخص

<details>
  <summary><b>جدول المحتويات</b></summary>
  <ol>
    <li>
      <a href="#about-the-project">حول المشروع</a>
    </li>
    <li>
      <a href="#getting-started">البدء</a>
      <ul>
        <li><a href="#prerequisites">المتطلبات الأساسية</a></li>
        <li><a href="#installation">التثبيت</a></li>
      </ul>
    </li>
    <li><a href="#usage">الاستخدام</a></li>
    <li><a href="#roadmap">خريطة الطريق</a></li>
    <li><a href="#freedoms">أربع حريات أساسية</a></li>
    <li>
      <a href="#topic-351">الموضوع 351: الافتراضية الكاملة</a>
      <ul>
        <li><a href="#topic-351.1">351.1 مفاهيم ونظرية الافتراضية</a></li>
        <li><a href="#topic-351.2">351.2 زين</a></li>
        <li><a href="#topic-351.3">351.3 QEMU</a></li>
        <li><a href="#topic-351.4">351.4 إدارة الآلات الافتراضية باستخدام Libvirt</a></li>
        <li><a href="#topic-351.5">351.5 إدارة صور قرص الآلة الافتراضية</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-352">الموضوع 352: افتراضية الحاويات</a>
      <ul>
        <li><a href="#topic-352.1">352.1 مفاهيم افتراضية الحاويات</a></li>
        <li><a href="#topic-352.2">352.2 LXC</a></li>
        <li><a href="#topic-352.3">352.3 دوكر</a></li>
        <li><a href="#topic-352.4">352.4 منصات تنسيق الحاويات</a></li>
      </ul>
    </li>
    <li>
      <a href="#topic-353">الموضوع 353: نشر الآلات الافتراضية وتوفيرها</a>
      <ul>
        <li><a href="#topic-353.1">353.1 أدوات إدارة السحابة</a></li>
        <li><a href="#topic-353.2">353.2 باكر</a></li>
        <li><a href="#topic-353.3">353.3 cloud-init</a></li>
        <li><a href="#topic-353.4">353.4 Vagrant</a></li>
      </ul>
    </li>
    <li><a href="#license">الرخصة</a></li>
    <li><a href="#contact">الاتصال</a></li>
    <li><a href="#acknowledgments">الشكر والتقدير</a></li>
  </ol>
</details><br>

---

<a name="about-the-project"></a>

## حول المشروع

> يهدف هذا المشروع إلى مساعدة الطلاب أو المحترفين في تعلم المفاهيم الرئيسية لنظام GNULinux
> والبرمجيات الحرة
> سيتم تغطية بعض توزيعات GNULinux مثل Debian و RPM
> سيتم أيضًا تغطية تثبيت وتكوين بعض الحزم
> من خلال القيام بذلك يمكنك منح المجتمع بأسره فرصة للاستفادة من تغييراتك.
> الوصول إلى الشيفرة المصدرية هو شرط مسبق لذلك.
> استخدم Vagrant لتشغيل الآلات وتنفيذ المختبرات ومحتوى الممارسة في هذه المقالة.
> لقد نشرت في مجلد Vagrant ملف Vagrantfile بما هو ضروري
> لكي تقوم بتحميل بيئة للدراسات

---

<p align="right">(<a href="#readme-top">العودة إلى الأعلى</a>)</p>

<a name="getting-started"></a>

## البدء

للبدء في التعلم، انظر الوثائق أعلاه.

<a name="prerequisites"></a>

### المتطلبات الأساسية

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [VMware Workstation](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
* [Vagrant VMWare Utility](https://developer.hashicorp.com/vagrant/install/vmware)
* [Vagrant](https://developer.hashicorp.com/vagrant/install)

<a name="installation"></a>

### التثبيت

استنساخ المستودع

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

خصص قالب *Vagrantfile-topic-XXX*. يحتوي هذا الملف على تكوينات VMs للمختبرات. مثال:

* ملف [Vagrantfile-topic-351](vagrant/Vagrantfile-topic-351)
  * vm.clone_directory = "<your_driver_letter>:\\`<folder>`\\<to_machine>\\#{VM_NAME}-instance-1"
    مثال: vm.clone_directory = "E:\\Servers\\VMWare\\#{VM_NAME}-instance-1"
  * vm.vmx["memsize"] = ""
  * vm.vmx["numvcpus"] = ""
  * vm.vmx["cpuid.coresPerSocket"] = ""

خصص تكوين الشبكة في الملفات [configs/network](configs/network/).

---

<a name="usage"></a>

## الاستخدام

استخدم هذا المستودع للتعلم حول امتحان LPIC-3 305-300

### للتشغيل والإيقاف

قم بتبديل قالب *Vagrantfile-topic-xxx* وانسخه إلى ملف جديد باسم *Vagrantfile*

```sh
cd vagrant && vagrant up
cd vagrant && vagrant destroy -f
```

### لإعادة تشغيل VMs

```sh
cd vagrant && vagrant reload
```

**مهم:**
*إذا قمت بإعادة تشغيل VMs بدون Vagrant، فلن يتم تحميل المجلد المشترك بعد التمهيد.*

### استخدم PowerShell للتشغيل والإيقاف

إذا كنت تستخدم نظام Windows، فقد أنشأت برنامج نصي PowerShell للتشغيل والإيقاف VMs.

```powershell
vagrant/up.ps1
vagrant/destroy.ps1
```

### مخطط البنية التحتية للموضوع 351

![topic-351](images/infraestructure-topic-351.png)

<p align="right">(<a href="#readme-top">العودة إلى الأعلى</a>)</p>

---

<a name="roadmap"></a>

## خريطة الطريق

* [X] إنشاء مستودع
* [X] إنشاء نصوص لتوفير المختبرات
* [X] إنشاء أمثلة حول الموضوع 351
* [X] إنشاء أمثلة حول الموضوع 352
* [ ] إنشاء أمثلة حول الموضوع 353
* [ ] تحميل امتحان محاكي

---

<a name="freedoms"></a>

## أربع حريات أساسية

> 0. الحرية في تشغيل البرنامج كما تريد، لأي غرض (الحرية 0).
> 1. الحرية في دراسة كيفية عمل البرنامج، وتغييره بحيث يقوم
> بحساباتك كما تريد (الحرية 1).
> الوصول إلى الشيفرة المصدرية هو شرط مسبق لذلك.
> 2. الحرية في إعادة توزيع النسخ حتى تتمكن من مساعدة الآخرين (الحرية 2).
> 3. الحرية في توزيع نسخ من إصداراتك المعدلة للآخرين (الحرية 3).

---

## أوامر الفحص

```sh
type COMMAND
apropos COMMAND
whatis COMMAND --long
whereis COMMAND
COMMAND --help, --h
man COMMAND
```

<p align="right">(<a href="#readme-top">العودة إلى الأعلى</a>)</p>

---

<a name="topic-351"></a>

## الموضوع 351: الافتراضية الكاملة

![LPIC3-305-300](images/virtualization-351.png)

---

<a name="topic-351.1"></a>

### 351.1 مفاهيم ونظرية الافتراضية

**الوزن:** 6

**الوصف:** يجب أن يعرف المرشحون ويفهموا المفاهيم العامة والنظرية والمصطلحات المتعلقة بالافتراضية. يشمل ذلك مصطلحات Xen و QEMU و libvirt.

**المجالات المعرفية الرئيسية:**

* 🖥️ فهم مصطلحات الافتراضية
* ⚖️ فهم الإيجابيات والسلبيات المتعلقة بالافتراضية
* 🛠️ فهم الاختلافات المختلفة بين Hypervisors ومراقبي الآلات الافتراضية
* 🔄 فهم الجوانب الرئيسية لنقل الآلات الفيزيائية إلى الآلات الافتراضية
* 🚀 فهم الجوانب الرئيسية لنقل الآلات الافتراضية بين أنظمة المضيف
* 📸 فهم الميزات والآثار المترتبة على الافتراضية لآلة افتراضية، مثل التقاط الصور، والإيقاف المؤقت، والاستنساخ، وحدود الموارد
* 🌐 الوعي بـ oVirt و Proxmox و systemd-machined و VirtualBox
* 🔗 الوعي بـ Open vSwitch

#### 351.1 الكائنات المذكورة

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

##### Hypervisor من النوع 1 (Hypervisor Bare-Metal)

###### تعريف النوع 1

يعمل مباشرة على الأجهزة الفيزيائية للمضيف، مما يوفر طبقة أساسية لإدارة VMs دون الحاجة إلى نظام تشغيل مضيف.

###### خصائص النوع 1

* ⚡ أداء وكفاءة عالية.
* ⏱️ زمن استجابة أقل وعبء أقل.
* 🏢 غالبًا ما يستخدم في بيئات المؤسسات ومراكز البيانات.

###### أمثلة على النوع 1

* VMware ESXi: Hypervisor قوي ومستخدم على نطاق واسع في بيئات المؤسسات.
* Microsoft Hyper-V: مدمج مع Windows Server، يقدم أداء قوي وميزات إدارة.
* Xen: Hypervisor مفتوح المصدر يستخدمه العديد من مزودي خدمات السحابة.
* KVM (آلة افتراضية قائمة على النواة): مدمج في نواة Linux، يوفر أداءً عاليًا للأنظمة القائمة على Linux.

##### Hypervisor من النوع 2 (Hypervisor Hosted)

###### تعريف النوع 2

يعمل فوق نظام تشغيل تقليدي، معتمدًا على نظام التشغيل المضيف لإدارة الموارد ودعم الأجهزة.

###### خصائص النوع 2

* 🛠️ أسهل في الإعداد والاستخدام، خاصة على أجهزة الكمبيوتر الشخصية.
* 🔧 أكثر مرونة للتطوير والاختبار والنشر على نطاق صغير.
* 🐢 عادةً ما يكون أقل كفاءة من Hypervisors من النوع 1 بسبب العبء الإضافي من نظام التشغيل المضيف.

###### أمثلة على النوع 2

* VMware Workstation: Hypervisor قوي لتشغيل أنظمة تشغيل متعددة على سطح مكتب واحد.
* Oracle VirtualBox: Hypervisor مفتوح المصدر معروف بمرونته وسهولة استخدامه.
* Parallels Desktop: مصمم لمستخدمي Mac لتشغيل Windows وأنظمة تشغيل أخرى بجانب macOS.
* QEMU (محاكي سريع): محاكي ومجسم مفتوح المصدر، غالبًا ما يستخدم بالاشتراك مع KVM.

##### الاختلافات الرئيسية بين Hypervisors من النوع 1 و 2

* بيئة النشر:
  * يتم نشر Hypervisors من النوع 1 عادةً في مراكز البيانات وبيئات المؤسسات بسبب تفاعلها المباشر مع الأجهزة وأدائها العالي.
  * Hypervisors من النوع 2 أكثر ملاءمة للاستخدام الشخصي، والتطوير، والاختبار، ومهام الافتراضية على نطاق صغير.
* الأداء:
  * تقدم Hypervisors من النوع 1 عمومًا أداءً أفضل وزمن استجابة أقل لأنها لا تعتمد على نظام تشغيل مضيف.
  * قد تعاني Hypervisors من النوع 2 من بعض تدهور الأداء بسبب العبء الناتج عن التشغيل فوق نظام تشغيل مضيف.
* الإدارة وسهولة الاستخدام:
  * تتطلب Hypervisors من النوع 1 إعدادًا وإدارة أكثر تعقيدًا ولكنها توفر ميزات متقدمة وقابلية التوسع للنشر على نطاق واسع.
  * من الأسهل تثبيت واستخدام Hypervisors من النوع 2، مما يجعلها مثالية للمستخدمين الأفراد والمشاريع الصغيرة.

##### أنواع النقل

في سياق Hypervisors، التي هي تقنيات تستخدم لإنشاء وإدارة الآلات الافتراضية، فإن مصطلحي نقل P2V و V2V شائعان في بيئات الافتراضية.
تشير إلى عمليات نقل الأنظمة بين أنواع مختلفة من المنصات.

##### P2V - النقل من الفيزيائي إلى الافتراضي

يشير النقل P2V إلى عملية نقل خادم فيزيائي إلى آلة افتراضية. بمعنى آخر، يتم "تحويل" نظام تشغيل وتطبيقاته، التي تعمل على أجهزة فيزيائية مخصصة، ونقلها إلى آلة افتراضية تعمل على Hypervisor (مثل VMware، Hyper-V، KVM، إلخ).

* مثال: لديك خادم فيزيائي يعمل بنظام Windows أو Linux، وترغب في نقله إلى بيئة افتراضية، مثل بنية تحتية سحابية أو خادم افتراضي داخلي.
  تتضمن العملية نسخ الحالة الكاملة للنظام، بما في ذلك نظام التشغيل، وبرامج التشغيل، والبيانات، لإنشاء آلة افتراضية مكافئة يمكن أن تعمل كما لو كانت على الأجهزة الفيزيائية.

##### V2V  - النقل من الافتراضي إلى الافتراضي

يشير النقل V2V إلى عملية نقل آلة افتراضية من Hypervisor إلى آخر. في هذه الحالة، لديك بالفعل آلة افتراضية تعمل في بيئة افتراضية (مثل VMware)، وترغب في نقلها إلى بيئة افتراضية أخرى (على سبيل المثال، إلى Hyper-V أو إلى خادم VMware جديد).

* مثال: لديك آلة افتراضية تعمل على خادم افتراضي VMware، ولكنك تقرر نقلها إلى منصة Hyper-V. في هذه الحالة، يقوم النقل V2V بتحويل الآلة الافتراضية من تنسيق أو Hypervisor إلى آخر، مما يضمن أنها يمكن أن تستمر في العمل بشكل صحيح.

#### HVM و Paravirtualization

##### الافتراضية المدعومة بالعتاد (HVM)

###### تعريف HVM

تستفيد HVM من امتدادات الأجهزة التي توفرها وحدات المعالجة المركزية الحديثة لافتراضية الأجهزة، مما يمكّن من إنشاء وإدارة VMs مع الحد الأدنى من عبء الأداء.

###### الخصائص الرئيسية لـ HVM

* 🖥️ **دعم الأجهزة**: يتطلب دعم وحدة المعالجة المركزية لامتدادات الافتراضية مثل Intel VT-x أو AMD-V.
* 🛠️ **افتراضية كاملة:** يمكن أن تعمل VMs أنظمة تشغيل ضيف غير معدلة، حيث يوفر Hypervisor محاكاة كاملة لبيئة الأجهزة.
* ⚡ **الأداء:** يقدم عادةً أداءً قريبًا من الأداء الأصلي بسبب التنفيذ المباشر لشف