# TYPO3-Analytics (Vagrant setup)

This is a [Vagrant](http://www.vagrantup.com/) setup for the [TYPO3 Analytics](https://github.com/andygrunwald/TYPO3-Analytics) project.

The full application and library stack is bundled into a easy to use virtual machine.
This repository only contains the (complex) setup of [TYPO3 Analytics](https://github.com/andygrunwald/TYPO3-Analytics).
This can be used to development or showcase.

*ATTENTION*:
This project is highly under development and can be change during development completely.
But contribution is already welcome :)

## Requirements

To use this project you have to install the listed requirements:

* [Virtualbox](https://www.virtualbox.org/) or [VMWare](http://www.vmware.com/)
* [Vagrant](http://www.vagrantup.com/)
* [librarian-chef](https://github.com/applicationsonline/librarian-chef)

## Installation

* Check it out (`git clone https://github.com/andygrunwald/TYPO3-Analytics-Vagrant.git`)
* Switch to cloned directory (`cd TYPO3-Analytics-Vagrant`)
* Check out the [application](https://github.com/andygrunwald/TYPO3-Analytics) (`git clone https://github.com/andygrunwald/TYPO3-Analytics.git Application`)
* Install Chef cookbooks via [librarian-chef](https://github.com/applicationsonline/librarian-chef) (`librarian-chef install`)
* [Configure the application](https://github.com/andygrunwald/TYPO3-Analytics/wiki/Configure)
* Start the application (`vagrant up`)
* Take a break or a coffee (or both ;))
* Login into the virtual machine (`vagrant ssh`)
* Enjoy

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
* Database: typo3

### RabbitMQ

* Port: 15672
* Username: analysis
* Password: analysis

### Supervisord

* Port: 9001
* Username: analysis
* Password: analysis

## Contributing

* Fork and clone it (`git clone https://github.com/andygrunwald/TYPO3-Analytics-Vagrant.git`)
* Create your feature branch (`git checkout -b my-new-feature`)
* Make your changes (hack hack hack)
* Commit your changes (`git commit -am 'Add some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new Pull Request

A more detailed guide can be found at githubs [Fork A Repo](https://help.github.com/articles/fork-a-repo).

## Questions / Contact / Feedback

If you got *any kind of* questions, feedback or want to drink a beer and talk about this project just contact me.
Write me an email (written on my [Github-profile](https://github.com/andygrunwald)) or tweet me: [@andygrunwald](http://twitter.com/andygrunwald).
And of course you can just [open an issue](https://github.com/andygrunwald/TYPO3-Analytics-Vagrant/issues) here at github.