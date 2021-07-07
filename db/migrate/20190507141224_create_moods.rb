class CreateMoods < ActiveRecord::Migration[5.0]
  def change
    create_table :moods do |t|
      t.integer :gif_id
      t.integer :user_id
      t.string :caption
      t.timestamps
    end
  end
end
