class User < ActiveRecord::Base
	has_many :searches
	has_many :filters
end
