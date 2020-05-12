class Listing < ApplicationRecord
  belongs_to :user
  has_many :photos

  # validates :title, presence: true, length: {maximum: 50}
  # validates :price, presence: true
  validates :description, presence: true
  validates :title, presence: true
 
  def default_photo
    if self.photos.length > 0
      self.photos[0].image.url
    else
      "defaultsmall.png"
    end
  end

end
