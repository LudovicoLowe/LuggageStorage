class RemoveAvatarColumnsFromPlace < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :avatar_file_name, :string
    remove_column :places, :avatar_content_type, :string
    remove_column :places, :avatar_file_size, :string
    remove_column :places, :avatar_updated_at, :string
  end
end
