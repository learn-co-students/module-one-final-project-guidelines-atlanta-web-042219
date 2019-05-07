class Song < ActiveRecord::Base
	has_many :songrequests
end