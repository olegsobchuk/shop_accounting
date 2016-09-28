class Thing < ApplicationRecord
  validates :name, :description, :price, :discount, presence: true
  validates :uid, uniqueness: true, presence: true

  belongs_to :delivery
  belongs_to :shop

  scope :by_create, -> { order(:created_at) }

  def current_place
    'current shop'
  end
end
