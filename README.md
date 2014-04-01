# Vagrant-Lamp #

A simple set of puppet modules used to provision a Vagrant LAMP development
environment with Virtualbox.

## Why Vagrant ##

If you are unfamiliar with Vagrant, it is a simple way to create and provision
development environments. Using Puppet, vagrant users can automatically install
software required for development using a verbose syntax. Automatic provisioning
means that minimal VMs can be distributed to developers, and configured to use
software relevant to your development goals.

Check out http://www.vagrantup.com/ for directions on how to install Vagrant and
Virtualbox.

## Usage ##

Clone the Vagrant project onto your local machine. Edit the Vagrantfile and
adjust domain, ram, and cpus to fit your project/system requirements. The domain
specified in the Vagrantfile is how you will access your vagrant virtual machine
from the browser. After the options in the Vagrantfile are configured, run
'vagrant up' from inside the cloned directory. The vagrant vm will be
automatically populated with a base LAMP install and a new virtualhost
configured to serve the files in the 'site' directory.

## Config ##

Currently uses the domain specified in the Vagrantfile to determine virtualhost
and local domain name. The default virtualhost is disabled and the new
virtualhost is set to serve files from '/srv/www' which is tied to the 'site'
directory on the local machine. To access the virtual machine, add the domain
specified in the Vagrantfile to your hosts file. The default domain is
project.dev and the default ip is 192.168.88.2.

MySQL is installed and set up by default. The default root password is 'root'.
this can be configured in modules/mysql/manifests/init.pp by changing the
$password variable.

## What comes with it ##

* Linux
  Provisions a 64-bit Ubuntu 12.04 server VM.
* Apache
  Installs Apache2 prefork for development. Enables mod_rewrite and creates a
  new Apache Virtualhost on the guest.
* PHP5
* MySQL
* PEAR
* PHPUnit
* Composer

## Known issues ##

Sometimes on the first boot the machine will error during setup. This is because
of the base install script that comes with the virtualbox. This script does some
basic housekeeping and only needs to be run once and deleted. If an error occurs
'vargrant reload' or 'vagrant halt && vagrant up' the vm to re-run the puppet
scripts.

## Future intentions ##

I would love to see this project turn into a more robust set of puppet modules
that would allow different databases, servers and languages to be configured and
set up on the fly. If you would like to contribute, feel free to send me a pull
request.
