class CreateUserEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :user_events do |t|
      t.string :user_id
      t.string :event_id

      t.timestamps
    end
  end
end
