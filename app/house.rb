class House < ActiveRecord::Base
    has_many :allegiances
    has_many :members, through :allegiances
end