# CENTOS

![Centos](https://user-images.githubusercontent.com/62715900/96582746-2047ff00-12b2-11eb-82e4-bd121ae654e1.png)

The CentOS Linux distribution is a stable, predictable, manageable and reproducible platform derived from the sources of Red Hat Enterprise Linux (RHEL). We are now looking to expand on that by creating the resources needed by other communities to come together and be able to build on the CentOS Linux platform. And today we start the process by delivering a clear governance model, increased transparency and access. In the coming weeks we aim to publish our own roadmap that includes variants of the core CentOS Linux.

## Authors

Marcos Silvestrini\
marcos.silvestrini@gmail.com

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## References

- [CentOS Docs](https://wiki.centos.org/)
- [Apache Configure Virtual Host](https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-centos-7)
- [Samba](https://linuxize.com/post/how-to-install-and-configure-samba-on-centos-7/)
- [Samba Configuration File](https://www.samba.org/samba/docs/current/man-html/smb.conf.5.html)

## Base

- RHEL

## Licenses

- GLP
- LTS

## Package Manager

- [RPM](https://rpm.org/)
- [Yum](https://man7.org/linux/man-pages/man8/yum.8.html)
- [DNF](https://dnf.readthedocs.io/en/latest/)

## Default Languages \ Compilers

- shell
- gcc
- perl
- python

## RPM Examples

### RPM List all packages

```sh
rpm --query --all
rpm -q -a
```

### RPM Install package

`sudo rpm -i package_name`

### RPM Erase package

`sudo rpm -e package_name`

## YUM Examples

### YUM List all packages

`yum search package_name`

### YUM Install package

`sudo yum install package_name`

### YUM Erase package

`sudo rpm -e package_name`

## Http server

### [Apache httpd](http://httpd.apache.org/docs/2.4/)

#### Install Latest Version Apache

```sh
sudo yum install httpd -y
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --permanent --list-all
sudo firewall-cmd --reload
```

#### Common Commands Apache

```sh
systemctl status httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl stop httpd
sudo systemctl reload httpd
```

#### Files and Directories Apache

##### Content Apache

`/var/www/html`: This directory holds the web content of your site, and is its default root. You can modify Apache’s default configuration settings to point to other directories within var/www.

##### Server Configuration Apache

`/etc/httpd`: The configuration directory in Apache, home to all of its configuration files.\
`/etc/httpd/conf/httpd.conf`: Apache’s primary configuration file, which stores its global configuration settings. Other files in the configuration directory are loaded from this file. It also stores the FollowSymLinks directives, which control configuration enabling and disabling.\
`/etc/httpd/sites-available/`: This directory holds virtual host configuration files, which are enabled through links to the sites-enabled directory. Modification to server block files happens in this directory, and is enabled through the a2ensite command.\
`/etc/httpd/sites-enabled/`: Activated virtual host configuration files are stored here. When Apache starts or reloads, it reads the configuration files and links in this directory as it complies a full configuration.\
`/etc/httpd/conf-available` and `/etc/httpd/conf-enabled`: In the same relationship as sites-available and sites-enabled, these directories house configuration fragments that are unattached to virtual host configuration files.\
`/etc/httpd/mods-available` and `/etc/httpd/mods-enabled`: Containing modules that are available and enabled, these directories have two components: files ending in .load, which contain fragments that load particular modules, and files ending in .conf, which store the configurations of these modules.

##### Server Logs Apache

`/var/log/httpd/access_log`: This file contains every request to the web server unless Apache’s
configuration settings have been modified.\
`/var/log/httpd/error_log`: This file contains errors. To modify the amount of detail in the error logs, modify the LogLevel directive in `/etc/httpd/conf/httpd.conf.`

### [Nginx](https://nginx.org/en/docs/)

#### Enable Epel repo

`sudo yum install epel-release -y`

#### Install Latest Version Nginx

```sh
sudo  yum install nginx -y
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --list-all
sudo firewall-cmd --reload
```

#### Common Commands Nginx

```sh
systemctl status nginx
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl enable nginx
sudo systemctl disable nginx
sudo systemctl reload nginx
```

#### Files and Directories Nginx

##### Content Nginx

`/usr/share/nginx/html`:The actual web content, which by default only consists of the default Nginx page you saw earlier, is served out of the /usr/share/nginx/html directory. This can be changed by altering Nginx configuration files.

##### Server Configuration Nginx

`/etc/nginx`: The Nginx configuration directory. All of the Nginx configuration files reside here.\
`/etc/nginx/nginx.conf`: The main Nginx configuration file. This can be modified to make changes to the Nginx global configuration.\
`/etc/nginx/conf.d/`: This directory contains server block configuration files, where you can define the websites that are hosted within Nginx. A typical approach is to have each website in a separate file that is named after the website’s domain name, such as your_domain.conf.

##### Server Logs Nginx

`/var/log/nginx/access.log`: Every request to your web server is recorded in this log file unless Nginx is configured to do otherwise.\
`/var/log/nginx/error.log`: Any Nginx errors will be recorded in this log.

## SGBD

### [MySQL](https://dev.mysql.com/doc/)

#### Install Latest Version Mysql

Get version in: *https://dev.mysql.com/downloads/repo/yum/* \
Example: mysql80-community-release-el7-3.noarch.rpm\

```sh
sudo yum update
cd /tmp/
mysql_version=mysql80-community-release-el7-3.noarch.rpm
url=https://dev.mysql.com/get/$mysql_version
wget $url
md5sum $mysql_version
sudo rpm -ivh $mysql_version
sudo yum install mysql-server -y
```

### Install Tools Mysql

`sudo yum install mysql-workbench -y`\
`mysql-workbench`

#### View Temporary password

`sudo grep 'temporary password' /var/log/mysqld.log`

#### Access Mysql

`mysql -h localhost -u root -p`

#### Configure Mysql

`sudo mysql_secure_installation`

### [MariaDB](https://mariadb.com/kb/en/documentation/)

#### Install Latest Version MariaDB

```sh
sudo yum update
sudo yum install mariadb-server -y
sudo mysql_secure_installation
```

#### Common Comands MariaDB

```sh
sudo mysqladmin version
sudo systemctl status mariadb.service
sudo systemctl start mariadb.service
sudo systemctl stop mariadb.service
sudo systemctl enable mariadb
```

#### Reset password MariaDB

```sh
mysql -u root
use mysql;
update user SET PASSWORD=PASSWORD("batman2") WHERE USER='root';
flush privileges;
exit
sudo systemctl start mariadb
```

#### Create a New MariaDB User and Database

```sh
mysql -h localhost -u root -p
create database testdb;
create user 'testuser'@localhost identified by 'password';
grant all on testdb.* to 'testuser' identified by 'password';
```

#### Create New Table MariaDB

```sh
`mysql -u testuser -p
`create table customers (customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, first_name TEXT, last_name TEXT);
`show tables;
```

### [PostgreSQL](https://www.postgresql.org/docs/)

#### Instal Latest Version PostgreSQL

>Postgres can be installed using default CentOS repositories. But as of the writing of this tutorial, the version that is available in the CentOS 7 Base repository is obsolete. Therefore, this tutorial will use the official Postgres repository

```sh
sudo vi /etc/yum.repos.d/CentOS-Base.repo
sudo yum install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm -y
yum list postgresql*
sudo yum install postgresql11-server -y
```

#### Common comands PostgreSQL

```sh
sudo systemctl status postgresql-11.servic
sudo systemctl start postgresql-11.service
sudo systemctl stop postgresql-11.service
sudo systemctl enable postgresql-11.service
```

#### View Version with SQL

```sh
sudo -u postgres psql
SELECT version();
```

## Filesystem

### [NFS](http://nfs.sourceforge.net/)

#### Install NFS

`yum install nfs-utils -y`

#### Common Commands NFS

```sh
sudo systemctl enable rpcbind
sudo systemctl enable nfs-server
sudo systemctl enable nfs-lock
sudo systemctl enable nfs-idmap
sudo systemctl start rpcbind
sudo systemctl start nfs-server
sudo systemctl start nfs-lock
sudo systemctl start nfs-idma
```

#### Configure NFS

```sh
sudo mkdir /mnt/files
sudo chown vagrant:vagrant -R /mnt/files
sudo vim /etc/exports
/mnt/files *(rw,async,no_subtree_check,no_root_squash)
sudo exportfs -a
sudo systemctl restart nfs-server
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload
```

#### Mount (Client) NFS

```sh
sudo mkdir /mnt/local_files
sudo chown vagrant:vagrant -R /mnt/local_files
sudo yum install nfs-utils -y
mount -t nfs 192.168.0.134:/mnt/files /mnt/local_files
```
#### Mount NFS with /etc/fstab

```sh
192.168.0.134:/mnt/files /mnt/local_files nfs rsize=8192,wsize=8192,timeo=14,intr
192.168.0.134:/mnt/files    /mnt/files   nfs defaults 0 0
```

## [Samba](https://www.samba.org/samba/docs/)

### Install Samba

`sudo yum install samba samba-client`

### Commom Comands Samba

```sh
sudo systemctl start smb.service
sudo systemctl start nmb.service
sudo systemctl enable smb.service
sudo systemctl enable nmb.service
```

### Configure Firewall

```sh
firewall-cmd --permanent --zone=public --add-service=samba
firewall-cmd --zone=public --add-service=samba
```

### Creating Samba Users and Directory Structure

**Create samba share directory**

`sudo mkdir /samba`

**Create a new group named sambashare. Later we will add all Samba users to this group.**

```sh
sudo groupadd sambashare
sudo chgrp sambashare /samba
```

**Creating Samba Users**

>Samba uses Linux users and group permission system but it has its own authentication mechanism separate from the standard Linux authentication.\
We will create the users using the standard Linux useradd tool and then set the user password with the smbpasswd utility.

To create a new user named josh, use the following command:\
`sudo useradd -M -d /samba/josh -s /usr/sbin/nologin -G sambashare josh`
>The useradd options have the following meanings:\
-M -do not create the user’s home directory. We’ll manually create this directory.\
-d /samba/josh - set the user’s home directory to /samba/josh.\
-s /usr/sbin/nologin - disable shell access for this user.\
-G sambashare - add the user to the sambashare group.

**Create the user’s home directory and set the directory ownership to user josh and group sambashare:**

```sh
sudo mkdir /samba/josh
sudo chown josh:sambashare /samba/josh
sudo chmod 2770 /samba/josh
sudo chcon -t samba_share_t /samba/josh
```

>The following command will add the setgid bit to the /samba/josh directory so the newly created files in this directory will inherit the group of the parent directory.\
This way, no matter which user creates a new file, the file will have group-owner of sambashare.\
For example, if you don’t set the directory’s permissions to 2770 and the sadmin user creates a new file the user josh will not be able to read/write to this file.

**Add the josh user account to the Samba database by setting the user password:**\
`sudo smbpasswd -a josh`

>Next, let’s create a user and group sadmin. All members of this group will have administrative permissions.
Later if you want to grant administrative permissions to another user simply add that user to the sadmin group.

**Create the administrative user by typing:**

`sudo useradd -M -d /samba/users -s /usr/sbin/nologin -G sambashare sadmin`

**Set a password and enable the user:**

```sh
sudo smbpasswd -a sadmin
sudo smbpasswd -e sadmin
```

**Next, create the Users share directory:**

`sudo mkdir /samba/users`

**Set the directory ownership to user sadmin and group sambashare:**

`sudo chown sadmin:sambashare /samba/users`

>This directory will be accessible by all authenticated users.
The following command configures write/read access to members of the sambashare group in the /samba/users directory:

```sh
sudo chmod 2770 /samba/users
sudo chcon -t samba_share_t /samba/users
```

### Configuring Samba Shares

In windows station, execute this command:

```powershell
net config workstation
```

View this line:\
`Workstation domain                   WORKGROUP`

Open the Samba configuration file and append the sections:

```linux
sudo vi /etc/samba/smb.conf
[global]
        workgroup = WORKGROUP
        security = user

        passdb backend = tdbsam

        printing = cups
        printcap name = cups
        load printers = yes
        cups options = raw

[users]
        path = /samba/users
        browseable = yes
        read only = no
        force create mode = 0660
        force directory mode = 2770
        valid users = @sambashare @sadmin

[josh]
        path = /samba/josh
        browseable = no
        read only = no
        force create mode = 0660
        force directory mode = 2770
        valid users = josh @sadmin
```

**The options have the following meanings:**

- [users] and [josh] - The names of the shares that you will use when logging in.\
- path - The path to the share.\
- browseable - Whether the share should be listed in the available shares list. By setting to no other users will not be able to see the share.\
- read only - Whether the users specified in the valid users list are able to write to this share.\
- force create mode - Sets the permissions for the newly created files in this share.\
- force directory mode - Sets the permissions for the newly created directories in this share.\
- valid users - A list of users and groups that are allowed to access the share. Groups are prefixed with the @ symbol.

**Restart SMB Services**

```sh
sudo systemctl restart smb.service
sudo systemctl restart nmb.service
```

### Connecting to a Samba Share from Linux

**To install smbclient on CentOS and Fedora run:**

`sudo yum install samba-client`

**The syntax to access a Samba share is as follows:**

```sh
mbclient //samba_hostname_or_server_ip/share_name -U username
smbclient //192.168.121.118/josh -U josh
```

### Mounting the Samba share

>To mount a Samba share on Linux first you need to install the cifs-utils package

```linux
sudo yum install cifs-utils
sudo mkdir /mnt/smbmount
sudo mount -t cifs -o username=username //samba_hostname_or_server_ip/sharename /mnt/smbmount
```

Example: sudo mount -t cifs -o username=josh //192.168.121.118/josh /mnt/smbmount

### Connecting to a Samba Share from Windows

\\samba_hostname_or_server_ip\sharename \

**Mount Windows Share in /etc/fstab**
//server_windows_or_ip/share /mnt/share -win cifs username=my_username,password=my_password,user,dir_mode=0777,file_mode=0777 0 0 init 6
