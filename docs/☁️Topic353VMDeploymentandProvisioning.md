# ☁️ Topic 353: VM Deployment and Provisioning

---

<a name="topic-353.1"></a>

### ☁️ 353.1  Cloud Management Tools

**Weight:** 2

**Description:** Candidates should understand common offerings in public clouds and have basic feature knowledge of commonly available cloud management tools.

**Key Knowledge Areas:**

* Understand common offerings in public clouds
* Basic feature knowledge of OpenStack
* Basic feature knowledge of Terraform
* Awareness of CloudStack, Eucalyptus and OpenNebula

#### 📋 353.1 Cited Objects

```sh
IaaS, PaaS, SaaS
OpenStack
Terraform
```

#### Cloud Definition

Cloud is a model for distributed computing that provides on-demand access to a shared pool of configurable computing resources (networks, servers, storage, applications, and services) via the internet, provisioned and released rapidly with minimal management effort. 

#### Cloud Computing Definition

Cloud Computing is the paradigm for delivering IT services through the internet, where computing resources are dynamically allocated based on demand. Instead of investing in local infrastructure, users and organizations access computing power, storage, and applications through subscription or pay-per-use models, with automatic scalability and centralized management.

>Cloud computing is the execution of workloads in clouds.

>Clouds are IT environments that abstract, aggregate, and share scalable resources across a network. 

>Cloud computing and clouds are not technologies in themselves. 

>Cloud computing is an action, the execution of a workload in a cloud. 

>Clouds are environments, locations where applications run. 

>Technologies are things, such as software programs and hardware equipment used to create and use clouds.

#### Types of cloud

##### Public Cloud

Public cloud refers to cloud computing services offered by third-party providers over the public internet, making them available to anyone who wants to use or purchase them. Examples include Amazon Web Services (AWS), Microsoft Azure, and Google Cloud Platform (GCP). 

##### Private Cloud
Private cloud is a cloud computing environment dedicated to a single organization, either hosted on-premises or by a third-party provider. It offers enhanced security, control, and customization compared to public clouds. 

##### Hybrid Cloud

Hybrid cloud combines public and private cloud environments, allowing data and applications to be shared between them. This approach provides greater flexibility, scalability, and cost-efficiency. 

##### Multi-Cloud

Multi-cloud refers to the use of multiple cloud computing services from different providers within a single architecture. This strategy helps avoid vendor lock-in, enhances redundancy, and allows organizations to leverage the best features of each cloud provider.

#### IaaS, PaaS, SaaS

##### IaaS (Infrastructure as a Service)

IaaS provides virtualized computing resources on demand (virtual machines, block and object storage, networking, GPUs). By 2026, IaaS has evolved to include AI-ready infrastructure, automated bare-metal provisioning, and native integration with observability, security, and real-time compliance solutions.

##### PaaS (Platform as a Service)

PaaS offers a managed platform for application development, deployment, and operation without managing underlying infrastructure. In 2026, PaaS includes serverless functions, managed databases, API gateways, native CI/CD, and event-driven and microservices architectures with automatic scaling.

##### SaaS (Software as a Service)

SaaS delivers software applications via web, accessible through browsers or native clients, with subscription-based models. In 2026, SaaS integrates artificial intelligence for automation and insights, provides extensible customization, open APIs for integration, and supports rigorous compliance with zero-trust security.

#### OpenStack

![openstack-lasndscape](/images/openstack-landscape.png)

OpenStack is an open-source cloud computing platform that provides IaaS capabilities for private and hybrid cloud environments. In 2026, OpenStack maintains its relevance in corporate datacenters and private cloud providers, offering a complete service stack (Nova for compute, Cinder for block storage, Swift for object storage, Neutron for networking) with advanced support for Kubernetes containers, automatic load balancing, and integration with enterprise-grade security and compliance solutions.

#### Apache CloudStack

Apache CloudStack is an open-source cloud computing software platform that provides IaaS capabilities for building and managing public and private clouds.

CloudStack continues to be a reliable choice for service providers and enterprises, offering features such as multi-tenancy, advanced networking (SDN), and support for various hypervisors (KVM, XenServer, VMware) with enhanced integration for container orchestration and edge computing.

#### Eucalyptus

Eucalyptus is an open-source cloud computing platform that provides IaaS capabilities for building and managing private and hybrid clouds. It is designed to be compatible with Amazon Web Services (AWS) APIs, allowing users to run applications on Eucalyptus that are already deployed on AWS.

#### OpenNebula

OpenNebula is an open-source cloud computing platform that provides IaaS capabilities for building and managing private, public, and hybrid clouds. It focuses on simplicity and flexibility, allowing users to deploy and manage virtualized data centers with support for various hypervisors (KVM, VMware) and container technologies (LXC, Docker). OpenNebula continues to evolve with features such as edge computing support, enhanced networking capabilities, and integration with modern DevOps tools.

