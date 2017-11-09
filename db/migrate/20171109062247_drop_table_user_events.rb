class DropTableUserEvents < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_events
  end
end
