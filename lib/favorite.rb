class Favorite < ActiveRecord::Base
belong_to :user
belong_to :quote
end
