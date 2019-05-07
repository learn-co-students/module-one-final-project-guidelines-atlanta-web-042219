class Song < ActiveRecord::Base
	has_many :searches
end