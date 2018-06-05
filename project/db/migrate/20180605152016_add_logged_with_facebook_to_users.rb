class AddLoggedWithFacebookToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :logged_with_facebook, :boolean, default: false
  end
end
