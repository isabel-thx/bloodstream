class ChangeRewardCodesTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :reward_codes, :attendees
  end
end
