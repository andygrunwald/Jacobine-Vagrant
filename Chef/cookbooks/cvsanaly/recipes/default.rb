#
# Cookbook Name:: cvsanaly
# Recipe:: default
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

include_recipe "repositoryhandler"
include_recipe "cvsanaly::dependencies"

targetDir = node[:cvsanaly][:destination]

directory "#{targetDir}" do
	owner node[:cvsanaly][:owner]
	group node[:cvsanaly][:group]
	mode  "0755"
	action :create
	recursive true
end

git "checkout-cvsanaly" do
	repository node[:cvsanaly][:repository]
	reference node[:cvsanaly][:version]
	action :sync
	destination targetDir
end

execute "cvsanaly-setup.py install" do
	command "python setup.py install"
	cwd targetDir
	action :run
end
