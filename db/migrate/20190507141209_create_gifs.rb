class CreateGifs < ActiveRecord::Migration[5.0]
  def change
    create_table :gifs do |t|
      t.string :category
      t.string :url
      t.string :desc
    end
  end
end
