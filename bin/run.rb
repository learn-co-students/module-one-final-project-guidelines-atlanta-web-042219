require_relative '../config/environment'
prompt = TTY::Prompt.new

puts "Welcome to the Future Game of Thrones!"

sleep(2)

user_name = prompt.ask('How are you called?', default: ENV['USER'])
puts "#{user_name} Who's allience will you join?"

user_house = prompt.select("Choose your house", ['Targarian', 'Lannister', 'Stark'])

# def take_alliegence
  player_one = Allegiance.create(
    house: user_house = 1,
    member: user_name = 1,
    oath: "What is Dead May Never Die",
    oath_status: true
)
# end

  player_one

# def take_alliegence
#   player_one = Allegiance.create(
#     house: "#{user_house}",
#     member: "#{user_name}",
#     oath: "What is Dead May Never Die",
#     oath_status: true
# )
# end
