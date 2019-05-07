class Song < ActiveRecord::Base
	has_many :songrequests
	attr_accessor :artist, :title, :lyrics
	@@all = []

	def initialize(artist, title, lyrics)
		@artist = artist
		@title = title
		@lyrics = lyrics
		@@all << self
	end

	def self.all
		@@all
	end

	def clean_lyrics
		filter = Filter.get_current_filter
	end
end