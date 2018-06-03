class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :omniauthable, omniauth_providers: %i[facebook]

  has_one :place
  has_many :reviews
  has_attached_file :avatar, validate_media_type: false
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid:auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.surname = auth.info.surname
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
