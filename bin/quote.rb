class Quote
  attr_accessor :title, :user, :date, :quote_text
  @@all = []

  def initialize(title, user, quote_text)
    @title = title
    @user = user
    @quote_text = quote_text
    @date = Time.new
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_user(user)
    Quote.all.select do |quote_obj|
      quote_obj.user == user
    end
  end

  def self.find_by_title(title)
    Quote.all.select do |quote_obj|
      quote_obj.title == title
    end
  end

end
