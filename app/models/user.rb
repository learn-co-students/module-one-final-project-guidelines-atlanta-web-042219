require 'pry'
class User < ActiveRecord::Base
   has_many :moods
   has_many :gifs, through: :moods

   def list_moods
     moods = self.moods
     moods.each do |mood|
       # binding.pry
     puts "#{mood.id}. #{mood.gif.url} \n #{mood.caption}"
     end
   end

   def retrieve_mood(id)
     Mood.all.find(id)
   end

   def update_mood(id)
     mood = retrieve_mood(id)
     new_caption = gets.chomp
     mood.update(caption: new_caption)
     puts "your new caption is #{new_caption}"
     mood
   end

<<<<<<< HEAD
=======

>>>>>>> b25e3e5e53f50f4394996cc50f44451346fff720
   def delete_moods
     list_moods
     puts "If you're sure you want to delete your previous gifs, please type 'yes'"
     decision = user_input
     if decision == 'yes' 
       self.moods.destroy_all
       puts "All done!"
     end
   end


   def user_input
     gets.chomp.downcase
   end

end
