User.destroy_all
Search.destroy_all
Song.destroy_all
Filter.destroy_all
#...

User.create(name: "Developer", username: "", displayname: "Test Mode", password: "")
Default_Filters.run(User.find_by(username: "").id)
