Project Contributors:
  Maryam Joseph
  Preston Elliott

User Stories:
  1.Create Member Name (Username)
  2.Member becomes allegiant to a house to begin the game
  3.Member increases in power as they progress through each level of the game
  4.Member's House can battle another house
  5.Member can lose a round of the game and reload to the closest checkpoint

Game of Thrones 2.0: 
  Welcome to our Game of Thrones Themed Game!
  Our game has multiple levels and will test your knowledge of Westeros and the characters that live there!
  Let's see if you have the skills to take the Iron Throne!

Houses
  has_many :allegiances
  has_many :members, through: :allegiances

  schema:
  create_table :houses do |t|
  t.string :name
  t.text :house_crest(url)
  t.string :oath
  t.integer :power


Allegiances
  belongs_to :houses
  belongs_to :members

  schema:
  create_table :allegiances do |t|
  t.integer :house_id
  t.integer :member_id
  t.boolean :oath_status

Members
  has_many :allegiances
  has_many :houses, through: :allegiances

  schema:
  create_table :members do |t|
  t.string :name
  t.string :life_status
  t.integer :power

Game Path
  7 Kingdoms

Main Menu: Create a Member of a House 
  Before we begin the game, the user will start in the main menu and enter in their name. #create_new_member will initialize the new member with the name that they enter and default values of life_status: "Alive" and power: 100. The member will also select which house to join which will initialize with default value power: 1.

Level One: The North(Land of the Starks)
  Goal: Kill White Walker Night King
  Pick your weapon
  A. Valyrian Steel
  B. Dragon Fire
  C. Steak Through the Heart
  D. Dragon Glass

In level one, the newly created member's goal is to defeat the Night King. They receive a prompt menu to select which weapon will help them overcome this level of the game.

Level Two: The Vale(Land of the Arryns)
  Goal: Push Lysa Arryon through the Moon Door
  prompt.yes?('LittleFinger has declared Lysa a traitor!!!. Do you execute his command?') do |q|
  q.suffix 'Kessa/Daor'
  end

In level two, the member must choose whether to believe LittleFinger and follow his command with a yes/no prompt. If they answer correctly, they will proceed to level three.

Level Three: Riverrun(Land of the Frey/Tullies)
  Goal: Stop the Red Wedding
  Who can stop the Red Wedding and Save the Starks?
  A. Ned Stark
  B. Bran Stark
  C. Aria Stark
  D. Sansa Stark



Level Four: Highgraden(Land of the Tyrell's)
  Goal: Assassinate Joffery!!!
  prompt.yes?('Margaery Tyrell gives you a posion to kill Joffery, will it do the job?') do |q|
  q.suffix 'Kessa/Daor'
  end

  #if they guess correctly, move to the next round.
  #else life_status = "dead"
  #puts "Joffery lives and He wants to play with you."
  #game restarts
  #end

Level Five: Iron Islands(Land of the Greyjoy's)
  Goal: Don't Die in the Iron Islands!
  Answer the phrase correctly:
  puts "What is Dead May Never Die"
  response = gets.chomp
  if response.downcase == "but rises again harder and stronger"
   puts "Head to the Stormlands, Cersi's head is almost yours."
   else
   puts "What is dead, will stay dead when it comes to you! Thanks Playing"
   end
  end

Level Six: Stormlands(Land of the Baratheon's)
  Goal: Help Brienna of Tarth Fullfill Her Oath!
  response = prompt.select(“Which character does Brienne of Tarth rescue?“, [“Arya”, “Bran”, “Sansa”, “Rickon”]
  if response ==  "Sansa",
  puts "At Dawn leave for King's Landing and Claim Your Throne...if you can Beat Cersi"
  else
    puts "NOOOOO, So close!"
  exit

Level SEVEN: Kings Landing(Land of the Lannister's)
##generate random number if num is > Cersies then Cersi DIES!
##if num lower than Cersi's number the User dies and GAME OVER!
  Goal: Kill Cersi and Become Ruler of Seven Realms
  puts "In order to kill cersi you must gather strength greater than her own."
  sleep(2)
  puts "Pick a number...lets see if your strong enough to overcome Cersi."

  rand(10) #=> random number 1 through 10
  response = gets.chomp
    if response > random number Cersi
        puts "Congradulations #{@@user_name}, you killed Cersie, claimed the    iron throne and freed the realm! :D"
    elseif response <= Cersi
        puts "you lose"
    else
        puts "Invalid response. Try Again"
    end
  end
