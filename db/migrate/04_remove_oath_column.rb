class RemoveOathColumn < ActiveRecord::Migration
  def change
    remove_column :allegiances, :oath
  end
end
