class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :state
      t.string :city
      t.string :address
      t.string :cap

      t.timestamps
    end
  end
end
