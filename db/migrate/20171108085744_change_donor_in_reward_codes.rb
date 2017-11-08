class ChangeDonorInRewardCodes < ActiveRecord::Migration[5.1]
  def change
  	remove_column :reward_codes, :donor_id
 	add_column :reward_codes, :user_id, :integer
  end
end
