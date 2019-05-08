class MainMenu
	
	def self.run
		self.main_menu
	end

	def self.main_menu
		system('clear')
		input = $prompt.select(" Welcome, #{$user.name}!   (currently logged in as: #{$user.displayname})\n",
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
			self.edit_filter
		when 'Log out'
			Login.run
		end
	end

	def self.new_search
		system('clear')
		puts $back_msg
		title  = $prompt.ask (' Song   -')
		artist = $prompt.ask (' Artist -')

		if artist == 'back' || title == 'back'
			self.main_menu
		elsif artist == 'exit' || title == 'exit'
			exit
		else
			Search.api_request(artist, title)
		end
	end

	def self.song_menu
		system('clear')
		input = $prompt.select(%Q[ Displaying options for "#{$search.song.title}" by #{$search.song.artist}\n],
			['Print lyrics',
			 'View profanity stats for this song',
			 'Filter profanity from lyrics',
			 'Return to main menu'
			])
		case input
		when 'Print lyrics'
			print "\n"+$search.find_profanity
			print $return_text
			gets
			self.song_menu
		when 'View profanity stats for this song'
			$search.compile_stats
			print $return_text
			gets
			self.song_menu
		when 'Filter profanity from lyrics'
			if $search.percent_profane == 0
				puts "\n There's nothing to filter!"
				print $return_text
				gets
				self.song_menu
			else
				print "\n"+$search.filter_profanity
				print $return_text
				gets
				self.song_menu
			end
		when 'Return to main menu'
			self.main_menu
		end
	end

	def self.recent_searches
		system('clear')
		$user = User.find($user.id)
		options = []
		
		if $user.searches.count == 0
			prompt_message = %Q[ #{$user.displayname} has not made any searches recently.\n]
		else
			options = $user.searches.map{|search| %Q["#{search.song.title}" by #{search.song.artist}] }.reverse
			options << 'Clear my recent searches'
			prompt_message = %Q[ #{$user.displayname}'s recent searches:\n]
		end
		options << 'Return to main menu'
		
		input = $prompt.select(prompt_message, options)

		if input == 'Clear my recent searches'
			$user.searches.destroy_all
			puts "\n Your searches have been cleared."
			print $continue_text
			gets
			self.recent_searches
		elsif input == 'Return to main menu'
			self.main_menu
		else
			input = input.gsub(/[[:punct:]]/,'').split(' by ')
			$search = Search.find_by(user_id: $user.id, song_id: Song.find_by(title: input[0], artist: input[1]).id)
			self.song_menu
		end
	end

	def self.edit_filter
		system('clear')
		$user = User.find($user.id)
		puts %Q[ Enter a new 'bad word' you want to filter and a replacement for it.\n #{$back_msg}]
		bad_word         = $prompt.ask (' Bad Word    -')
		replacement_word = $prompt.ask (' Replacement -')

		if bad_word == 'back' || replacement_word == 'back'
			self.main_menu
		elsif bad_word == 'exit' || replacement_word == 'exit'
			exit

		else
			filter_check = Filter.find_by(word: bad_word, user_id: $user.id)

			if filter_check == nil
				Filter.create(word: bad_word, replacement: replacement_word, user_id: $user.id)
					puts %Q[\n "#{bad_word}"].colorize(:red) + %Q[ will now be replaced with ] + %Q["#{replacement_word}"].colorize(:cyan)
			else
				input = $prompt.select("\n That filter already exists. What do you want to do with it?\n", ['Update it', 'Delete it', 'Oh, nevermind'])
				case input
				when 'Update it'
					filter_check.replacement = replacement_word
					filter_check.save
					puts %Q[\n "#{bad_word}"].colorize(:red) + %Q[ will now be replaced with ] + %Q["#{replacement_word}"].colorize(:cyan)
				when 'Delete it'
					filter_check.destroy
					puts %Q[\n "#{bad_word}"].colorize(:red) + %Q[ will no longer be filtered.]
				when 'Oh, nevermind'
					puts "\n Operation canceled."
				end
			end
			print $continue_text
			gets
			self.edit_filter
		end
	end
end
