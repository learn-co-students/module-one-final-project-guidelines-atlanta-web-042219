class Allegiance < ActiveRecord::Base
    belongs_to :house
    belongs_to :member

    def no
      puts "no means no"
    end
end
