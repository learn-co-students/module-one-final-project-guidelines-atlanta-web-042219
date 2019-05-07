class SongSearch < ActiveRecord::Base
	belongs_to :user
	belongs_to :song

	def search_request(artist, title)
		# print "\n"
		# spinner = TTY::Spinner.new("[:spinner] Searching for your song ", format: :dots)
		# spinner.auto_spin

		# response = RestClient.get(%Q[api.lyrics.ovh/v1/#{artist.gsub(' ','%20')}/#{song.gsub(' ','%20')])
		# response_hash = JSON.parse(response)

		response_hash = {"lyrics" => "Baby. There's just one thing I need from you\nBaby. I'll tell you what I'm gonna do\nLately. I think I need you on my team\n'Cause lately. You're my fucking fantasy\nUh (Uuh)\n\nLately. All I think about is you\nBaby. I don't know what I'm gonna do\nAnd you got. You got me beggin' please\n'Cause baby. You're my fucking fantasy\nUh (Uuh)\n\nYeah baby\n\nWant you baby\nYou're my fantasy\nWant you. Need you\nWant you. Need, need\nWant you\nBaby. You're my fantasy\n\nYeah\nBaby. Baby. Baby"}

		if response_hash == nil
			# spinner.error("-  ERROR: our API can't find that song!")

			print "\nPress ENTER to try again..."
			gets

			self.search_request
		else
			Song.create(artist: artist, title: title, lyrics: response_hash["lyrics"])
			self.song_id = Song.all.last.id
			# spinner.success("-  done.")
			binding.pry
			print "\nPress ENTER to continue..."
			gets
		end
	end

	# returns the percentage of all words that are in the filter
	def percent_profane
		filter = Filter.get_current_filter.keys
		expletives = @song.lyrics.split(' ').select {|word| filter.include?(word.downcase.gsub(/[[:punct:]]/,'')) }.count
		(expletives / @song.lyrics.split(' ').count.to_f * 100).round(2).to_s+"\% of this song is profane."
	end

	#returns lyrics with profanity highlighted in red
	def find_profanity
		filter = Filter.get_current_filter.keys
		@song.lyrics.split("\n").map {|newline|
			newline.split(' ').map {|word| filter.include?( word.downcase.gsub(/[[:punct:]]/,'') ) ? word.colorize(:red) : word }.join(' ')
		}
	end
end
