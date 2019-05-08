class Filter < ActiveRecord::Base

	def self.get_current_filter
		hash = {}
		self.all.each {|filter| hash[filter.word] = filter.replacement }
		hash
	end
end
