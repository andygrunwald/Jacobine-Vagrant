# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/debian-7.4"
  config.vm.hostname = 'jacobine'
  config.vm.network :private_network, ip: "192.168.33.55"
  config.vm.synced_folder "Application", "/var/www/analysis"

  config.vm.provider "virtualbox" do |v|
    v.name = "Jacobine"
    v.memory = 1024
  end

  # Install chef client (if necessary)
  config.vm.provision "shell", path: "Chef/scripts/install-chef.sh"

  # Deploy the stack + application
  config.vm.provision :chef_solo do |chef|
    chef.custom_config_path = "Vagrantfile.chef"
    chef.cookbooks_path = "Chef/cookbooks"
    chef.roles_path = "Chef/roles"
    chef.add_role "base"
    chef.add_role "web"
    chef.add_role "application"
  end
end
