# HVM Domain Ubuntu Server

## Create Domain

```sh
# create a domain
sudo xl create configs/xen/hvm/ubuntu/lpic3-hvm-guest-ubuntu.cfg

# observe the installation
sudo xl console <domain_id>

# after create, domain has power off...recreate it for use
sudo xl create configs/xen/hvm/ubuntu/lpic3-hvm-guest-ubuntu.cfg

# access domain
sudo xl console <domain_id>
# press enter if freezing display
```

## Cloud Init Docs

[Ubuntu Autoinstall Docs](https://docs.cloud-init.io/en/latest/reference/examples_library.html)

[User data Docs](https://docs.cloud-init.io/en/latest/reference/modules.html)