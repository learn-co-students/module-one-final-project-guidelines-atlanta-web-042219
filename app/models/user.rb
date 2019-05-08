class User < ActiveRecord::Base
  has_many :favorites
  has_many :quotes, through: :favorites


  def create_new_quote(title, date, quote_text)
    Quote.create(title: title, date: date, quote_text: quote_text)
  end

  def delete_a_favorite_quote(quote_title)
    Favorite.find_by(name: title).destroy
  end


  # def find_quote_by_title(title)
  #   if !Quote.find_by(name: title)
  #     puts "I could not find that quote!"
  #   else
  #     Quote.find_by(name: title)
  #   end


  def see_my_favorites
    Favorite.find_by(user: self)
  end

end
