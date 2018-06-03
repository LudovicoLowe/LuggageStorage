class AddUserIdToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :user_id, :integer
    add_index :places, :user_id
  end
end