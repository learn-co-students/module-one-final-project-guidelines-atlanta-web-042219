class RemoveYearfoundedHousesTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :houses, :year_founded
  end
end
