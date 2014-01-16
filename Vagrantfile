# -*- mode: ruby -*-
# vi: set ft=ruby :

box      = 'precise64'
url      = 'http://files.vagrantup.com/precise64.box'
domain   = 'project.dev' # URL used to access project
ram      = '1024' # ram and cpus can be decreased for less powerful systems
cpus     = '2'

Vagrant.configure("2") do |config|
  config.vm.box = box
  config.vm.box_url = url
  config.vm.hostname = domain
  config.vm.network "private_network", ip: "192.168.88.2" # The virtual ip
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
end
