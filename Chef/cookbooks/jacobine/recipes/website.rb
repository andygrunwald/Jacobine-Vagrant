#
# Cookbook Name:: Jacobine
# Recipe:: website
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

include_recipe "composer"
include_recipe "apache2"

websiteDir = node[:jacobine][:website][:dir]
websiteUser = node[:jacobine][:website][:dir_user]
websiteGroup = node[:jacobine][:website][:dir_group]

# Website directory
directory websiteDir do
	owner websiteUser
	group websiteGroup
	mode "0775"
	action :create
	recursive true
end

# Cloning the application
git websiteDir do
	repository node[:jacobine][:website][:repository]
	reference node[:jacobine][:website][:revision]
	action :sync
	user websiteUser
	group websiteGroup
end

# composer install
composer_project "Install website project dependencies" do
	project_dir "#{websiteDir}/www/typo3conf/ext/analysis"
	action :install
end

# Create Apache2 VHost
web_app node[:jacobine][:website][:sitename] do
	ip node[:jacobine][:website][:ip]
	server_name node[:jacobine][:website][:url]
	server_aliases []
	allow_override "All"
	docroot "#{websiteDir}/www"
	enable true
end