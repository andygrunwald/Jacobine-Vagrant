name "base"
description "The base role. Sets up basic stuff like apt, git etc."

run_list "recipe[apt]",
		 "recipe[dotdeb]",
		 "recipe[build-essential]",
		 "recipe[git]",
		 "recipe[vim]"

override_attributes(
	:dotdeb => {
		:php55 => true
	},
	:'build-essential' => {
		:compile_time => true
	}
)
