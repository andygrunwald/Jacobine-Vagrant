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
# We added a wrapper to initialise dotdeb, but pin the repositories only to php,
# because we want to get the rest of the packages from the original one :)
#
# Most of the commands are from http://howto.biapy.com/en/debian-gnu-linux/system/software/setup-the-dotdeb-apt-repository-on-debian

include_recipe "apt"
include_recipe "dotdeb"

# Pin all dotdeb repositories to 400
apt_preference 'dotdeb' do
    glob         '*'
    pin          'release o=packages.dotdeb.org'
    pin_priority '400'
end

# Packages identified via
# echo $(command wget "http://packages.dotdeb.org/dists/wheezy/php5/binary-$(command dpkg --print-architecture)" --quiet --output-document=- | command grep "href=" | command grep -v "h1" | command grep -v "\.\./" | command sed -e 's/^[^>]*>\([^_]*\)_.*$/\1/' | command tr "\n" " ")
#
# Currently i do not know how to do this dynamically. If you know this, please contribute.
apt_preference 'dotdeb-php5-binary' do
    package_name "libapache2-mod-php5 libapache2-mod-php5filter libphp5-embed php5-cgi php5-cli php5-common php5-curl php5-dbg php5-dev php5-enchant php5-fpm php5-gd php5-gmp php5-imap php5-interbase php5-intl php5-ldap php5-mcrypt php5-mysql php5-mysqlnd php5-odbc php5-pgsql php5-pspell php5-readline php5-recode php5-snmp php5-sqlite php5-sybase php5-tidy php5-xmlrpc php5-xsl"
    pin          'release o=packages.dotdeb.org'
    pin_priority '600'
end

# Packages identified via
# echo $(command wget "http://packages.dotdeb.org/dists/wheezy/php5-pecl/binary-$(command dpkg --print-architecture)" --quiet --output-document=- | command grep "href=" | command grep -v "h1" | command grep -v "\.\./" | command sed -e 's/^[^>]*>\([^_]*\)_.*$/\1/' | command tr "\n" " ")
#
# Currently i do not know how to do this dynamically. If you know this, please contribute.
apt_preference 'dotdeb-php5-pecl' do
    package_name "php5-apc php5-apcu php5-gearman php5-geoip php5-http php5-imagick php5-memcache php5-memcached php5-mongo php5-pinba php5-redis php5-spplus php5-ssh2 php5-xcache php5-xdebug php5-xhprof php5-zendopcache"
    pin          'release o=packages.dotdeb.org'
    pin_priority '600'
end

# Packages identified via
# echo $(command wget "http://packages.dotdeb.org/dists/wheezy/php5/binary-all" --quiet --output-document=- | command grep "href=" | command grep -v "h1" | command grep -v "\.\./" | command sed -e 's/^[^>]*>\([^_]*\)_.*$/\1/' | command tr "\n" " ")
#
# Currently i do not know how to do this dynamically. If you know this, please contribute.
apt_preference 'dotdeb-php5-normal' do
    package_name "php-pear php5"
    pin          'release o=packages.dotdeb.org'
    pin_priority '600'
end

include_recipe "php"
