class ChangePointInUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :points
 	add_column :users, :points, :integer, default: 0
  end
end
