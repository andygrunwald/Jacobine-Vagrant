#
# Cookbook Name:: Jacobine
# Recipe:: logrotate
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

include_recipe "logrotate"

logDir = node[:jacobine][:log_dir]
logConfig = node[:jacobine][:logrotate][:logs]

logConfig.each do |config|
	logPath = config["path"]
	logrotate_app config["name"] do
		cookbook "logrotate"
		path "#{logDir}/#{logPath}"
		enable true
		frequency "daily"
		options config["options"]
		rotate 31
	end
end
