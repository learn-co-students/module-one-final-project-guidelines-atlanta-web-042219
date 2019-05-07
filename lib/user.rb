class User < ActiveRecord::Base
  has_many (:quotes, through: :favorites)
end
