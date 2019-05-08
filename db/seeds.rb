# require_relative "../app/house.rb"
# require_relative "../app/member.rb"
# require_relative "../app/allegiance.rb"
House.destroy_all
Member.destroy_all
Allegiance.destroy_all

targaryen = House.create(
  name: "Targaryen",
  house_crest: "http://assets.viewers-guide.hbo.com/larges1-houses-rgb-sigil-avatar-house-targaryen-1024x1024@2x.jpg",
  oath: "Dragon Squad"
)
stark = House.create(
  name: "Stark",
  house_crest: "https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Stark-Main-Shield.PNG/revision/latest?cb=20170101103142",
  oath: "Winter is Coming"
)
greyjoy = House.create(
  name: "Greyjoy",
  house_crest: "https://vignette.wikia.nocookie.net/gameofthrones/images/8/86/House-Greyjoy-Main-Shield.PNG/revision/latest?cb=20170523015836",
  oath: "What is Dead may Never Die"
)
baratheon = House.create(
  name: "Baratheon",
  house_crest: "https://awoiaf.westeros.org/images/thumb/2/2d/House_Baratheon.svg/1200px-House_Baratheon.svg.png",
  oath: "Ours is the Fury"
)


maryam = Member.create(
  name: "Maryam",
  life_status: "Alive"
)
preston = Member.create(
  name: "Preston",
  life_status: "Alive"
)
robert = Member.create(
  name: "Robert Baratheon",
  life_status: "Dead"
)

ally1 = Allegiance.create(
  house_id: 1,
  member_id: 1,
  oath_status: true
)
