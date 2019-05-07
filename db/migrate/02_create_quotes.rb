class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |q|
      q.string :title
      q.string :user
      q.integer :date
      q.string :quote_text
    end
  end
end
