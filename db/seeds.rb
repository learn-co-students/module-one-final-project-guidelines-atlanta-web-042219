# require_relative "../app/house.rb"
# require_relative "../app/member.rb"
# require_relative "../app/allegiance.rb"
House.destroy_all
Member.destroy_all
Allegiance.destroy_all

targaryen = House.create(
  name: "House Targaryen",
  house_crest: "http://assets.viewers-guide.hbo.com/larges1-houses-rgb-sigil-avatar-house-targaryen-1024x1024@2x.jpg",
  oath: "Fire and Blood",
  power: 1
)
stark = House.create(
  name: "House Stark",
  house_crest: "https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Stark-Main-Shield.PNG/revision/latest?cb=20170101103142",
  oath: "Winter is Coming",
  power: 1
)
lannister = House.create(
  name: "House Lannister",
  house_crest: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQktGBMO6TTXC6W4LANKuvb94JKrZS3WXx_c4l72FpGYA8MydNCwg",
  oath: "A Lannister always pays his debts!",
  power: 1
)
# greyjoy = House.create(
#   name: "House Greyjoy",
#   house_crest: "https://vignette.wikia.nocookie.net/gameofthrones/images/8/86/House-Greyjoy-Main-Shield.PNG/revision/latest?cb=20170523015836",
#   oath: "What is Dead May Never Die"
# )
# baratheon = House.create(
#   name: "House Baratheon",
#   house_crest: "https://awoiaf.westeros.org/images/thumb/2/2d/House_Baratheon.svg/1200px-House_Baratheon.svg.png",
#   oath: "Fire and Blood"
# )


maryam = Member.create(
  name: "Maryam",
  life_status: "Alive",
  power: 1000
)
preston = Member.create(
  name: "Preston",
  life_status: "Alive",
  power: 500
)
robert = Member.create(
  name: "Robert Baratheon",
  life_status: "Dead",
  power: 300
)

player_one = Allegiance.create(
  house_id: targaryen.id,
  member_id: maryam.id,
  oath_status: true
)
player_two = Allegiance.create(
  house_id: stark.id,
  member_id: preston.id,
  oath_status: true
)
player_three = Allegiance.create(
  house_id: lannister.id,
  member_id: robert.id,
  oath_status: true
)
