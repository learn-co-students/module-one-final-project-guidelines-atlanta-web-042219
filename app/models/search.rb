class Search < ActiveRecord::Base
	belongs_to :user
	belongs_to :song

	def api_request(artist, title)
		# print "\n"
		# spinner = TTY::Spinner.new("[:spinner] Searching for your song ", format: :dots)
		# spinner.auto_spin

		# response = RestClient.get(%Q[api.lyrics.ovh/v1/#{artist.gsub(' ','%20')}/#{song.gsub(' ','%20')])
		# response_hash = JSON.parse(response)

		response_hash = {"lyrics" => "Baby. There's just one thing I need from you\nBaby. I'll tell you what I'm gonna do\nLately. I think I need you on my team\n'Cause lately. You're my fucking fantasy\nUh (Uuh)\n\nLately. All I think about is you\nBaby. I don't know what I'm gonna do\nAnd you got. You got me beggin' please\n'Cause baby. You're my fucking fantasy\nUh (Uuh)\n\nYeah baby\n\nWant you baby\nYou're my fantasy\nWant you. Need you\nWant you. Need, need\nWant you\nBaby. You're my fantasy\n\nYeah\nBaby. Baby. Baby"}

		if response_hash == nil
			# spinner.error("-  ERROR: our API can't find that song!")

			print "\nPress ENTER to try again...".colorize(:green)
			gets

			self.api_request
		else
			Song.create(artist: artist, title: title, lyrics: response_hash["lyrics"])
			self.song_id = Song.all.last.id
			# spinner.success("-  done.")
			print "\nPress ENTER to continue...".colorize(:green)
			gets
		end
	end

	def get_current_filter
		hash = {}
		Filter.all.each {|filter| hash[filter.word] = filter.replacement }
		hash
	end

	# returns the percentage of all words that are in the filter
	def percent_profane
		filter = get_current_filter.keys
		self.song.lyrics.split(' ').select {|word| filter.include?(word.downcase.gsub(/[[:punct:]]/,'')) }.count / self.song.lyrics.split(' ').count.to_f * 100
	end

	#returns lyrics with profanity highlighted in red
	def find_profanity
		filter = get_current_filter.keys
		self.song.lyrics.split("\n").map {|newline|
			newline.split(' ').map {|word| filter.include?( word.downcase.gsub(/[[:punct:]]/,'') ) ? word.colorize(:red) : word }.join(' ')
		}.join("\n")
	end

	def filter_profanity
		filter = get_current_filter
		self.song.lyrics.split("\n").map {|newline|
			newline.split(' ').map {|word| filter.include?( word.downcase.gsub(/[[:punct:]]/,'') ) ? filter[word.downcase.gsub(/[[:punct:]]/,'')].colorize(:cyan) : word }.join(' ')
		}.join("\n")
	end

	def compile_stats
		percent = self.percent_profane

		print "\n"
		if percent < 1
			puts " This song is as pure as the driven snow!"
		elsif percent < 10
			puts " Parental rating: "+"PG".colorize(:cyan)
		elsif percent < 30
			puts " Parental rating: "+"PG-13".colorize(:green)
		elsif percent < 50
			puts " Parental rating: "+"R".colorize(:red)
		elsif percent < 70
			puts " Parental rating: "+"X".colorize(:red)
		else
			puts " This song is so profane we don't even have a rating for it..."
		end
		print " "+(percent.round(2).to_s+"\%").colorize(:cyan)+" of this song's lyrics are profane."
	end
end
