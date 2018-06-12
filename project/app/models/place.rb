class Place < ApplicationRecord
  validates :user_id, presence: true
  validates :name, :state, :city, :address, :cap, presence: true
  geocoded_by :full_address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :reviews

  def full_address
    [state, city, address, cap].join(',')
  end

end
