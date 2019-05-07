require_relative 'models/user'
class AppCLI
	$prompt  = TTY::Prompt.new
	@@current_user = nil

	def self.run
		# LoginScreen.run
		@@current_user = User.find_by(username: "asa")
		MainMenu.run
	end

	def self.current_user=(user)
		@@current_user = user
	end

	def self.current_user
		@@current_user
	end
end
