#
# Cookbook Name:: Jacobine
# Attributes:: default
#
# Copyright 2013-2014, Andy Grunwald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Application
default[:jacobine][:application_dir] = "/var/www/analysis"
default[:jacobine][:application_dir_user] = "vagrant"
default[:jacobine][:application_dir_group] = "vagrant"

default[:jacobine][:git_repository] = "https://github.com/andygrunwald/Jacobine.git"
default[:jacobine][:git_revision] = "master"

# Directory where downloaded data will be stored
default[:jacobine][:data_dir] = "/var/www/analysis-data/TYPO3"
default[:jacobine][:data_dir_user] = "vagrant"
default[:jacobine][:data_dir_group] = "vagrant"

# Directory to store the log files
default[:jacobine][:log_dir] = "/var/log/analysis"
default[:jacobine][:log_dir_user] = "vagrant"
default[:jacobine][:log_dir_group] = "vagrant"

# PHP settings
default[:jacobine][:php_bin] = "/usr/bin/php"

# MySQL settings
default[:jacobine][:mysql_bin] = "/usr/bin/mysql"
default[:jacobine][:mysql_host] = "localhost"

# MySQL user
default[:jacobine][:mysql_root][:username] = "root"
default[:jacobine][:mysql_root][:password] = ""

default[:jacobine][:mysql_user][:username] = "jacobine"
default[:jacobine][:mysql_user][:password] = "jacobine"
default[:jacobine][:mysql_user][:database] = "jacobine"

# Gerrie settings
default[:jacobine][:gerrie_dir] = "/var/www/analysis/vendor/andygrunwald/gerrie"
default[:jacobine][:gerrie_configfile] = "/var/www/analysis/Config/gerrit-review.typo3.org.yml"

# Binaries
default[:jacobine][:console_bin] = "/var/www/analysis/console"

# Logrotate
default[:jacobine][:logrotate][:logs] = {}

# System user
default[:jacobine][:analysis][:user] = "analysis"
default[:jacobine][:analysis][:group] = "www-data"
default[:jacobine][:analysis][:comment] = "System user to execute analysis processes"
default[:jacobine][:analysis][:shell] = "/bin/false"

# Supervisord
default[:jacobine][:supervisord][:user] = "analysis"

# Cron
default[:jacobine][:cron_user] = "vagrant"

# Website
default[:jacobine][:website][:dir] = "/var/www/analysis.local"
default[:jacobine][:website][:dir_user] = "vagrant"
default[:jacobine][:website][:dir_group] = "vagrant"
default[:jacobine][:website][:repository] = "https://github.com/andygrunwald/Jacobine-Web.git"
default[:jacobine][:website][:revision] = "master"

default[:jacobine][:website][:ip] = "192.168.33.55"
default[:jacobine][:website][:sitename] = "analysis.local"
default[:jacobine][:website][:url] = "analysis.local"

default[:jacobine][:website][:mysql][:username] = "jacobine_web"
default[:jacobine][:website][:mysql][:password] = "jacobine_web"
default[:jacobine][:website][:mysql][:database] = "jacobine_web"
