class AddColumnsToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :title, :string, null: false
  	add_column :events, :description, :string, null: false
  end
end
