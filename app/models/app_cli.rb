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
    puts "Welcome to the North #{@user_name.capitalize}, land of the Starks."
    sleep(1)
    puts "Your Mission: Kill the White Walker King!"
    weapon = @@prompt.select("Pick your weapon", ["Valyrian Steel", "Dragon Fire", "Steak Through the Heart", "Dragon Glass"])
      if weapon == "Valyrian Steel" || weapon == "Dragon Glass"
        puts "You defeated the Night King!"
      else @new_user.life_status = "Dead"
        puts "The Night King killed you, and you're now part of the undead army."
        exit
      end
    level_two
  end

  def level_two
    puts "Welcome to the Vale #{@user_name.capitalize}, land of the Arryns."
    sleep(1)
    puts "Your Mission: Push Lysa Arryon through the Moon Door!"
    response = @@prompt.select("LittleFinger has declared Lysa a traitor!!!. Do you execute his command?", ["Kessa", "Doar"])
      if response == "Doar" 
        puts "You saved Lysa and the real traitor, LittleFinger, has fallen through the moon door!"
      else @new_user.life_status = "Dead"
        puts "Look you can FLY!! HAHHAHAHA!!!"
        exit
      end
      level_three
  end

  def level_three 
    puts "Welcome to Riverrun #{@user_name.capitalize}, land of the Freys."
    sleep(1)
    puts "Your Mission: Stop the Red Wedding"
    response = @@prompt.select("Who can stop the Red Wedding and Save the Starks?", ["Ned Stark", "Bran Stark", "Arya Stark", "Sansa Stark"])
      if response == "Arya Stark"
        puts "Where are the Freys?"
      else @new_user.life_status = "Dead"
        puts "YOU KILLED THE STARKS!!! SHAME, SHAME, SHAME"
        exit
      end
      level_four
  end

  def level_four
    puts "Welcome to Highgarden #{@user_name.capitalize}, land of the Tyrells."
    sleep(1)
    puts "Your Mission: Assassinate Joffery!!!"
    response = @@prompt.select("Margaery Tyrell gives you a posion to kill Joffery, will it do the job?", ["Kessa", "Doar"])
      if response == "Doar"
        puts "The purple wedding was a beautiful affair."
      else @user_name.life_status = "Dead"
        puts "Joffery lives and He wants to play with you."
        exit
      end
    level_five
  end

  def level_five
    puts "Welcome to Iron Islands #{@user_name.capitalize}, land of the Greyjoys."
    sleep(1)
    puts "Your Mission: Don't Die in the Iron Islands!"
    puts "Respond to the phrase correctly: What is Dead May Never Die"
    response = gets.chomp 
      if response.downcase == "but rises again harder and stronger"
        puts "Head to the Stormlands, Cersi's head is almost yours."
      else @user_name.life_status = "Dead"
        puts "What is dead, will stay dead when it comes to you! Thanks for playing."
        exit
      end
      level_six
  end

  def level_six
    puts "Welcome to the Stormlands #{@user_name.capitalize}, land of the Baratheons."
    sleep(1)
    puts "Your Mission: Help Brienna of Tarth Fullfill Her Oath!"
    response = @@prompt.select("Which character does Brienne of Tarth rescue?", ["Arya", "Bran", "Sansa", "Rickon"])
      if response ==  "Sansa"
        puts "At Dawn leave for King's Landing and Claim Your Throne...if you can Beat Cersi"
      else
        puts "NOOOOO, So close!"
        exit
      end
      level_seven
  end

  def level_seven
    
  end

  def create_new_member
    @new_user = Member.create(
      name: "#{@user_name.capitalize}",
      life_status: "Alive")
      puts "Hi #{@new_user.name}! Welecome to level one your'e currently #{@new_user.life_status}"
  end


  def picked_house
    House.all.find do |house|
      if @user_house == house.name
         puts "#{@user_name.capitalize} you picked #{house.name}! your oath is #{house.oath}!"
       end
    end
  end

end
