class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :user do |table|
      table.string :name
  end
end
end 