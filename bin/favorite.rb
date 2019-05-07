class Favorite
  attr_accessor :text_object, :user_who_favorited
  @@all = []


  def initialize(text_object, user_who_favorited)
    @text_object = text_object
    @user_who_favorited = user_who_favorited
    @@all << self
  end

  def self.all
    @@all
  end
end
