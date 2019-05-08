class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |table|
    	table.string :name
    	table.string :username
    	table.string :displayname
    	table.string :password
    end
  end
end
