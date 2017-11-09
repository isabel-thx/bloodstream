class AddEventIdToRewardCodes < ActiveRecord::Migration[5.1]
  def change
  	add_column :reward_codes, :event_id, :integer
  end
end
