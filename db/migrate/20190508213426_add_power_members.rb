class AddPowerMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :power, :integer
  end
end
