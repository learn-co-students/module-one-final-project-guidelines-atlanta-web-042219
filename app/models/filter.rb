class Filter < ActiveRecord::Base

	# returns a hash {word => replacement, etc...}
	def self.get_current_filter
		hash = {}
		self.all.each{|filter| hash[filter.word] = filter.replacement }
	end
end
