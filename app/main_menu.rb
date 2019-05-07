class MainMenu
	@@current = nil
	
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
			self.new_song_search
			self.song_menu
		when 'Recent searches'
			self.recent_searches
		when 'Edit profanity filter'
			#do something
		when 'Log out'
			LoginScreen.run
		end
	end

	def self.new_song_search
		system('clear')
		puts %Q[Type "back" into any field to return to the welcome screen.\n\n]
		artist = $prompt.ask (' Artist -')
		song   = $prompt.ask (' Song   -')

		if artist == 'back' || song == 'back'
			self.main_menu
		else
			@@current = SongSearch.create(user: AppCLI.current_user)
			@@current.search_request(artist, song)
		end
	end

	def self.song_menu
		system('clear')
		input = $prompt.select(%Q[Displaying options for "#{@@current.song.title} by #{@@current.song.artist}\n],
			['Display lyrics',
			 'Filter profanity from lyrics',
			 'Return to main menu'
			])
		case input
		when 'Display lyrics'
			@@current.song.lyrics

	end

	def self.recent_searches
		system('clear')
		options = AppCLI.current_user.songrequests.map(&:song.title)
		input = $prompt.select(%Q[Displaying options for "#{@@current.song.title}"" by #{@@current.song.artist}], options)

	end

	def self.edit_filter
	end
end
