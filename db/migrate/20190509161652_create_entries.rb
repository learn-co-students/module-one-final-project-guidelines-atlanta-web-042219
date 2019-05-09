class CreateEntries < ActiveRecord::Migration[5.0]
  def change 
    create_table :entries do |table|
      table.string :content
      table.integer :rating_id
      table.integer :user_id
      table.timestamps
  end
end
end
