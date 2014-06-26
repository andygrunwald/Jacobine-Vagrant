#
# Cookbook Name:: Jacobine
# Recipe:: cron
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

phpBin = node[:jacobine][:php_bin]
consoleBin = node[:jacobine][:console_bin]
cronUser = node[:jacobine][:cron][:user]
cronConfig = node[:jacobine][:cron][:processes]

cronConfig.each do |config|
	command = config["command"]
	cron config["name"] do
		minute config["minute"]
		hour config["hour"]
		day config["day"]
		command "#{phpBin} #{consoleBin} #{command}"
		user cronUser
	end
end
