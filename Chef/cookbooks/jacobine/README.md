Jacobine Cookbook
========================
Sets up a working environment for [Jacobine](https://github.com/andygrunwald/Jacobine)

Requirements
------------
A checkout of [Jacobine](https://github.com/andygrunwald/Jacobine)

#### packages
- `composer`
- `database`
- `mysql`
- `supervisor`
- `logrotate`
- `apache2`

Attributes
----------
This is the main cookbook to deploy the [Jacobine](https://github.com/andygrunwald/Jacobine) application.
Please see attributes/default.rb for all available attributes.

Usage
-----
This is the main cookbook to deploy the [Jacobine](https://github.com/andygrunwald/Jacobine) application.
Please see recipes/* for all available recipes. Here is a small list about available recipes:

* `clone`: Creates the directory for the application and clones Jacobine in the new directory
* `composer`: Executes a composer install command to install all (PHP based) dependencies of Jacobine
* `cron`: Adds commands as a cronjob to the crontab of the deployed node
* `database`: Sets up the mysql database + user for Jacobine backend and frontend and imports the basic scheme
* `default`: Empty recipe to fits Chef needs
* `directories`: Creation of various directories for data storage and logs
* `logrotate`: Configures logrotate to rotate written logs by Jacobine
* `supervisord`: Configures supervisor to take care of our consumers
* `systemuser`: Setup of a systemuser to execute Jacobines processes under an own user
* `website`: Setup of the Jacobine FE (create directories, clone, deploy webservers vhost, etc.)

#### jacobine::default

The default cookbook is empty.
The normal way is to add every single recipe to your deployment.

The Jacobine ecosystem uses this cookbook to deploy its [Vagrant machine](https://github.com/andygrunwald/Jacobine-Vagrant) + live servers.

#### jacobine::*

Choose your recipe you want to add to your run list from recipes/* and include it in your node's `run_list`.
E.g. for the database recipe:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jacobine::database]"
  ]
}
```

License
------------
This code is released under the terms of the [Apache License in version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

Contributing
------------
1. Fork and clone it (`git clone https://github.com/andygrunwald/chef-jacobine.git`)
2. Create a named feature branch (`git checkout -b my-new-feature`)
3. Write you change (hack hack hack)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Submit a [Pull Request using Github](https://help.github.com/articles/creating-a-pull-request)
