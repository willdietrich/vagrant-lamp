# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

box      = 'hashicorp/precise64'
domain   = 'flexget-config.dev' # URL used to access project
ram      = '2048' # ram and cpus can be decreased for less powerful systems
cpus     = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = box

  config.vm.hostname = domain
  config.vm.network "private_network", ip: "192.168.88.2" # The virtual ip
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.synced_folder "site/", "/srv/www"

  config.vm.provider "virtualbox" do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", ram,
      "--cpus", cpus
    ]
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
  end
  config.vm.provision "shell", inline: "su - vagrant -c \"curl -sSL https://get.rvm.io | bash -s stable --ruby\""
end
