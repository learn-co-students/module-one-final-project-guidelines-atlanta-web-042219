class CreateFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :filters do |table|
    	table.string :word
    	table.string :replacement
    end
  end
end
