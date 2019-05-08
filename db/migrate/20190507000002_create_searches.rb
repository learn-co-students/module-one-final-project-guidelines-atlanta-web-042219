class CreateSearches < ActiveRecord::Migration[5.2]
  def change
  	create_table :searches do |table|
  		table.integer :user_id
  		table.integer :song_id
    end
  end
end
