class AddDisplayNameToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :display_name, :string, null: false
    add_index :users, :display_name, unique: true
  end
end
