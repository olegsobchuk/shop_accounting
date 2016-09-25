class Delivery < ApplicationRecord
  validates :uid, :departure, presence: true
end
