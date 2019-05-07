class Allegiance < ActiveRecord::Base
    belongs_to :house
    belongs_to :member
end
