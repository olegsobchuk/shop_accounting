class Shop < ApplicationRecord
  validates :name, :city, :address, presence: true
end
