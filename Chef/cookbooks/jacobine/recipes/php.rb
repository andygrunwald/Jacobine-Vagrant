#
# Cookbook Name:: Jacobine
# Recipe:: php
#
# Copyright 2014, Andy Grunwald
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

# We want to get the latest "stable" version of PHP
# Currently we are running on debian. Debian is popular for stable packages.
# But in many times the packages are so stable that they are old (e.g. PHP).
# So we decided to get PHP from dotdeb.
# But why we not include just dotdeb and php in the runlist?
# Why we add a wrapper recipe for this?
# This is quite easy: At the moment (2014-06-14) there is a bug in the mysql-server startup script.
# This bug was fixed in the official debian repository. But not in the dotdeb repository.
# If we add dotdeb before we install MySQL-Server, we will install MySQL-Server from dotdeb repository.
# Currently i don`t know how to "force" the installation from the debian repository.
# But this does not matter.
# We just created this wrapper recipe and add dotdeb just before we try to install PHP.
# With this trick we can install MySQL-Server before we install PHP (and dotdeb).
# On the other hand it does not hurt to get a wrapper recipe.

include_recipe "dotdeb"
include_recipe "php"