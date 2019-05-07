class Member < ActiveRecord::Base
    has_many :allegiances
    has_many :houses, through: :allegiances
end
