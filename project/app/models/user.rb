class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :omniauthable, omniauth_providers: %i[facebook]

  validates :name, :presence => true
  validates :surname, :presence => true
  validates :phone_number, :presence => true
  validates :email, :presence => true, :uniqueness => true

  has_one :place
  has_many :reviews
  has_attached_file :avatar, validate_media_type: false
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  mount_uploader :image, ImageUploader

  def is_admin(user)
    user.admin
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid:auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
      user.phone_number = auth.info.phone
      user.logged_with_facebook = true
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name = data["name"]
        user.surname = data["surname"]
      end
    end
  end
end
