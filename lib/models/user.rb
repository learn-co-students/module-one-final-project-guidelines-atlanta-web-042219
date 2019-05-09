class User < ActiveRecord::Base
    has_many :entries
    has_many :ratings, through: :entries
end