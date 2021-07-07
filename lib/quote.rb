class Quote < ActiveRecord::Base

  has_many :users
  has_many :favorites, through: :users
  end
