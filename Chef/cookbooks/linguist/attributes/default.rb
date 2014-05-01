#
# Cookbook Name:: github-linguist
# Attributes:: default
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

# Kind of installation: gem or source
default[:linguist][:install_method] = "gem"

# Attributes for "source" way
default[:linguist][:path] = "/var/application"
default[:linguist][:repository] = "https://github.com/github/linguist.git"
default[:linguist][:branch] = "master"

default[:linguist][:owner] = "root"
default[:linguist][:group] = "root"
