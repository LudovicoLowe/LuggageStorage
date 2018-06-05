class Place < ApplicationRecord
  validates :user_id, presence: true
  validates :name, :state, :city, :address, :cap, presence: true
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :reviews
  has_attached_file :avatar, styles: { small: "200x200>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def full_address
    [state, city, address].compact.join(',')
  end

end
