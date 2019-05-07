class Song < ActiveRecord::Base
	has_many :songrequests
	attr_accessor :artist, :lyrics, :clean_lyrics
	@@all = []

	def initialize(lyrics)
		@lyrics = lyrics
		@@all << self
	end

	def self.all
		@@all
	end
end