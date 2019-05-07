class SongRequest < ActiveRecord::Base
	belongs_to :user
	# belongs_to :song

	attr_accessor :user, :song
	@@all = []

	def self.all
		@@all
	end

	def initialize(user)
		@user = user
		@@all << self
	end

	def send_request(artist_name, song_title)
		# print "\n"
		# spinner = TTY::Spinner.new("[:spinner] Searching for your song ", format: :dots)
		# spinner.auto_spin

		# response = RestClient.get(%Q[api.lyrics.ovh/v1/mystery%20skulls/fantasy])
		# response_hash = JSON.parse(response)

		response_hash = {"lyrics" => "Baby. There's just one thing I need from you\nBaby. I'll tell you what I'm gonna do\nLately. I think I need you on my team\n'Cause lately. You're my fucking fantasy\nUh (Uuh)\n\nLately. All I think about is you\nBaby. I don't know what I'm gonna do\nAnd you got. You got me beggin' please\n'Cause baby. You're my fucking fantasy\nUh (Uuh)\n\nYeah baby\n\nWant you baby\nYou're my fantasy\nWant you. Need you\nWant you. Need, need\nWant you\nBaby. You're my fantasy\n\nYeah\nBaby. Baby. Baby"}

		if response_hash == nil
			# spinner.error("-  ERROR: our API can't find that song!")

			print "\nPress ENTER to try again..."
			gets

			self.send_request
		else
			self.song = Song.new(response_hash["lyrics"])
			# spinner.success("-  done.")

			print "\nPress ENTER to display lyrics..."
			gets

			puts self.find_profanity
			print "\n"
			puts self.percent_profane
		end
	end

	# returns the percentage of all words that are in the filter
	def percent_profane
		filter = Filter.all.map(&:word)
		expletives = @song.lyrics.split(' ').select {|word| filter.include?(word.downcase.gsub(/[[:punct:]]/,'')) }.count
		(expletives / @song.lyrics.split(' ').count.to_f * 100).round(2).to_s+"\% of this song is profane."
	end

	#returns lyrics with profanity highlighted in red
	def find_profanity
		filter = Filter.all.map(&:word)
		@song.lyrics.split("\n").map {|newline|
			newline.split(' ').map {|word| filter.include?( word.downcase.gsub(/[[:punct:]]/,'') ) ? word.colorize(:red) : word }.join(' ')
		}
	end
end
