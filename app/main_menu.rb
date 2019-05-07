class MainMenu
	@@current_song = nil
	
	def self.run
		self.main_menu
	end

	def self.main_menu
		system('clear')
		input = $prompt.select(" Welcome, #{AppCLI.current_user.name}!  -  currently logged in as: #{AppCLI.current_user.username}\n",
			['Search for song lyrics',
			 'Recent searches',
			 'Edit profanity filter',
			 'Log out'
			])
		case input
		when 'Search for song lyrics'
			self.song_search
			self.song_menu
		when 'Recent searches'
			self.recent_searches
		when 'Log out'
			LoginScreen.run
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
			@@current_song = SongSearch.create(user: AppCLI.current_user)
			binding.pry
			@@current_song.song.search_request(artist, song)
		end
	end

	def self.song_menu
		system('clear')
		input = $prompt.select(%Q[Displaying options for "#{@@current_song.title}"" by #{@@current_song.artist}],
			['Display lyrics',
			 'Filter profanity from lyrics',
			 'Return to main menu'
			])
	end

	def self.recent_searches
		system('clear')
		options = AppCLI.current_user.songrequests.map(&:song.title)
		input = $prompt.select(%Q[Displaying options for "#{@@current_song.title}"" by #{@@current_song.artist}], options)

	end
end
