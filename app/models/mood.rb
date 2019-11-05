class Mood < ActiveRecord::Base
  belongs_to :user
  belongs_to :gif


  def self.list_all
    Mood.all.each do |mood|
      puts "#{mood.id}. #{mood.gif.url} \n #{mood.caption}"
    end 
  end

end
