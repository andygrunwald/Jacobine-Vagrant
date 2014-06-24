#
# Cookbook Name:: grimoire
# Recipe:: mlstats
#
# Copyright 2014, Andy Grunwald
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

include_recipe "git"
include_recipe "python"
include_recipe "grimoire::mysql-lib"
include_recipe "grimoire::postgresql-lib"
# The new development branch of mlstats requires sqlalchemy
# If this is fully merged into master, maybe we can drop mysql-lib + postgresql-lib
include_recipe "grimoire::sqlalchemy"

targetDir = node[:grimoire][:mlstats][:destination]

directory "#{targetDir}" do
	owner node[:grimoire][:mlstats][:owner]
	group node[:grimoire][:mlstats][:group]
	mode  "0755"
	action :create
	recursive true
end

git "checkout-mlstats" do
	repository node[:grimoire][:mlstats][:repository]
	reference node[:grimoire][:mlstats][:version]
	action :sync
	destination targetDir
end

execute "mlstats-setup.py install" do
	command "python setup.py install"
	cwd targetDir
	action :run
end
