class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :text_object
      t.string :user
    end
  end
end
