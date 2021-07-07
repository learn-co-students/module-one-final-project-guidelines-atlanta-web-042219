class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.text :house_crest
      t.integer :year_founded
    end
  end
end
