class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :organizer, null: false
      t.string :venue, null: false
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.float :latitude, default: 0
      t.float :longitude, default: 0

      t.timestamps
    end
  end
end
