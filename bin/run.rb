require_relative '../config/environment'
require 'pry'

# InstamoodRun.new.run
#
user1 = User.all[0]

# InstamoodRun.new.welcome
user1.update_mood(17)
binding.pry
0
