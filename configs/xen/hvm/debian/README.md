# HVM Domain Debian Server

## Create Domain

```sh
# up http server for pass presedd  in instalation
cd configs/xen/hvm/debian
python3 -m http.server 8000

# create a domain
xl create configs/xen/hvm/debian/lpic3-hvm-guest-debian.cfg

# observe the installation
xl console <domain_id> # or open a client vnc connection

# pass auto instalation(select advanced settings, automated installation)
preseed/file=/cdrom/preseed.cfg

# after create, domain has power off...recreate it for use
xl create configs/xen/hvm/ubuntu/lpic3-hvm-guest-ubuntu.cfg

# access domain
xl console <domain_id>
# press enter if freezing display
```

## Pressed doc

[Ubuntu Autoinstall Docs](<https://docs.cloud-init.io/en/latest/reference/examples_library.html>)

[User data Docs](https://docs.cloud-init.io/en/latest/reference/modules.html)