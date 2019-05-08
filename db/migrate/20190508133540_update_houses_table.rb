class UpdateHousesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :houses, :oath, :string
  end
end
