class Review < ActiveRecord::Base

  belongs_to :place
  belongs_to :user
  before_create :has_review?

  def has_review?
    return if Review.exists?(user_id: user, place_id: place)
  end
end