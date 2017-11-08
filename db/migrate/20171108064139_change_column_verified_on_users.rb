class ChangeColumnVerifiedOnUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :verified
 	add_column :users, :verified, :boolean, default: false 	
  end
end
