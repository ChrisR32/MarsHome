class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :term, acceptance: true
end
