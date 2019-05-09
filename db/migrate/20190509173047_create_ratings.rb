class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :number 
    end
  end

end
