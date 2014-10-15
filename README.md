# Jacobine (Vagrant setup)

[![Documentation Status](https://readthedocs.org/projects/jacobine-vagrant/badge/?version=latest)](https://readthedocs.org/projects/jacobine-vagrant/?badge=latest)

This is a [Vagrant](http://www.vagrantup.com/) setup for the [Jacobine](https://github.com/andygrunwald/Jacobine) project.

The full application and library stack is bundled into a easy to use virtual machine.
This repository only contains the (complex) setup of [Jacobine](https://github.com/andygrunwald/Jacobine).
This can be used to development or showcase.

What does a "complex" setup mean?
Jacobine requires a lot of various tools. Some of them are:
* RabbitMQ
* PHP
* MySQL
* Ruby
* Python
* github linguist
* CVSAnaly

This is not the complete list and this list can changed due to new features of Jacobine.
This vagrant setup will install all necessary requirements in a easy way in a virtual machine.

*ATTENTION*:
This project is highly under development and can be change during development completely.
But contribution is already welcome :)

## Requirements

To use this project you have to install the listed requirements:

* [Virtualbox](https://www.virtualbox.org/) or [VMWare](http://www.vmware.com/)
* [Vagrant](http://www.vagrantup.com/)

## Installation

* Check it out (`git clone https://github.com/andygrunwald/Jacobine-Vagrant.git`)
* Switch to cloned directory (`cd Jacobine-Vagrant`)
* Check out the [application](https://github.com/andygrunwald/Jacobine) (`git clone https://github.com/andygrunwald/Jacobine.git Application`)
* [Configure the application](https://github.com/andygrunwald/Jacobine/wiki/Configure)
* Start the application (`vagrant up`)
* Take a break or a coffee (or both ;))
* Login into the virtual machine (`vagrant ssh`)
* Enjoy

The instance should be available under the IP-Address [192.168.33.55](http://192.168.33.55)

## Access to services in VM

The login credentials for the used services

### MySQL

#### root user

* Port: 3306
* Username: root
* Password:

#### analysis user

* Port: 3306
* Username: analysis
* Passwort: analysis
* Database: jacobine

### RabbitMQ

* Port: 15672
* Username: analysis
* Password: analysis

### Supervisord

* Port: 9001
* Username: analysis
* Password: analysis

## Updating cookbooks

If you want to upgrade our cookbooks (e.g. to get a new feature or to be up to date) here is a small guide.
We deliver all cookbooks with this repository to make the start more easier to new people.

For cookbooks dependency management we use [librarian-chef](https://github.com/applicationsonline/librarian-chef).
The Cheffile + Cheffile.lock are the files who contain the information about the cookbooks.
You need to install [librarian-chef](https://github.com/applicationsonline/librarian-chef) to update the cookbooks.

Next step is to upgrade the cookbooks itselfs:

* Delete the Cheffile.lock (`rm Cheffile.lock`)
* Install Chef cookbooks via [librarian-chef](https://github.com/applicationsonline/librarian-chef) (`librarian-chef install`)
* Delete .git repos of cookbooks to store them at github (`./Helper/delete-git-repos-of-cookbooks.sh`)

Finally test the upgrade:

* Destroy the current machine (`vagrant destroy`)
* Start the new machine (`vagrant up`)

## Contributing

* Fork and clone it (`git clone https://github.com/andygrunwald/Jacobine-Vagrant.git`)
* Create your feature branch (`git checkout -b my-new-feature`)
* Make your changes (hack hack hack)
* Commit your changes (`git commit -am 'Add some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new Pull Request

A more detailed guide can be found at githubs [Fork A Repo](https://help.github.com/articles/fork-a-repo).

## Questions / Contact / Feedback

If you got *any kind of* questions, feedback or want to drink a beer and talk about this project just contact me.
Write me an email (written on my [Github-profile](https://github.com/andygrunwald)) or tweet me: [@andygrunwald](http://twitter.com/andygrunwald).
And of course you can just [open an issue](https://github.com/andygrunwald/Jacobine-Vagrant/issues) here at github.
