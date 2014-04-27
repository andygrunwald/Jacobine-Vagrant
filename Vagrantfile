# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Debian Wheezy 7.4.0 (Wheezy) 64Bit with Chef 11.10
  # For more information have a look at https://dl.dropboxusercontent.com/u/10444758/vagrant/debian-wheezy-chef11/README
  config.vm.box = "debian-wheezy-chef11"
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/10444758/vagrant/debian-wheezy-chef11/debian-wheezy-chef11.box"

  config.vm.hostname = 'jacobine'

  config.vm.network :private_network, ip: "192.168.33.55"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  config.vm.synced_folder "Application", "/var/www/analysis"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "Chef/cookbooks"
    chef.roles_path = "Chef/roles"
    chef.add_role "base"
    chef.add_role "web"
    chef.add_role "application"
  end
end
