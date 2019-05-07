class MainMenu

	def self.run
		self.main_menu
	end

	def self.main_menu
		system('clear')
		input = $prompt.select(" Welcome, Andrew!  -  currently logged in as: ASAllen67\n",
			['Search for song lyrics',
			 'Log out'
			])
		case input
		when 'Search for song lyrics'
			self.song_search
		when 'Log out'
			exit
		end
	end

	def self.song_search
		system('clear')
		puts %Q[Type "back" into any field to return to the welcome screen.\n\n]
		name     = $prompt.ask (' Artist -')
		username = $prompt.ask (' Song  -')
	end
end