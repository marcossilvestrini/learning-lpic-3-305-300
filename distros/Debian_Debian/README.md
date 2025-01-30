# DEBIAN

![Debian](https://user-images.githubusercontent.com/62715900/130154504-f6946dc1-fef9-4d22-9370-64cf3195c20c.jpg)

The Debian Project is an association of individuals who have made common cause to create a free operating system. This operating system is called Debian. Debian systems currently use the Linux kernel. Linux is a completely free piece of software started by Linus Torvalds and supported by thousands of programmers worldwide. Of course, the thing that people want is application software: programs to help them get what they want to do done, from editing documents to running a business to playing games to writing more software. Debian comes with over 50,000 packages (precompiled software that is bundled up in a nice format for easy installation on your machine) - all of it free. It's a bit like a tower. At the base is the kernel. On top of that are all the basic tools. Next is all the software that you run on the computer. At the top of the tower is Debian -- carefully organizing and fitting everything so it all works together.

## Authors

Marcos Silvestrini\
marcos.silvestrini@gmail.com

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## References

- [Debian Docs](https://www.debian.org/doc/)
- [Handbook](https://debian-handbook.info/browse/stable/)

## Licenses

- GLP

## Default Languages

- shell
- gcc
- perl
- python

## Packages Manager

- [dpkg](https://linux.die.net/man/1/dpkg)
- [apt](https://linux.die.net/man/8/apt)
- [Snap](https://en.wikipedia.org/wiki/Snap_(package_manager))
- [flatpak](https://flatpak.org/)

## DPKG Examples

### List all packages

`dpkg-query -l`

### Install package

`dpkg -i package_name`

### Remove package

`dpkg -r package_name`
`dpkg -P package_name`

## [APT](https://www.digitalocean.com/community/tutorials/how-to-manage-packages-in-ubuntu-and-debian-with-apt-get-apt-cache)

### File with List of Apt Repositorys

/etc/apt/sources.list

### How To Update the Package Database with Apt-Get

`sudo apt-get update`

### How to Update Specific Installed Package with Apt-Get

`sudo apt-get install --only-upgrade package1`

### How to Upgrade Installed Packages with Apt-Get

`sudo apt-get upgrade`

>For a more complete upgrade, you can use the "dist-upgrade" argument, which attempts intelligent dependency resolution for new packages and will upgrade essential programs at the expense of less important ones

`sudo apt-get dist-upgrade`

### How to Install New Packages with Apt-Get

`sudo apt-get install package1 package2 package3`

### How to Delete a Package with Apt-Get

`sudo apt-get remove package_name`

>This command removes the package, but keeps the configuration files in case you install the package again later. This way, your settings will remain intact, even though the program is not installed.
If this is not the desired outcome, and you would like to clean out the configuration files as well as the program, use the following syntax:

`sudo apt-get purge package_name`

>To remove any packages that were installed automatically to support another program, that are no longer needed, type the following command:

`sudo apt-get autoremove`

>You can also specify a package name after the "autoremove" command to uninstall a package and its dependencies

### Common Apt-Get Option Flags

**To do a "dry run" of a procedure in order to get an idea of what an action will do, you can pass the "-s" flag for "simulate":**\
`sudo apt-get install -s htop`

**If you do not want to be prompted to confirm your choices, you can also pass the "-y" flag to automatically assume "yes" to questions.**\
`sudo apt-get remove -y htop`

**If you would like to download a package, but not install it, you can issue the following command:**\
`sudo apt-get install -d packagename`\
The files will be located in "/var/cache/apt/archives".

**If you would like to suppress output, you can pass the "-qq" flag to the command:**\
`sudo apt-get remove -qq packagename`

### How to Find a Package with Apt-Cache

>While "apt-get" is used to upgrade, install, and remove packages, "apt-cache" is used to query the package database for package information.

**You can use the following command to search for a package that suits your needs. Note that apt-cache doesn't usually require administrative privileges:**\
`apt-cache search what_you_are_looking_for`\
`apt-cache search mp3 convert`]\
`apt-cache search mail thunderbird`

### How to View Package Information with Apt-Cache

**To view information about a package, including an extended description, use the following syntax:**\
`apt-cache show package_name`\
`apt-cache show vim | grep Depends`\
*This will also provide the size of the download and the dependencies needed for the package.*

**To see if a package is installed and to check which repository it belongs to, we can issue:**\
`apt-cache policy package_name`

## Http server

### [Apache httpd](https://ubuntu.com/server/docs/web-servers-apache)

#### Install Latest Version Apache

`sudo  apt install apache2 -y`

#### Common Commands Apache

`systemctl status apache2`\
`sudo systemctl start apache2`\
`sudo systemctl stop apache2`\
`sudo systemctl enable apache2`

### How To Set Up Apache Virtual Hosts on Ubuntu

#### Create the Directory Structure

```linux
sudo mkdir -p /var/www/example.com/public_html
sudo mkdir -p /var/www/test.com/public_html
```

#### Grant Permissions

```linux
sudo chown -R $USER:$USER /var/www/example.com/public_html
sudo chown -R $USER:$USER /var/www/test.com/public_html
sudo chmod -R 755 /var/www
```

#### Create Demo Pages for Each Virtual Host

```linux
vi /var/www/example.com/public_html/index.html
```

```html
<html>
  <head>
    <title>Welcome to Example.com!</title>
  </head>
  <body>
    <h1>Success!  The example.com virtual host is working!</h1>
  </body>
</html>
```

```linux
cp /var/www/example.com/public_html/index.html /var/www/test.com/public_html/index.html
vi /var/www/test.com/public_html/index.html
```

```html
<html>
  <head>
    <title>Welcome to Test.com!</title>
  </head>
  <body>
    <h1>Success!  The test.com virtual host is working!</h1>
  </body>
</html>
```

#### Create New Virtual Host Files

##### Create the First Virtual Host File

```linux
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/example.com.conf
sudo vi /etc/apache2/sites-available/example.com.conf

<VirtualHost *:80>
    ServerAdmin admin@example.com
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/example.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

##### Copy First Virtual Host and Customize for Second Domain

```linux
sudo cp /etc/apache2/sites-available/example.com.conf /etc/apache2/sites-available/test.com.conf
sudo vi /etc/apache2/sites-available/test.com.conf

<VirtualHost *:80>
    ServerAdmin admin@test.com
    ServerName test.com
    ServerAlias www.test.com
    DocumentRoot /var/www/test.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

##### Enable the New Virtual Host Files

We can use the a2ensite tool to enable each of our sites like this:

```linux
sudo a2ensite example.com.conf
sudo a2ensite test.com.conf
```

Next, disable the default site defined in 000-default.conf:

```linux
sudo a2dissite 000-default.conf
```

When you are finished, you need to restart Apache to make these changes take effect:

```linux
sudo systemctl restart apache2
```

#### Set Up Local Hosts File (Optional)

For the domains that I used in this guide, assuming that my VPS IP address is 111.111.111.111, I could add\
thefollowing lines to the bottom of my hosts file:

```linux
sudo vi /etc/hosts

127.0.0.1   localhost
127.0.1.1   guest-desktop
111.111.111.111 example.com
111.111.111.111 test.com
```

#### Test your Results

<http://example.com>\
<http://test.com>

### [Nginx](https://nginx.org/en/docs/)

#### Install Latest Version Nginx

`sudo  apt install nginx -y`

#### Common Commands Nginx

`systemctl status nginx`\
`sudo systemctl start nginx`\
`sudo systemctl stop nginx`\
`sudo systemctl enable nginx`\
`sudo ufw app list`

## Let's Encrypt

### Step 1 — Install the Let’s Encrypt Client

First, add the repository:\

`sudo add-apt-repository ppa:certbot/certbot`

You’ll need to press ENTER to accept. Afterwards, update the package list to pick up the new
repository’s package information:\

`sudo apt-get update`

And finally, install Certbot from the new repository with apt-get:\

`sudo apt-get install python-certbot-apache`

### Step 2 — Set Up the SSL Certificate

To execute the interactive installation and obtain a certificate that covers only a single
domain, run the certbot command like so, where example.com is your domain:\

`sudo certbot --apache -d example.com`

## [LAMP](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04)

### Step 1: Install Apache and Allow in Firewall

`sudo apt-get update`\
`sudo apt-get install apache2`

#### Set Global ServerName to Suppress Syntax Warnings

Next, we will add a single line to the /etc/apache2/apache2.conf file to suppress a warning message.\
While harmless, if you do not set ServerName globally, you will receive the following warning when checking your\ Apache configuration for syntax errors:\
`sudo apache2ctl configtest`\
`sudo nano /etc/apache2/apache2.conf`\
`sudo apache2ctl configtest`\
`sudo systemctl restart apache2`

#### Adjust the Firewall to Allow Web Traffic

Next, assuming that you have followed the initial server setup instructions to enable the UFW firewall, make sure\ that your firewall allows HTTP and HTTPS traffic.\
You can make sure that UFW has an application profile for Apache like so:\
`sudo ufw app list`\
`sudo ufw app info "Apache Full"`\
`sudo ufw allow in "Apache Full"`

### Step 2: Install MySQL

`sudo apt-get install mysql-server`\
`mysql_secure_installation`\

### Step 3: Install PHP

PHP is the component of our setup that will process code to display dynamic content. It can run scripts, connect\
to our MySQL databases to get information, and hand the processed content over to our web server to display.\
`sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql`\

In most cases, we’ll want to modify the way that Apache serves files when a directory is requested. Currently, if\
a user requests a directory from the server, Apache will first look for a file called index.html. We want to tell\
our web server to prefer PHP files, so we’ll make Apache look for an index.php file first.\
To do this, type this command to open the dir.conf file in a text editor with root privileges:\
`sudo vi /etc/apache2/mods-enabled/dir.conf`\
`sudo systemctl restart apache2`\
`sudo systemctl status apache2`

#### Install PHP Modules

`apt-cache search php- | less`\
`apt-cache show php-cli`\
`sudo apt-get install php-cli`

### Step 4: Test PHP Processing on your Web Server

In order to test that our system is configured properly for PHP, we can create a very basic PHP script.\
We will call this script info.php. In order for Apache to find the file and serve it correctly, it must be saved\
to a very specific directory, which is called the “web root”.\
In Ubuntu 16.04, this directory is located at /var/www/html/.\
We can create the file at that location by typing:\
`sudo vi /var/www/html/info.php`\

Add this content in file:\

```php
<?php
phpinfo();
?>
```

The address you want to visit will be:\
<http://your_server_IP_address/info.php>

## SGBD

### [MySQL](https://ubuntu.com/server/docs/databases-mysql)

#### Install Latest Version MySQL

`sudo apt-get update`\
`sudo apt install mysql-server mysql-client -y`\
`sudo mysql_secure_installation`

#### Common Commands MySQL

`sudo systemctl status mysql.service`\
`sudo systemctl start mysql.service`\
`sudo systemctl stop mysql.service`\
`mysql -h localhost -u root -p`\
`sudo apt install mysql-workbench -y`\
`mysql-workbench`

### [MariaDB](https://mariadb.com/kb/en/documentation/)

#### Install Latest Version MariaDB

`sudo apt update`\
`sudo apt install mariadb-server -y`\
`sudo mysql_secure_installation`
`sudo mysql`\
`GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;`\
`FLUSH PRIVILEGES;`

#### Common Comands MariaDB

`sudo mysqladmin version`\
`sudo systemctl status mariadb.service`\
`sudo systemctl start mariadb.service`\
`sudo systemctl stop mariadb.service`

### [PostgreSQL](https://ubuntu.com/server/docs/databases-postgresql)

#### Install Latest Version PostgreSQL

1. Create the file repository configuration\
`sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'`

2. Import the repository signing key\
`wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -`

3. Update the package lists\
`sudo apt-get update`

4. Install the latest version of PostgreSQL

>If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql'

`sudo apt-get -y install postgresql`

#### Common comands PostgreSQL

`sudo systemctl status postgresql.service`\
`sudo systemctl start postgresql.service`\
`sudo systemctl stop postgresql.service`\
`sudo systemctl enable postgresql.service`

#### View Version with SQL

`sudo -u postgres psql`\
`SELECT version();`

## Filesystem

### [NFS](https://ubuntu.com/server/docs/service-nfs)

#### Install NFS

`sudo apt install nfs-kernel-server -y`\
`sudo apt install nfs-common -y`\

#### Common Commands NFS

`sudo systemctl start nfs-kernel-server.service`\
`sudo systemctl status nfs-kernel-server.service`\
`sudo systemctl stop nfs-kernel-server.service`\
`sudo systemctl enable  nfs-kernel-server.service`\
`cat /etc/exports`\
`nfsstat`

#### Configure NFS

`sudo mkdir /mnt/files`\
`sudo chown vagrant:vagrant -R /mnt/files`\
`sudo vim /etc/exports`\
`/mnt/files *(rw,async,no_subtree_check,no_root_squash)`\
`sudo exportfs -a`

#### Mount (Client)

`sudo mkdir /mnt/local_files`\
`sudo chown vagrant:vagrant -R /mnt/local_files`\
`sudo apt install nfs-common -y`\
`mount 192.168.0.134:/mnt/files /mnt/local_files`

#### Mount with /etc/fstab

`192.168.0.134:/mnt/files /mnt/local_files nfs rsize=8192,wsize=8192,timeo=14,intr`

## LDAP

### [Install OpenLDAP](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-openldap-and-phpldapadmin-on-ubuntu-16-04)

#### Step 1 — Installing and Configuring the LDAP Server

```linux
sudo apt-get update
sudo apt-get install slapd ldap-utils
sudo dpkg-reconfigure slapd
sudo ufw allow ldap
```

Let’s test our LDAP connection with ldapwhoami, which should return the username we’re connected as:\

`ldapwhoami -H ldap:// -x`\

Output\
anonymous\

#### Step 2 — Installing and Configuring the phpLDAPadmin Web Interface

`sudo apt-get install phpldapadmin`\

Opening the main configuration file with root privileges in your text editor:\
`sudo nano /etc/phpldapadmin/config.php`\

Set this lines:\

```shel
$servers->setValue('server','name','Example LDAP');
$servers->setValue('server','base', array('dc=example,dc=com'));
#$servers->setValue('login','bind_id','cn=admin,dc=example,dc=com');
$config->custom->appearance['hide_template_warning'] = true;
```

#### Step 3 — Logging into the phpLDAPadmin Web Interface

http://example.com/phpldapadmin\

user: cn=admin,dc=example,dc=com\
pass: has been configured in slapd\

It is recommended that you configure StartTLS LDAP Encryption!!!

## [Samba](https://ubuntu.com/server/docs/samba-introduction)

- [Samba - Active Directory](https://ubuntu.com/server/docs/samba-active-directory)

- [Samba - Domain Controller](https://ubuntu.com/server/docs/samba-domain-controller)

- [Samba - File Server](https://ubuntu.com/server/docs/samba-file-server)

- [Samba - Print Server](https://ubuntu.com/server/docs/samba-print-server)

- [Samba - Securing](https://ubuntu.com/server/docs/samba-securing)

- [Samba - OpenLDAP Backend](https://ubuntu.com/server/docs/samba-openldap-backend)
