class GVController

def start
  main_menu
  end

  def main_menu
    puts "Good Menu"
    puts "1. Motivational quotes"
    puts "2. Quote billboards"
    puts "3. Favorite quotes"
    puts "4. Exit"


  case (choice.to_i)
  when 1
    motivational_quotes
  when 1
    quote_billboards  #Quote.all.random
  when 2
    favorite_quotes
  when 3
    see_my_favorites
  when 4
    exit
  else
  puts "invalid entry"
  main_menu
  end
end



# def create_quote
#   puts "Enter your inpiring words below"
#   quote_text = gets.strip
#   #get_author / ID
#
# quote = Quote.new
# quote.author = #{author.id}
# quote.body = quote_text
# quote.save
#
# puts "Thanks! You're words will help inspire the world."
# end
