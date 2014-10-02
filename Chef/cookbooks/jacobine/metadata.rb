name             'Jacobine'
maintainer       'Andy Grunwald'
maintainer_email 'andygrunwald@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures Jacobine'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.5.1'

depends "git"
depends "composer"
depends "database"
depends "apt"
depends "dotdeb"
depends "php"
depends "linguist"
depends "logrotate"
depends "supervisor"
depends "apache2"
