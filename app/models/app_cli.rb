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

      case @user_name
        when @user_name
          create_new_member
        else
          puts "Invalid Entry. Try Again"
      end

    puts "Where does your allegiance lye"
    @user_house = @@prompt.select("Choose your house", ["House Stark", "House Targaryen", "House Lannister"])

    case @user_house
      when @user_house
        picked_house
      else
        puts "Not an option. Try Again"
    end

    level_one
  end

  def level_one
    puts "Welcome #{@user_name.capitalize} to The North, Land of the Starks"
    sleep(1)
    puts "Your Mission: Kill the White Walker King!"
    @@prompt.select("Pick your weapon", ["Valyrian Steel", "Dragon Fire", "Steak Through the Heart", "Dragon Glass"])
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
