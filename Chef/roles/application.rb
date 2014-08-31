name "application"
description "The application role. Installs the required application stack"

run_list "recipe[rabbitmq]",
		 "recipe[rabbitmq::mgmt_console]",
		 "recipe[rabbitmq::virtualhost_management]",
		 "recipe[rabbitmq::user_management]",
		 "recipe[jacobine::composer]",
		 "recipe[jacobine::directories]",
		 "recipe[jacobine::database]",
		 "recipe[grimoire::cvsanaly]",
		 "recipe[grimoire::mlstats]",
		 "recipe[jacobine::github-linguist]"

override_attributes(
	:rabbitmq => {
		:version => '3.3.5',
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
