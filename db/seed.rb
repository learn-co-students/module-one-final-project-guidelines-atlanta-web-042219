targaryen = House.new(:name=>"Targaryen", :house_crest=>"http://assets.viewers-guide.hbo.com/larges1-houses-rgb-sigil-avatar-house-targaryen-1024x1024@2x.jpg", :year_founded=>100)
stark = House.new(:name=>"Stark", :house_crest=>"https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Stark-Main-Shield.PNG/revision/latest?cb=20170101103142", :year_founded 123)
greyjoy = House.new(:name=>"Greyjoy", :house_crest=>"https://vignette.wikia.nocookie.net/gameofthrones/images/8/86/House-Greyjoy-Main-Shield.PNG/revision/latest?cb=20170523015836", :year_founded 54)
baratheon = House.new(:name=>"Baratheon", :house_crest=>"https://awoiaf.westeros.org/images/thumb/2/2d/House_Baratheon.svg/1200px-House_Baratheon.svg.png", :year_founded=> 160)

the_north = Allegiance.new(:oath=>"For the north!", :oath_status=>true)

maryam = Member.new(:name=>"Maryam", :hometown=>"Winterfell", :life_status=>"Alive")
preston = Member.new(:name=>"Preston", :hometown=>"King's Landing", :life_status=>"Alive")
robert = Member.new(:name=>"Robert Baratheon", :hometown=>"Storm's End", :life_status=>"Dead")