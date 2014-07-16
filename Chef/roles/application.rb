name "application"
description "The application role. Installs the required application stack"

run_list "recipe[supervisor]",
		 "recipe[rabbitmq]",
		 "recipe[rabbitmq::mgmt_console]",
		 "recipe[rabbitmq::virtualhost_management]",
		 "recipe[rabbitmq::user_management]",
		 "recipe[jacobine::composer]",
		 "recipe[jacobine::directories]",
		 "recipe[jacobine::database]",
		 "recipe[jacobine::supervisord]",
		 "recipe[jacobine::logrotate]",
		 "recipe[grimoire::cvsanaly]",
		 "recipe[grimoire::mlstats]",
		 "recipe[jacobine::github-linguist]"

override_attributes(
	:supervisor => {
		:inet_port => "192.168.33.55:9001",
		:inet_username => "analysis",
		:inet_password => "analysis"
	},
	:rabbitmq => {
		:version => '3.3.3',
		:address => '192.168.33.55',
		:virtualhosts => ['analysis'],
		:enabled_users => [{
			:name => "analysis",
			:password => "analysis",
			:tag => 'administrator',
			:rights => [{
				:vhost => 'analysis' ,
				:conf => ".*",
				:write => ".*",
				:read => ".*"
			}],
		}],
		:disabled_users => ['guest']
	},
	:jacobine => {
		:supervisord => {
			:processes => [
				# Consumer: Download\\Git
				{
					:name => "consumer-download-git",
					:command => "analysis:consumer Download\\\\Git",
					:numprocs => 2
				},
				# Consumer: Download\\HTTP
				{
					:name => "consumer-download-http",
					:command => "analysis:consumer Download\\\\HTTP",
					:numprocs => 2
				},
				# Consumer: Extract\\Targz
				{
					:name => "consumer-extract-targz",
					:command => "analysis:consumer Extract\\\\Targz",
					:numprocs => 1
				},
				# Consumer: Crawler\\Gitweb
				{
					:name => "consumer-crawler-gitweb",
					:command => "analysis:consumer Crawler\\\\Gitweb",
					:numprocs => 1
				},
				# Consumer: Crawler\\Mailinglist
				{
					:name => "consumer-crawler-mailinglist",
					:command => "analysis:consumer Crawler\\\\Mailinglist",
					:numprocs => 1
				},
				# Consumer: Analysis\\Filesize
				{
					:name => "consumer-analysis-filesize",
					:command => "analysis:consumer Analysis\\\\Filesize",
					:numprocs => 1
				},
				# Consumer: Analysis\\GithubLinguist
				{
					:name => "consumer-analysis-githublinguist",
					:command => "analysis:consumer Analysis\\\\GithubLinguist",
					:numprocs => 1
				},
				# Consumer: Analysis\\PHPLoc
				{
					:name => "consumer-analysis-phploc",
					:command => "analysis:consumer Analysis\\\\PHPLoc",
					:numprocs => 2
				},
				# Consumer: Analysis\\PDepend
				{
					:name => "consumer-analysis-pdepend",
					:command => "analysis:consumer Analysis\\\\PDepend",
					:numprocs => 1
				},
				# Consumer: Analysis\\CVSAnaly
				{
					:name => "consumer-analysis-cvsanaly",
					:command => "analysis:consumer Analysis\\\\CVSAnaly",
					:numprocs => 1
				},
				# Consumer: Crawler\\Gerrit
				{
					:name => "consumer-crawler-gerrit",
					:command => "analysis:consumer Crawler\\\\Gerrit",
					:numprocs => 1
				}
			]
		},
		:logrotate => {
			:logs => [
				# Consumer: Crawler\\Gerrit
				{
					:name => "analysis-crawler-gerrit",
					:path => "crawler.gerrit-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				# Consumer: Crawler\\Gitweb
				{
					:name => "analysis-crawler-gitweb",
					:path => "crawler.gitweb-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				# Consumer: Crawler\\Mailinglist
				{
					:name => "analysis-crawler-mailinglist",
					:path => "crawler.mailinglist-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				{
					:name => "analysis-analysis-mailinglist-error",
					:path => "analysis.mailinglist-errorstream.log",
					:options => ["copytruncate", "dateext", "missingok", "compress"]
				},
				# Consumer: Analysis\\CVSAnaly
				{
					:name => "analysis-analysis-cvsanaly",
					:path => "analysis.cvsanaly-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				{
					:name => "analysis-analysis-cvsanaly-error",
					:path => "analysis.cvsanaly-errorstream.log",
					:options => ["copytruncate", "dateext", "missingok", "compress"]
				},
				# Consumer: Analysis\\Filesize
				{
					:name => "analysis-analysis-filesize",
					:path => "analysis.filesize-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				# Consumer: Analysis\\GithubLinguist
				{
					:name => "analysis-analysis-githublinguist",
					:path => "analysis.githublinguist-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				{
					:name => "analysis-analysis-githublinguist-error",
					:path => "analysis.githublinguist-errorstream.log",
					:options => ["copytruncate", "dateext", "missingok", "compress"]
				},
				# Consumer: Analysis\\PHPLoc
				{
					:name => "analysis-analysis-phploc",
					:path => "analysis.phploc-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				{
					:name => "analysis-analysis-phploc-error",
					:path => "analysis.phploc-errorstream.log",
					:options => ["copytruncate", "dateext", "missingok", "compress"]
				},
				# Consumer: Download\\Git
				{
					:name => "analysis-download-git",
					:path => "download.git-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				{
					:name => "analysis-download-git-error",
					:path => "download.git-errorstream.log",
					:options => ["copytruncate", "dateext", "missingok", "compress"]
				},
				# Consumer: Download\\HTTP
				{
					:name => "analysis-download-http",
					:path => "download.http-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				{
					:name => "analysis-download-http-error",
					:path => "download.http-errorstream.log",
					:options => ["copytruncate", "dateext", "missingok", "compress"]
				},
				# Consumer: Extract\\Targz
				{
					:name => "analysis-extract-targz",
					:path => "extract.targz-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				{
					:name => "analysis-extract-targz-error",
					:path => "extract.targz-errorstream.log",
					:options => ["copytruncate", "dateext", "missingok", "compress"]
				},
				# Consumer: Analysis\\PDepend
				{
					:name => "analysis-analysis-pdepend",
					:path => "analysis.pdepend-stream.log",
					:options => ["copytruncate", "dateext", "compress"]
				},
				{
					:name => "analysis-analysis-pdepend-error",
					:path => "analysis.pdepend-errorstream.log",
					:options => ["copytruncate", "dateext", "missingok", "compress"]
				}
			]
		}
	},
	:grimoire => {
		:repositoryhandler => {
			:destination => '/var/www/analysis/tools/MetricsGrimoire/RepositoryHandler'
		},
		:cvsanaly => {
			:destination => '/var/www/analysis/tools/MetricsGrimoire/CVSAnalY'
		},
		:mlstats => {
			:destination => '/var/www/analysis/tools/MetricsGrimoire/MLStats'
		},
	}
)
