class SongRequest
	attr_accessor :user, :song
	@@all = []

	def self.all
		@@all
	end

	def initialize(user)
		@user = user
		self.class.all << self
	end

	def request(artist_name, song_title)
		response_string = RestClient.get("https://api.lyrics.ovh/v1/#{@artist_name}/#{@song_title}")
		response_hash = JSON.parse(response_string)
	end
end