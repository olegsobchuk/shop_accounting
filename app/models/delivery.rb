class Delivery < ApplicationRecord
  validates :uid, :departure, presence: true

  scope :by_create, -> { order(:created_at) }
end