#### IaC 

Infrastructure as Code (IaC) is the practice of managing and provisioning computing infrastructure through machine-readable definition files, rather than through physical hardware configuration or interactive configuration tools. IaC has become a fundamental practice in DevOps and cloud-native environments, enabling automated, consistent, and repeatable infrastructure deployment across multiple cloud providers and on-premises environments.

#### Terraform

Terraform is an open-source Infrastructure as Code (IaC) tool that enables infrastructure definition and provisioning in a declarative and versioned manner. By 2026, Terraform is the de facto standard for infrastructure management in multicloud environments (AWS, Azure, GCP, OpenStack, etc.), with robust support for distributed state, policy as code, reusable modules, and native integration with CI/CD pipelines, GitOps, and compliance automation.

##### Terraform Key Concepts

| Concept | Description |
| :--- | :--- |
| **Provider** | A plugin that enables interaction with cloud providers and services (e.g., AWS, Azure, GCP). |
| **Resource** | A component of your infrastructure (e.g., virtual machines, networks, storage). |
| **Module** | A container for multiple resources
| **State** | A snapshot of your infrastructure, stored in a file or remote backend, used to track resource changes. |
| **Plan** | A preview of changes that Terraform will make to your infrastructure. |
| **Apply** | The command that executes the changes defined in the plan to your infrastructure. |

##### Terraform Basic Workflow

1. **Write Configuration**: Define your infrastructure using HashiCorp Configuration Language (HCL) in `.tf` files.
2. **Initialize**: Run `terraform init` to initialize the working directory and download necessary provider plugins.
3. **Plan**: Execute `terraform plan` to create an execution plan, showing what actions Terraform will take to achieve the desired state.
4. **Apply**: Use `terraform apply` to apply the changes and create or modify resources in your infrastructure.
5. **Destroy**: Use `terraform destroy` to remove all resources managed by Terraform.

##### Terraform Example

```hcl
provider "aws" {
  region = "us-west-2"
  profile = "my-profile"
}
resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  tags = {
    Name = "MyWebServer"
  }
}
```

<p align="right">(<a href="#topic-353.1">back to sub topic 353.1</a>)</p>
<p align="right">(<a href="#topic-353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="topic-353.2"></a>

### 📦 353.2 Packer

**Weight:** 2

**Description:** Candidates should be able to use Packer to create system images. This includes running Packer in various public and private cloud environments as well as building container images for LXC/LXD.

**Key Knowledge Areas:**

* Understand the functionality and features of Packer
* Create and maintain template files
* Build images from template files using different builders

#### 📋 353.2 Cited Objects

```sh
packer
```

#### 🛠️ 353.2 Important Commands

##### 📦 packer

```sh
# examples
```

<p align="right">(<a href="#topic-353.2">back to sub topic 353.2</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="topic-353.3"></a>

### ☁️ 353.3 cloud-init

**Weight:** 3

**Description:** Candidates should able to use cloud-init to configure virtual machines created from standardized images. This includes adjusting virtual machines to match their available hardware resources, specifically, disk space and volumes.
Additionally, candidates should be able to configure instances to allow secure SSH logins and install a specific set of software packages.
Furthermore, candidates should be able to create new system images with cloud-init support.

**Key Knowledge Areas:**

* Understanding the features and concepts of cloud-init, including user-data, initializing and configuring cloud-init
* Use cloud-init to create, resize and mount file systems, configure user accounts, including login credentials such as SSH keys and install software packages from the distribution’s repository
* Integrate cloud-init into system images
* Use config drive datasource for testing

#### 📋 353.3 Cited Objects

```sh
cloud-init
user-data
/var/lib/cloud/
```

#### 🛠️ 353.3 Important Commands

##### 📝 cloud-init

```sh
# examples
```

<p align="right">(<a href="#topic-353.3">back to sub topic 353.3</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="topic-353.4"></a>

### 📦 353.4 Vagrant

**Weight:** 3

**Description:** Candidate should be able to use Vagrant to manage virtual machines, including provisioning of the virtual machine.

**Key Knowledge Areas:**

* Understand Vagrant architecture and concepts, including storage and networking
* Retrieve and use boxes from Atlas
* Create and run Vagrantfiles
* Access Vagrant virtual machines
* Share and synchronize folder between a Vagrant virtual machine and the host system
* Understand Vagrant provisioning, i.e. File and Shell provisioners
* Understand multi-machine setup

#### 📋 353.4 Cited Objects

```sh
vagrant
Vagrantfile
```

#### 🛠️ 353.4 Important Commands

##### 📦 vagrant

```sh
# examples
```

<p align="right">(<a href="#topic-353.4">back to sub topic 353.4</a>)</p>
<p align="right">(<a href="#topic 353">back to topic 353</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

