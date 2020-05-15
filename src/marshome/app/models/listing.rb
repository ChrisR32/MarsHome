class Listing < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :purchases

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

  def house_type_icon(result)
    if result == 1
      "1_sml_pod.png"
    elsif result == 2
      "2_lrg_pod.png"
    elsif result == 3
      "3_classic.png"
    elsif result == 4
      "4_space_stn.png"
    elsif result == 5
      "5_unit.png"
    else
      "6_house.png"
    end
  end

  def house_type_name(result)
    if result == 1
      'Small Rural Pod'
    elsif result == 2
      'Large Rural Pod'
    elsif result == 3
      'Classic Rural Settler'
    elsif result == 4
      'Space Station Quarters'
    elsif result == 5
      'City Unit'
    else
      'City House'
    end
  end

end
