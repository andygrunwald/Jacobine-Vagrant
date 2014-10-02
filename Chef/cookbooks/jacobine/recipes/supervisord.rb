#
# Cookbook Name:: Jacobine
# Recipe:: supervisord
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

include_recipe "jacobine::systemuser"
include_recipe "supervisor"

consoleBin = node[:jacobine][:console_bin]
supervisordUser = node[:jacobine][:supervisord][:user]
supervisordConfig = node[:jacobine][:supervisord][:processes]

supervisordConfig.each do |config|
	commandPart = config["command"]
	supervisor_service config["name"] do
		command "php #{consoleBin} #{commandPart}"
		process_name "%(program_name)s_%(process_num)02d"
		numprocs config["numprocs"]
		autorestart true
		autostart true
		user supervisordUser

		action :enable
	end
end

# Restart the service
service "supervisor" do
  action :restart
end
