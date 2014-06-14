name             'Jacobine'
maintainer       'Andy Grunwald'
maintainer_email 'andygrunwald@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures Jacobine'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.2.0'

depends "composer"
depends "database"
depends "mysql"
depends "supervisor"
depends "logrotate"
depends "apache2"
depends "dotdeb"
