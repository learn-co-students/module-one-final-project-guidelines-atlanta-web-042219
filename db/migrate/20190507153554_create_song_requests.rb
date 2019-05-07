class CreateSongRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :song_requests do |table|
      table.string :user
      table.string :song
    end
  end
end
