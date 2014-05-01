#
# Cookbook Name:: Jacobine
# Recipe:: clone
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

# Data directory
directory node[:jacobine][:application_dir] do
	owner node[:jacobine][:application_dir_user]
	group node[:jacobine][:application_dir_group]
	mode "0755"
	action :create
	recursive true
end

# git clone
git node[:jacobine][:application_dir] do
	repository node[:jacobine][:git_repository]
	reference node[:jacobine][:git_revision]
	action :sync
	user node[:jacobine][:application_dir_user]
	group node[:jacobine][:application_dir_group]
end