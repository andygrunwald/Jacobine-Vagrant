# TYPO3-Analytics (Vagrant setup)

This is a vagrant setup for the [TYPO3 Analytics](https://github.com/andygrunwald/TYPO3-Analytics) project. For more details please have a look at the project repository.

The fill application and library stack is bundled into a easy to use virtual machine.

*ATTENTION*: This project is highly under development and can be completely change during development. But contribution is already welcome :)

## Requirements

To use this project you have to install the listed requirements:

* [Vagrant](http://www.vagrantup.com/)
* [librarian-chef](https://github.com/applicationsonline/librarian-chef)

## Installation

Short note: The SSH-Steps are necessary to use Gerrit as data source

* Clone it (`git clone --recursive git://github.com/andygrunwald/TYPO3-Analytics-Vagrant.git`)
* Switch submodule to master (`git submodule foreach --recursive git checkout master`)
* Switch to cloned directory (`cd TYPO3-Analytics-Vagrant`)
* Install Chef cookbooks via librarian-chef (`librarian-chef install`)
* Copy `Application/Config/config.yml.dist` to `Application/Config/config.yml` and add your settings (`cp Application/Config/config.yml.dist Application/Config/config.yml`)
* Copy `Application/Config/gerrit-review.typo3.org.yml.dist` to `Application/Config/gerrit-review.typo3.org.yml` and add your settings (`cp Application/Config/gerrit-review.typo3.org.yml.dist Application/Config/gerrit-review.typo3.org.yml`)
* Copy your SSH public and private key to `Application/Config/` for Gerrit SSH API
* Start the application (`vagrant up`)
* Login into the virtual machine (`vagrant ssh`)
* Enter `ssh-add` and enter the passphrase for your SSH key
* Execute `/usr/bin/ssh -i /home/vagrant/.ssh/id_rsa -p 29418 {CONFIGURED USERNAME}@review.typo3.org gerrit` to add server finger print to known ssh server
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

* Fork and clone it (`git clone git://github.com/andygrunwald/TYPO3-Analytics-Vagrant.git`)
* Create your feature branch (`git checkout -b my-new-feature`)
* Make your changes (hack hack hack)
* Commit your changes (`git commit -am 'Add some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new Pull Request

## Questions / Contact / Feedback

If you got questions, feedback or want to drink a beer and talk about this project just contact me.
Write me an email (see my Github-profile for this) or tweet me: [@andygrunwald](http://twitter.com/andygrunwald).
And of course you can just open an issue here on github.