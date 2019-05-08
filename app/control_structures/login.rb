class Login

	def self.run
		self.login_options
	end

	def self.login_options
		system('clear')
		$user = nil
		$search = nil
		input = $prompt.select(" ~ Welcome to Clean.ly ~\n",
			['Existing user',
			 'Create new user',
			 'Exit'
			])
		case input
		when 'Existing user'
			self.existing_user
		when 'Create new user'
			self.new_user
		when 'Exit'
			exit
		end
	end

	def self.existing_user
		system('clear')
		puts $back_msg
		username = $prompt.ask (' Username -')
		password = $prompt.mask(' Password -')

		if username == 'back' || password == 'back'
			self.login_options
		elsif username == 'exit' || password == 'exit'
			exit

		elsif User.find_by(username: username.downcase, password: password) == nil
			login_spinner('Authenticating', false, '-  '+'Invalid username or password.'.colorize(:red))
			print $try_again_text
			gets
			self.existing_user
		else
			$user = User.find_by(username: username.downcase)
			login_spinner('Authenticating', true, '-  '+'Login successful.'.colorize(:green))
			print $continue_text
			gets
			MainMenu.run
		end
	end

	def self.new_user
		system('clear')
		puts $back_msg
		name     = $prompt.ask (' Name     -')
		username = $prompt.ask (' Username -')
		password = $prompt.mask(' Password -')
		
		if name == 'back' || username == 'back' || password == 'back'
			self.login_options
		elsif name == 'exit' || username == 'exit' || password == 'exit'
			exit

		elsif User.find_by(username: username.downcase) != nil
			login_spinner('Creating new user profile', false, '-  '+'That username is taken.'.colorize(:red))
			print $try_again_text
			gets
			self.new_user
		else
			$user = User.create(name: name, username: username.downcase, displayname: username, password: password)
			login_spinner('Creating new user profile', true, '-  '+'Success.'.colorize(:green))
			print $continue_text
			gets
			MainMenu.run
		end
	end

	def self.login_spinner(start, pass, finish)
		print "\n"
		
		spinner = TTY::Spinner.new("[:spinner] #{start} ", format: :classic, error_mark: '✖'.colorize(:red), success_mark: '✔'.colorize(:green) )
		spinner.auto_spin
		sleep 2
		pass ? spinner.success(finish) : spinner.error(finish)
	end
end
