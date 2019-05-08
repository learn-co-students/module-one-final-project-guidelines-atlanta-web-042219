class Filter < ActiveRecord::Base
	belongs_to :user
	
	def self.get_current_filter
		hash = {}
		self.all.each {|filter| hash[filter.word] = filter.replacement }
		hash
	end
end
