class CreateSongs < ActiveRecord::Migration[5.2]
  def change
  	create_table :songs do |table|
  		table.string :artist
    	table.string :lyrics
    end
  end
end
