class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :hometown
      t.string :life_status
    end
  end
end
