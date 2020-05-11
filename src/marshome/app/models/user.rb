class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable

  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
  has_many :listings
  has_many :rating_totals
  has_many :messages
  # has_one :phones
  # has_one :emails
  # has_one :profile_pictures

def self.from_omniauth(auth)
  user = User.where(email: auth.info.email).first

  if user
    return user
  else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.first_name = auth.info.first_name   # assuming the user model has a name
        user.last_name = auth.info.last_name   # assuming the user model has a name
        user.image_fb = auth.info.image_fb # assuming the user model has an image

        user.uid = auth.uid
        user.provider = auth.provider
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        user.skip_confirmation!
      end
    end
  end
end
