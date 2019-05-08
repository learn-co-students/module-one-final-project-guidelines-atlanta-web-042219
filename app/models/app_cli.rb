class AppCLI
  @@prompt = TTY::Prompt.new

  def run
    puts "Welcome to Game of Thrones 2.0!"
    # @@user_name = @@prompt.ask('How are you called?', default: ENV['USER'])
    # puts "#{@@user_name} Who's allience will you join?"
  end

  def main_menu
    puts "Create your name."
      @@user_name = gets.chomp
    # puts "2nd Pick your House"
    #   @@user_house = gets.chomp
    # puts "Make your oath"
    # puts "What is your house oath?"
    # puts "Pick 1 for Stark"
    # puts "Pick 2 for Targarian"
    # puts "Pick 3 for Lannister"
    #   @@user_oath = gets.chomp
    # puts "#{user_name} your'e now allegiant to #{Allegiance.house_id == 1}"

    case user_name
      when user_name
        create_new_member
      else
        puts "Invalid Entry. Try Again"
    end

    # case user_house
    #   when user_house
    #     #create_new_house
    #   else
    #     puts "Not an option. Try Again"
    # end

    # case user_oath
    #   when 1
    #     House.all.find(oath)Where id = 1
    #   when 2
    #     House.all.find(oath)Where id = 2
    #   when 3
    #     House.all.find(oath)Where id = 3
    #   else
    #     puts "Invalid Entry. Try Again"
    #   end
  end

  def create_new_member
    Member.create(
      name: "#{@@user_name.capitalize}",
      life_status: "Alive")
  end
end
