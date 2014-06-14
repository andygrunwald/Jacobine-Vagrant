name "base"
description "The base role. Sets up basic stuff like apt, git etc."

run_list "recipe[apt]",
		 "recipe[build-essential]",
		 "recipe[git]",
		 "recipe[vim]"

override_attributes(
	:apt => {
		:compile_time_update => true
	},
	:'build-essential' => {
		:compile_time => true
	}
)
