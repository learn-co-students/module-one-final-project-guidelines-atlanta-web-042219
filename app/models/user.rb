require 'pry'
class User < ActiveRecord::Base
   has_many :moods
   has_many :gifs, through: :moods
   has_one :rating

   def list_moods
     moods = self.moods
     moods.each do |mood|
       puts "#{mood.id}. #{mood.gif.url} \n #{mood.caption}"
     end
   end

   def retrieve_mood(id)
     Mood.all.find(id)
   end

   def retrieve_last_mood
     self.moods.last
   end

   def update_mood(id)
     mood = retrieve_mood(id)
     puts "please enter your new caption"
     new_caption = gets.chomp
     mood.update(caption: new_caption)
     puts "your new caption is #{new_caption}"
     system("say", "your new caption is #{new_caption}")
     mood
   end

   def delete_mood
     mood = retrieve_last_mood
     mood.destroy
     puts "your mood has been deleted"
     system("say", "your mood has been destroyed")
   end

   def delete_all_moods
    self.moods.destroy_all
    puts "All done!"
   end


   def user_input
     gets.chomp.downcase
   end


end
