class Listing < ApplicationRecord
  belongs_to :user
  has_many :photos

  # validates :title, presence: true, length: {maximum: 50}
  # validates :price, presence: true
  validates :address_city, presence: true
  validates :title, presence: true
 

end
