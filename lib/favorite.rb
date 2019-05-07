class Favorite < ActiveRecord::Base
  has_many :users
  has_many :quotes, through: :users
end
