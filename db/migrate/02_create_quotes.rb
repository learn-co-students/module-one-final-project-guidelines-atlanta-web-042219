class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |q|
      q.string :quote_text
    end
  end
end
