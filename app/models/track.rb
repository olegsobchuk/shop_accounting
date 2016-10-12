class Track < ApplicationRecord
  belongs_to :thing
  belongs_to :shop

  validates :price, presence: true
end
