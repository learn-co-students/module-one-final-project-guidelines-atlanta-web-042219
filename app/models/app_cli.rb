class AppCLI
  @@prompt = TTY::Prompt.new

  def run
    puts "Welcome to Game of Thrones 2.0!"

    main_menu
  end

  def main_menu
    puts "Create your name."
      @user_name = gets.chomp
      sleep(1)
    puts "2nd Pick your House"
    @user_house = @@prompt.select("Choose your house", ["House Stark", "House Targaryen", "House Lannister"])

    case @user_name
      when @user_name
        create_new_member
      else
        puts "Invalid Entry. Try Again"
    end

    case @user_house
      when @user_house
        picked_house
      else
        puts "Not an option. Try Again"
    end
  end

  def create_new_member
    new_user = Member.create(
      name: "#{@user_name.capitalize}",
      life_status: "Alive")
      puts "Hi #{new_user.name}! Welecome to level one your'e currently #{new_user.life_status}"
  end


  def picked_house
    House.all.find do |house|
      if @user_house == house.name
         puts "#{@user_name.capitalize} you picked #{house.name}! your oath is #{house.oath}!"
       end
    end
  end
end
