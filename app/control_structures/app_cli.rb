class AppCLI

	def self.run
		Login.run

		# for testing purposes
		# $user = User.find_by(username: "dev")
		# MainMenu.run
	end
end
