class AddPower < ActiveRecord::Migration[5.0]
  def change
    add_column :houses, :power, :integer
  end
end
