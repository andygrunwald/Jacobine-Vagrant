#
# Cookbook Name:: grimoire
# Recipe:: cvsanaly
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

include_recipe "python"
include_recipe "grimoire::mysql-lib"
include_recipe "grimoire::sqlite-lib"
include_recipe "grimoire::repositoryhandler"

targetDir = node[:grimoire][:cvsanaly][:destination]

directory "#{targetDir}" do
  owner node[:grimoire][:cvsanaly][:owner]
  group node[:grimoire][:cvsanaly][:group]
  mode  "0755"
  action :create
  recursive true
end

git "checkout-cvsanaly" do
  repository node[:grimoire][:cvsanaly][:repository]
  reference node[:grimoire][:cvsanaly][:version]
  action :sync
  destination targetDir
end

execute "cvsanaly-setup.py install" do
  command "python setup.py install"
  cwd targetDir
  action :run
end
