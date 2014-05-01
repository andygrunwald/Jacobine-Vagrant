#
# Cookbook Name:: cvsanaly
# Attributes:: default
#
# Copyright 2013, Andy Grunwald
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

# Sometimes you want to install a fork of CVSAnalY
default[:cvsanaly][:repository] = "https://github.com/MetricsGrimoire/CVSAnalY.git"

# If you want to checkout a fixed tag or a development version
default[:cvsanaly][:version] = "master"

# The install directory of RepositoryHandler
default[:cvsanaly][:destination] = "/vagrant/MetricsGrimoire/CVSAnalY"

default[:cvsanaly][:owner] = "root"
default[:cvsanaly][:group] = "root"
