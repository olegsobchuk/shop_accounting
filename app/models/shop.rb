class Shop < ApplicationRecord
  validates :name, :city, :address, presence: true

  has_many :things
  has_many :assistance
end
