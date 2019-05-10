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

Game Path:
Main Menu: Create a Member of a House 
  Before we begin the game, the user will start in the main menu and enter in their name. #create_new_member will initialize the new member with the name that they enter and default values of life_status: "Alive" and power: 100. The member's power level will increase as they progress through the game's levels. The member will also select which house to join which will initialize with default value power: 1.

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

  In level three, the member receives a prompt menu to select the character from the promopt that can Save the Starks. If the member selects the correct character, they will continue to level four.


Level Four: Highgraden(Land of the Tyrell's)
  Goal: Assassinate Joffery!!!
  prompt.yes?('Margaery Tyrell gives you a posion to kill Joffery, will it do the job?') do |q|
  q.suffix 'Kessa/Daor'
  end
  
  In level four, the member must decide whether to poison Joffery with a yes/no prompt. The correct answer will take the member to level five.


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

  In level five, the member will view a phrase from Game of Thrones and will type the response to the phrase. The response is not case sensitive, and if the member types the phrase correctly, they will continue to level six.

Level Six: Stormlands(Land of the Baratheon's)
  Goal: Help Brienna of Tarth Fullfill Her Oath!
  response = prompt.select(“Which character does Brienne of Tarth rescue?“, [“Arya”, “Bran”, “Sansa”, “Rickon”]
  if response ==  "Sansa",
  puts "At Dawn leave for King's Landing and Claim Your Throne...if you can Beat Cersi"
  else
    puts "NOOOOO, So close!"
  exit
  
  Level six requires the member to answer another prompt about which character Brienna of Tarth saves in the show. If they select the right answer, they will head to Kings Landing.

Level SEVEN: Kings Landing(Land of the Lannister's)
  Your Mission: Conquer House Lannister and defeat Queen Cersi!
  army = @@prompt.select("Choose your ARMY!!!", ["The Dothraki Army", "The Wildlings Army", "The Unsullied Army", "The Golden Company Army"]) 
  The house's power will increase or decrease depending on the army the select. If their house's power level is greater than the Lannister's, they will win the round and continue to level eight.

Level EIGHT: Goal: You made it to the Red Keep and take the Iron Throne. 
    Member will get to decide what they want to use to kill cersi.
    Upon picking a weapon their power will be put against cersi's power that randomly generated.
    Whatever power is higher wins the game.






Tables and Schema
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