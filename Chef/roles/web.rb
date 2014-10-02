name "web"
description "The web role. Installs the required web stack"

run_list "recipe[python]",
		 "recipe[mysql::server]",
		 "recipe[mysql::client]",
		 "recipe[jacobine::dotdeb-php]",
		 "recipe[composer]"

override_attributes(
	:languages => {
		:ruby => {
			:default_version => '1.8'
		}
	},
	:mysql => {
		:remove_test_database => true,
		:remove_anonymous_users => false,
		:allow_remote_root => true,
		:bind_address => '0.0.0.0',
		:server_root_password => '',
		:server_debian_password => '',
		:server_repl_password => '',
		:tunable => {
			:max_allowed_packet => "100M"
		}
	},
	:dotdeb => {
		:php55 => true
	},
	:php => {
		:packages => ['php5', 'php5-dev', 'php5-cli', 'php-pear', 'php5-mysql', 'php5-curl'],
		:directives => {
			'date.timezone' => 'Europe/Berlin',
			'memory_limit' => -1,
			'display_errors' => 'On',
			'log_errors' => 'On',
			'error_log' => '/var/log/php_error.log'
		}
	}
)
