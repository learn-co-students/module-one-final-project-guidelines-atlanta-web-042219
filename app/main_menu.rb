class MainMenu
	
	def self.run
		self.main_menu
	end

	def self.main_menu
		system('clear')
		input = $prompt.select(" Welcome, Andrew!  -  currently logged in as: ASAllen67\n",
			['Search for song lyrics',
			 'Recent searches',
			 'Log out'
			])
		case input
		when 'Search for song lyrics'
			self.song_search
		when 'Recent searches'
			#do something
		when 'Log out'
			exit
		end
	end

	def self.song_search
		system('clear')
		puts %Q[Type "back" into any field to return to the welcome screen.\n\n]
		artist = $prompt.ask (' Artist -')
		song   = $prompt.ask (' Song   -')

		if artist == 'back' || song == 'back'
			self.main_menu
		else
			SongRequest.new(AppCLI.current_user).send_request(artist, song)
		end
	end
end
