require_relative '../config/environment.rb'
require 'pry'


blake = User.new("Blake")
will = User.new("Will")
best_quote = will.create_quote("This is the quote of all quotes!", "Roses are red. Violets are blue It dont always be like that but sometimes it do...")
super_quote = blake.create_quote("This is a super quote!", "Under the sun, when the coding is fun, Ill make up a quote and get things done..")
will.add_to_favorites(super_quote)
blake.add_to_favorites(best_quote)
binding.pry
0
