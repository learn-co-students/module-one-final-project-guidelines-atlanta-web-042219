# require_relative "../app/house.rb"
# require_relative "../app/member.rb"
# require_relative "../app/allegiance.rb"
House.destroy_all
Member.destroy_all
Allegiance.destroy_all

targaryen = House.create(
  name: "Targaryen",
  house_crest: "http://assets.viewers-guide.hbo.com/larges1-houses-rgb-sigil-avatar-house-targaryen-1024x1024@2x.jpg",
  year_founded: 100
)
stark = House.create(
  name: "Stark",
  house_crest: "https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Stark-Main-Shield.PNG/revision/latest?cb=20170101103142",
  year_founded: 123
)
greyjoy = House.create(
  name: "Greyjoy",
  house_crest: "https://vignette.wikia.nocookie.net/gameofthrones/images/8/86/House-Greyjoy-Main-Shield.PNG/revision/latest?cb=20170523015836",
  year_founded: 54
)
baratheon = House.create(
  name: "Baratheon",
  house_crest: "https://awoiaf.westeros.org/images/thumb/2/2d/House_Baratheon.svg/1200px-House_Baratheon.svg.png",
  year_founded: 160
)


maryam = Member.create(
  name: "Maryam",
  hometown: "Winterfell",
  life_status: "Alive"
)
preston = Member.create(
  name: "Preston",
  hometown: "King's Landing",
  life_status: "Alive"
)
robert = Member.create(
  name: "Robert Baratheon",
  hometown: "Storm's End",
  life_status: "Dead"
)

ally1 = Allegiance.create(
  house_id: 1,
  member_id: 1,
  oath_status: true
)
