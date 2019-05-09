User.destroy_all
Search.destroy_all
Song.destroy_all
Filter.destroy_all
#...

User.create(name: "Developer", username: "", displayname: "Test Mode", password: "")
Filter.set_default_filters(User.find_by(username: "").id)
