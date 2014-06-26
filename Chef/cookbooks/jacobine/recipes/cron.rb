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
cronUser = node[:jacobine][:cron_user]

#TODO Refactor crons for a loop with configuration

# Crontab entry for typo3:get.typo3.org console command
# Every day at 00:15, 04:15, 08:15, 12:15, 16:15, 20:15
cron "typo3_get-typo3-org" do
	minute "15"
	hour "*/4"
	day "*"
	command "#{phpBin} #{consoleBin} typo3:get.typo3.org"
	user cronUser
end

# Crontab entry for crawler:gitweb console command
# Every day at 00:30, 12:30
cron "crawler_gitweb" do
	minute "30"
	hour "*/12"
	day "*"
	command "#{phpBin} #{consoleBin} crawler:gitweb"
	user cronUser
end

# Crontab entry for crawler:gerrit console command
# Every day at 00:00, 06:00, 12:00, 18:00
cron "crawler_gerrit" do
	minute "0"
	hour "*/6"
	day "*"
	command "#{phpBin} #{consoleBin} crawler:gerrit"
	user cronUser
end
