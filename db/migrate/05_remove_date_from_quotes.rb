class RemoveDateFromQuotes < ActiveRecord::Migration
  def change
    remove_column :quotes, :date
  end
end
