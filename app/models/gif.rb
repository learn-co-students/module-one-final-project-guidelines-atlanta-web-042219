class Gif < ActiveRecord::Base
	has_many :moods
	has_many :users, through: :moods
end
