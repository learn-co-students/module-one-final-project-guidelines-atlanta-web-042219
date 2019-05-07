class CreateSongSearches < ActiveRecord::Migration[5.2]
  def change
  	create_table :song_searches do |table|
  		table.string :user_id
  		table.string :song_id
    end
  end
end
