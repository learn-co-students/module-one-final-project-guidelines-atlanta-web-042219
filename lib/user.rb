class User < ActiveRecord::Base
  has_many :favorites
  has_many :quotes, through: :favorites
end
