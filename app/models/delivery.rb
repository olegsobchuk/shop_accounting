class Delivery < ApplicationRecord
  validates :uid, :departure, presence: true

  has_many :things

  scope :by_create, -> { order(:created_at) }
end
