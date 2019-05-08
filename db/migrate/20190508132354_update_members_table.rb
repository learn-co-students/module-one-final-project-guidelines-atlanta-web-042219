class UpdateMembersTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :members, :hometown
  end
end
