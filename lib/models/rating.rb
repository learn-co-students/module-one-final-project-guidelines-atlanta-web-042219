class Rating < ActiveRecord::Base
    has_many :entries
    has_one :user, through: :entries
end