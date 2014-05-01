#
# Cookbook Name:: repositoryhandler
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

# Sometimes you want to install a fork of RepositoryHandler
default[:repositoryhandler][:repository] = "https://github.com/MetricsGrimoire/RepositoryHandler.git"

# If you want to checkout a fixed tag or a development version
default[:repositoryhandler][:version] = "master"

# The install directory of RepositoryHandler
default[:repositoryhandler][:destination] = "/vagrant/MetricsGrimoire/RepositoryHandler"

default[:repositoryhandler][:owner] = "root"
default[:repositoryhandler][:group] = "root"