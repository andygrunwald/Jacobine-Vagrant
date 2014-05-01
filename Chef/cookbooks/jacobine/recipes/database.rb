#
# Cookbook Name:: Jacobine
# Recipe:: database
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

include_recipe "database::mysql"

# Add a new MySQL user
mysql_connection_info = {
	:host => node[:jacobine][:mysql_host],
	:username => node[:jacobine][:mysql_root][:username],
	:password => node[:jacobine][:mysql_root][:password]
}

# Create new MySQL user for analysis
database_user node[:jacobine][:mysql_user][:username] do
	connection mysql_connection_info
	password node[:jacobine][:mysql_user][:password]
	provider Chef::Provider::Database::MysqlUser
	action :create
end

# Grant access to new MySQL user for analysis
database_user node[:jacobine][:mysql_user][:username] do
	connection mysql_connection_info
	password node[:jacobine][:mysql_user][:password]
	provider Chef::Provider::Database::MysqlUser
	database_name node[:jacobine][:mysql_user][:database]
	privileges [:select,:update,:insert,:alter,:create,:delete,:drop,"CREATE VIEW"]
	action :grant
end

# Create website database
database node[:jacobine][:website][:mysql][:database] do
	connection mysql_connection_info
	provider Chef::Provider::Database::Mysql
	action :create
end

# Create new MySQL user for website
database_user node[:jacobine][:website][:mysql][:username] do
	connection mysql_connection_info
	password node[:jacobine][:website][:mysql][:password]
	provider Chef::Provider::Database::MysqlUser
	action :create
end

# Grant access to new MySQL user for website
database_user node[:jacobine][:website][:mysql][:username] do
	connection mysql_connection_info
	password node[:jacobine][:website][:mysql][:password]
	provider Chef::Provider::Database::MysqlUser
	database_name node[:jacobine][:website][:mysql][:database]
	privileges [:select,:update,:insert,:alter,:create,:delete,:drop]
	action :grant
end

databaseUserString = node[:jacobine][:mysql_root][:username]
if node[:jacobine][:mysql_root][:password].to_s != ""
	databaseUserString = databaseUserString + " -p" + node[:jacobine][:mysql_root][:password]
end

# Import sql scheme
execute "Create Jacobine sql scheme" do
	command "\"#{node['jacobine']['mysql_bin']}\" -u #{databaseUserString} < #{node[:jacobine][:application_dir]}/Database/database-scheme.sql"
	action :run
	only_if "\"#{node['jacobine']['mysql_bin']}\" -u #{databaseUserString} -e 'SHOW DATABASES;'"
end

# Setup Gerrie database
execute "Create Gerrie database" do
	cwd node[:jacobine][:gerrie_dir]
	command "#{node[:jacobine][:php_bin]} console gerrie:create-database --configFile=#{node[:jacobine][:gerrie_configfile]}"
	action :run
end