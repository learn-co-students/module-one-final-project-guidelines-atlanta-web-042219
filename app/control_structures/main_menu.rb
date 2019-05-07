class MainMenu
	@@current = nil
	
	def self.run
		self.main_menu
	end

	def self.main_menu
		system('clear')
		input = $prompt.select(" Welcome, #{AppCLI.current_user.name}!  -  currently logged in as: #{AppCLI.current_user.username}\n",
			['Search for a song',
			 'Recent searches',
			 'Edit profanity filter',
			 'Log out'
			])
		case input
		when 'Search for a song'
			self.new_search
			self.song_menu
		when 'Recent searches'
			self.recent_searches
		when 'Edit profanity filter'
			#do something
		when 'Log out'
			LoginScreen.run
		end
	end

	def self.new_search
		system('clear')
		puts %Q[Type "back" into any field to return to the main menu.\n\n]
		artist = $prompt.ask (' Artist -')
		song   = $prompt.ask (' Song   -')

		if artist == 'back' || song == 'back'
			self.main_menu
		else
			@@current = Search.create(user: AppCLI.current_user)
			@@current.api_request(artist, song)
		end
	end

	def self.song_menu
		system('clear')
		input = $prompt.select(%Q[Displaying options for "#{@@current.song.title} by #{@@current.song.artist}\n],
			['Print lyrics',
			 'View profanity analytics for this song',
			 'Filter profanity from lyrics',
			 'Return to main menu'
			])
		case input
		when 'Print lyrics'
			print "\n"+@@current.find_profanity
			print "\n\nPress ENTER to return...".colorize(:green)
			gets
			self.song_menu
		when 'View profanity analytics for this song'
			@@current.compile_stats
			print "\n\nPress ENTER to return...".colorize(:green)
			gets
			self.song_menu
		when 'Filter profanity from lyrics'
			print "\n"+@@current.filter_profanity
			print "\n\nPress ENTER to return...".colorize(:green)
			gets
			self.song_menu
		when 'Return to main menu'
			exit
			self.main_menu
		end
	end

	def self.recent_searches
		system('clear')
		options = AppCLI.current_user.searches.map{|search| puts search }
		input = $prompt.select(%Q[#{AppCLI.current_user.username}'s recent searches:\n], options)
	end

	def self.edit_filter
	end
end
