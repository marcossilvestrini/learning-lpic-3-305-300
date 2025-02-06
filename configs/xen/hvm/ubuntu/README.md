# HVM Domain Ubuntu Server

## Create Domain

```sh
# create a domain
xl create /etc/xen/lpic3-hvm-guest-ubuntu.cfg

# after create, domain has power off...recreate it for use
xl create /etc/xen/lpic3-hvm-guest-ubuntu.cfg

# access domain
xl console lpic3-hvm-guest-ubuntu
# press enter if freezing display
```

## Cloud Init Docs

[Ubuntu Autoinstall Docs](<https://docs.cloud-init.io/en/latest/reference/examples_library.html>)

[User data Docs](https://docs.cloud-init.io/en/latest/reference/modules.html)