class Review < ActiveRecord::Base

  belongs_to :place
  belongs_to :user
  before_create :has_review?

  validates :comment, presence: true
  validates :rating, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 5}

  def has_review?
    return if Review.exists?(user_id: user, place_id: place)
  end
end