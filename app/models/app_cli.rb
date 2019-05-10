class AppCLI
  @@prompt = TTY::Prompt.new
  @@font = TTY::Font.new(:starwars)
  @@pastel = Pastel.new

  def run
    puts @@pastel.red@@font.write("Game of Thrones 2.0!")

    main_menu
  end

  def main_menu
    puts @@pastel.red.on_black.bold"How are you called?.\n"
      @user_name = gets.chomp
      sleep(1)

      case @user_name
        when @user_name
          create_new_member
        else
          puts "Invalid Entry. Try Again"
      end

    puts @@pastel.red.on_black.bold"Where does your allegiance lye...\n\n"
    sleep(2)
    @user_house = @@prompt.select("Choose your house\n", ["House Stark", "House Targaryen", "House Lannister"])

    case @user_house
      when @user_house
        picked_house
      else
        puts "Not an option. Try Again\n"
    end
    $checkpoint = 1
    level_one
  end

  def level_one
    puts @@pastel.blue.on_black.bold"Welcome to the North #{@user_name.capitalize}, land of the Starks.\n\n"
    sleep(1)
    puts "Your Mission: Kill the White Walker Night King!\n"
    sleep(2)
    weapon = @@prompt.select("Pick your weapon\n", ["Valyrian Steel", "Dragon Fire", "Steak Through the Heart", "Dragon Glass"])
      if weapon == "Valyrian Steel" || weapon == "Dragon Glass"
        sleep(1)
        puts "You defeated the Night King!\n\n"
        @new_user.power += 50
        puts "You're getting stronger! Your power level is now #{@new_user.power}.\n\n"
      else @new_user.life_status = "Dead"
        sleep(1)
        puts "The Night King killed you, and you're now part of the undead army.\n\n"
        die($checkpoint)
      end
    sleep(2)
    level_two
  end

  def level_two
    puts "Welcome to the Vale #{@user_name.capitalize}, land of the Arryns.\n\n"
    sleep(1)
    puts "\nYour Mission: Push Lysa Arryon through the Moon Door!\n\n"
    response = @@prompt.select("LittleFinger has declared Lysa a traitor!!!. Do you execute his command?\n", ["Kessa", "Doar"])
      if response == "Doar"
        puts "You saved Lysa and the real traitor, LittleFinger, has fallen through the moon door!\n\n"
        @new_user.power += 50
        puts "You're getting stronger! Your power level is now #{@new_user.power}.\n\n"
      else @new_user.life_status = "Dead"
        puts "Look you can FLY!! HAHHAHAHA!!!\n\n"
        die($checkpoint)
      end
      puts "checkpoint reached!\n\n"
      $checkpoint = 3
      sleep(2)
      level_three
  end

  def level_three
    puts "Welcome to Riverrun #{@user_name.capitalize}, land of the Freys.\n\n"
    sleep(1)
    puts "Your Mission: Stop the Red Wedding\n\n"
    response = @@prompt.select("Who can stop the Red Wedding and Save the Starks?\n", ["Ned Stark", "Bran Stark", "Arya Stark", "Sansa Stark"])
      if response == "Arya Stark"
        puts "Where are the Freys?\n\n"
        @new_user.power += 50
        puts "You're getting stronger! Your power level is now #{@new_user.power}.\n\n"
      else @new_user.life_status = "Dead"
        puts "YOU KILLED THE STARKS!!! SHAME, SHAME, SHAME\n\n"
        die($checkpoint)
      end
      sleep(2)
      level_four
  end

  def level_four
    puts "Welcome to Highgarden #{@user_name.capitalize}, land of the Tyrells.\n"
    sleep(1)
    puts "Your Mission: Assassinate Joffery!!!\n"
    response = @@prompt.select("Margaery Tyrell gives you a posion to kill Joffery, will it do the job?\n", ["Kessa", "Doar"])
      if response == "Doar"
        puts "The purple wedding was a beautiful affair.\n"
        @new_user.power += 50
        puts "You're getting stronger! Your power level is now #{@new_user.power}.\n"
      else @new_name.life_status = "Dead"
        puts "Joffery lives and He wants to play with you.\n"
        # die($checkpoint)
      end
    sleep(2)
    level_five
  end

  def level_five
    puts "Welcome to Iron Islands #{@user_name.capitalize}, land of the Greyjoys.\n"
    sleep(1)
    puts "Your Mission: Don't Die in the Iron Islands!\n"
    puts "Respond to the phrase correctly: What is Dead May Never Die\n"
    response = gets.chomp
      if response.downcase == "but rises again harder and stronger"
        puts "Head to the Stormlands, Cersi's head is almost yours.\n"
        @new_user.power += 50
        puts "You're getting stronger! Your power level is now #{@new_user.power}.\n"
      else @new_user.life_status = "Dead"
        puts "What is dead, will stay dead when it comes to you! Thanks for playing.\n"
        # die($checkpoint)
      end
    sleep(2)
    level_six
  end

  def level_six
    puts "Welcome to the Stormlands #{@user_name.capitalize}, land of the Baratheons.\n"
    sleep(1)
    puts "Your Mission: Help Brienna of Tarth Fullfill Her Oath!\n"
    response = @@prompt.select("Which character does Brienne of Tarth rescue?", ["Arya", "Bran", "Sansa", "Rickon"])
      if response ==  "Sansa"
        puts "At Dawn leave for King's Landing and Claim Your Throne...if you can Beat Cersi\n"
        @new_user.power += 50
        puts "You're getting stronger! Your power level is now #{@new_user.power}.\n"
      else
        puts "NOOOOO, So close!\n"
        # die($checkpoint)
      end
    sleep(2)
    level_seven_battle_scene
  end

  def level_seven_battle_scene
    puts "Welcome to Kingslanding #{@user_name.capitalize}, land of the Lannisters\n"
    sleep(1)
    puts "Your Mission: Conquer House Lannister and defeat Queen Cersi!\n"
    sleep(1)
    puts "Get ready... Attack House Lannister!\n"


    lannister_house = rand(1..5)

    army = @@prompt.select("Choose your ARMY!!!", ["The Dothraki Army", "The Wildlings Army", "The Unsullied Army", "The Golden Company Army"])

    battle_house = House.where(name: @user_house)

      battle_house.map do |house|
      if @user_house == house.name && army == "The Dothraki Army"
        house.power += rand(1..50)
        house.power > lannister_house
          puts "your house power increased to #{house.power} and you defeated the Lannister army. You'll now battle Cersi.\n"

      elsif @user_house == house.name && army == "The Wildlings Army"
        house.power += rand(1..1000)
        house.power > lannister_house
          puts "Your army of Wildlings crushed the Lannisters. You'll now battle Cersi.\n"
          puts "your house power increased to #{house.power} and you defeated the Lannister army\n"

      elsif @user_house == house.name && army == "The Unsullied Army"
        house.power += rand(1..500)
        puts "Your house power increased to #{house.power}. Your army of Unsullied speared every Lannister in sight! You'll now battle Cersi.\n"
      elsif @user_house == house.name && army == "The Golden Company Army"
        house.power -= rand(1..10)
        puts "The Golden Company has betrayed you, and you will now die.\n"
        puts "The Lannisters crushed your army. You will suffer under Cersi!\n"
        exit
      end
    end
    sleep(2)
    level_eight
  end

  def level_eight
    puts "You made it to the Red Keep and want for the throne.\n"
    fight = @@prompt.select("What will you use to kill Queen Cersi?", ["White Walker's Ice Blade", "The Nightfall", "Crossbow"])
    @new_user.power += 50
    battle_cersi
  end

  def create_new_member
    @new_user = Member.create(
      name: "#{@user_name.capitalize}",
      life_status: "Alive",
      power: 100)
      puts "Hi #{@new_user.name}! \nWelecome to level one you're currently #{@new_user.life_status.downcase} with a power level of #{@new_user.power}.
      \n"
  end

  def battle_cersi
    cersi_power = rand(1..550)
    if @new_user.power > cersi_power
      puts "Your power level reached #{@new_user.power}!\n"
      puts "You defeat Queen Cersi! Take your seat on the iron throne!\n"
      exit
    else
      puts "Queen Cersi will rule the seven kingdoms F O R E V E R \n"
      exit
    end
  end

  def picked_house
    House.all.find do |house|
      if @user_house == house.name
          # house.power = 100
        sleep(2)
        puts "\n#{@user_name.capitalize} you picked #{house.name}! Your oath is #{house.oath}!\n"
        puts "\nYour house power level is #{house.power}\n\n"
      end
    end
  end

  def die(checkpoint)
    # system("clear")
    puts "restoring checkpoint...\n Press ENTER to continue...\n"
    gets
    case checkpoint
    when 1
      self.level_one
    when 3
      self.level_three
    when 5
      self.level_five
    end
  end
end
