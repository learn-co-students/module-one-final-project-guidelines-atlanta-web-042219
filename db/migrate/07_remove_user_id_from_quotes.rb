class RemoveUserIdFromQuotes < ActiveRecord::Migration[4.2]
  def change
    remove_column :quotes, :user_id
  end
end
