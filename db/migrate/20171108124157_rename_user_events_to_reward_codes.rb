class RenameUserEventsToRewardCodes < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_events, :reward_codes
  end
end
