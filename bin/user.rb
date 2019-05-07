class User
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def user_created_quotes
    Quote.all.select do |quote_obj|
      quote_obj.user == self
    end
  end

  def display_all_quotes
    Quote.all
  end

  def create_quote(title, quote_text)
    Quote.new(title, self, quote_text)
  end

  def self.all
    @@all
  end


  def add_to_favorites(text_object)
    Favorite.new(text_object, self)
  end

  def user_favorites
    Favorite.all.select do |favorite_obj|
      favorite_obj.user_who_favorited == self
    end
  end

  def delete_favorite(favorite_obj)
    #delete favorite
  end


end
