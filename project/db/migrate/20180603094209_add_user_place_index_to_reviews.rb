class AddUserPlaceIndexToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :place, index:true
    add_reference :reviews, :user, index:true
  end
end
