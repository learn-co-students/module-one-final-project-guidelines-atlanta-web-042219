class LoginScreen

	def self.run
		self.login_options
	end

	def self.message_delay(x)
		sleep(x); print '.'; sleep(x); print '.'; sleep(x); print '.'; sleep(x)
	end

	def self.continue
		print "\nPress ENTER to continue..."
		gets
	end

	def self.login_spinner(start, pass, finish)
		print "\n"
		spinner = TTY::Spinner.new("[:spinner] #{start} ", format: :classic)
		spinner.auto_spin
		sleep 2
		pass ? spinner.success(finish) : spinner.error(finish)
		continue
	end

	def self.login_options
		system('clear')
		input = $prompt.select("~ Welcome to APP NAME ~\n",
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
		puts %Q[Type "back" into either field to return to the welcome screen.\n\n]
		username = $prompt.ask (' Username -')
		password = $prompt.mask(' Password -')

		if username == 'back' || password == 'back'
			self.login_options
		elsif username == 'exit' || password == 'exit'
			exit
		elsif User.find_by(username: username, password: password) == nil
			login_spinner('Authenticating', false, '-  Invalid username or password.')
			self.existing_user
		else
			AppCLI.current_user = User.find_by(username: username)
			login_spinner('Authenticating', true, '-  Login successful.')
		end
	end

	def self.new_user
		system('clear')
		puts %Q[Type "back" into any field to return to the welcome screen.\n\n]
		name     = $prompt.ask (' Name     -')
		username = $prompt.ask (' Username -')
		password = $prompt.mask(' Password -')
		
		if name == 'back' || username == 'back' || password == 'back'
			self.login_options
		elsif name == 'exit' || username == 'exit' || password == 'exit'
			exit
		elsif User.find_by(username: username) != nil
			login_spinner('Creating new user profile', false, '-  That username is taken.')
			self.new_user
		else
			AppCLI.current_user = User.create(name: name, username: username, password: password)
			login_spinner('Creating new user profile', true, '-  success.')
		end
	end
end
