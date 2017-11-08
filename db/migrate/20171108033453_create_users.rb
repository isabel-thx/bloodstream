class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :blood_type
      t.date :date_of_birth
      t.string :email
      t.integer :phone_number
      t.string :address
      t.boolean :verified
      t.integer :points

      t.timestamps
    end
  end
end
