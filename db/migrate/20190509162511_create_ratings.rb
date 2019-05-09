class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |table|
      table.integer :value
      table.timestamps
    end
  end
end
