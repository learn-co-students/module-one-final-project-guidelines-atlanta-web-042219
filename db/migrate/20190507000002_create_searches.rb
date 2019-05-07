class CreateSearches < ActiveRecord::Migration[5.2]
  def change
  	create_table :searches do |table|
  		table.string :user_id
  		table.string :song_id
    end
  end
end
