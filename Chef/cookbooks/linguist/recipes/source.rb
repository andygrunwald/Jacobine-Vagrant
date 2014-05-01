#
# Cookbook Name:: github-linguist
# Recipe:: source
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

include_recipe "git"
include_recipe "rubygems"

targetDir = node[:linguist][:path]

directory "#{targetDir}" do
	owner node[:linguist][:owner]
	group node[:linguist][:group]
	mode  "0755"
	recursive true
end

git "checkout-linguist" do
	repository node[:linguist][:repository]
	reference node[:linguist][:branch]
	action :sync
	destination targetDir
end

# Needed to compile / bundle install it
apt_package "libicu-dev" do
	action :install
end

# Install bundler
# We do it on our own, because the 'bundler' cookbook requires ruby
# But during the use of chef-solo there is a ruby version installed
%w{ bundler }.each do |bundler_gem|
	gem_package bundler_gem do
		action :install
	end
end

execute "install-linguist-bundle" do
	command "bundle install"
	action :run
	cwd targetDir
end

# Now run the tool with "bundle exec linguist folder/"
