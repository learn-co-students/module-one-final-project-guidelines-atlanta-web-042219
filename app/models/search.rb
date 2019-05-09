class Search < ActiveRecord::Base
	belongs_to :user
	belongs_to :song

	def self.api_request(artist="", title="")
		print "\n"
		spinner = TTY::Spinner.new("[:spinner] Searching for your song ", format: :dots, error_mark: '✖'.colorize(:red), success_mark: '✔'.colorize(:green))
		spinner.auto_spin

		song_check = Song.find_by(artist: artist, title: title)

		# check if the database already has the song
		if song_check != nil
			search_check = Search.find_by(user_id: $user.id, song_id: song_check.id)

			# if the song exists, check if this search already exists
			if search_check != nil
				$search = search_check
			else
				$search = Search.create(user_id: $user.id, song_id: song_check.id)
			end
			spinner.success('-  '+'Found it.'.colorize(:green))
			print $continue_text
			gets
		else
			response = nil
			begin
				response = RestClient::Request.execute(
					:url => %Q[api.lyrics.ovh/v1/#{artist.gsub(' ','%20')}/#{title.gsub(' ','%20')}],
					:method => :get, 
					:timeout => 10, 
					:opentimeout => 10)
			rescue RestClient::Exceptions::ReadTimeout
			rescue RestClient::Exceptions::OpenTimeout
			end

			response == nil ? song_lyrics = "" : song_lyrics = JSON.parse(response)["lyrics"]

			if song_lyrics.length == 0
				spinner.error("-  "+"ERROR: our API can't find that song!".colorize(:red))
				print "\nPress "+"ENTER".colorize(:green)+" to try again..."
				gets
				MainMenu.new_search
			else
				$search = Search.create(user_id: $user.id, song_id: Song.create(artist: artist, title: title, lyrics: song_lyrics).id)
				spinner.success('-  '+'Found it.'.colorize(:green))
				print $continue_text
				gets
			end
		end
	end

	# returns the percentage of all words that are in the filter
	def percent_profane
		filter = Filter.get_current_filter.keys
		self.song.lyrics.split(' ').select {|word|
			temp = word.downcase.gsub(/[[:punct:]]/,'')
			filter.include?(temp) || filter.include?(temp.singularize)
		}.count / self.song.lyrics.split(' ').count.to_f * 100
	end

	#returns lyrics with profanity highlighted in red
	def find_profanity
		filter = Filter.get_current_filter.keys
		print "\n"+self.song.lyrics.split("\n").map {|newline|
			newline.split(' ').map {|word|
				temp = word.downcase.gsub(/[[:punct:]]/,'')
				filter.include?(temp) || filter.include?(temp.singularize) ? word.colorize(:red) : word
			}.join(' ')		
		}.join("\n")
	end

	def filter_profanity
		filter = Filter.get_current_filter
		print "\n"+self.song.lyrics.split("\n").map {|newline|
			newline.split(' ').map {|word|
				temp = word.downcase.gsub(/[[:punct:]]/,'')
				if filter.include?(temp)
					filter[temp].colorize(:cyan)
				elsif filter.include?(temp.singularize)
					filter[temp.singularize].pluralize.colorize(:cyan)
				else
					word
				end
			}.join(' ')
		}.join("\n")
	end

	def compile_stats
		percent = self.percent_profane

		print "\n"
		if percent == 0
			puts " This song doesn't have ANY profanity in it. Truly amazing."
		elsif percent < 2
			puts " Parental rating: "+"PG".colorize(:cyan)
		elsif percent < 10
			puts " Parental rating: "+"PG-13".colorize(:green)
		elsif percent < 15
			puts " Parental rating: "+"R".colorize(:red)
		else
			puts " This song is so profane we don't even have a rating for it."
		end
		print " "+(percent.round(2).to_s+"\%").colorize(:cyan)+" of this song's lyrics are profane."
	end
end
