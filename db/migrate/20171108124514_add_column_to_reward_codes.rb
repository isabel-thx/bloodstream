class AddColumnToRewardCodes < ActiveRecord::Migration[5.1]
  def change
    add_column :reward_codes, :code, :string
    add_column :reward_codes, :points, :integer
  end
end
