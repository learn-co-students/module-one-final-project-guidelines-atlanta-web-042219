require_relative '../config/environment'

AppCLI.new.run


# Once you get the house name, search the House class to get that "id"
# user_house = prompt.select("Choose your house", ['Targarian', 'Lannister', 'Stark'])


# 
#
# @@user_name.create_new_member
# user_house = House.create(
# name: "#{user_house}",
# house_crest: "url",
# year_founded: 1900
# )

# def no
#   puts "GOT RULES"
# end
#
# user_name.no


# 1. create user_name
# 2. pick a houses
# 3 create allegiance
# user_house.find
# def take_alliegence
#   player_one = Allegiance.create(
#     house_id: user_house = 1,
#     member_id: user_name = 1,
#     oath_status: true
# )
# end
#
#   player_one

# def take_alliegence
#   player_one = Allegiance.create(
#     house: "#{user_house}",
#     member: "#{user_name}",
#     oath_status: true
# )
# end
