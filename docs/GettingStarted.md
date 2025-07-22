# Getting Started

For starting the learning, see the documentation above.

`<a name="prerequisites"></a>`

### Prerequisites

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [VMware Workstation](https://blogs.vmware.com/workstation/2024/05/vmware-workstation-pro-now-available-free-for-personal-use.html)
* [Vagrant VMWare Utility](https://developer.hashicorp.com/vagrant/install/vmware)
* [Vagrant](https://developer.hashicorp.com/vagrant/install)

`<a name="installation"></a>`

### Installation

Clone the repo

```sh
git clone https://github.com/marcossilvestrini/learning-lpic-3-305-300.git
cd learning-lpic-3-305-300
```

Customize a template *Vagrantfile-topic-XXX*. This file contains a vms configuration for labs. Example:

* File [Vagrantfile-topic-351](../vagrant/Vagrantfile-topic-351)
  * vm.clone_directory = "<your_driver_letter>:\\`<folder>`\\<to_machine>\\#{VM_NAME}-instance-1"
    Example: vm.clone_directory = "E:\\Servers\\VMWare\\#{VM_NAME}-instance-1"
  * vm.vmx["memsize"] = ""
  * vm.vmx["numvcpus"] = ""
  * vm.vmx["cpuid.coresPerSocket"] = ""

Customize network configuration in files [configs/network](../configs/network/).

---

`<a name="usage"></a>`

