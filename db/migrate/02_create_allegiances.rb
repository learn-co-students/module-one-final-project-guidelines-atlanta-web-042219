class CreateAllegiances < ActiveRecord::Migration
  def change
    create_table :allegiances do |t|
      t.integer :house_id
      t.integer :member_id
      t.string :oath
      t.boolean :oath_status
    end
  end
end
