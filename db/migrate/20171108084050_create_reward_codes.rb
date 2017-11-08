class CreateRewardCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :reward_codes do |t|
      t.string :code
      t.integer :points
      t.integer :donor_id

      t.timestamps
    end
  end
end
