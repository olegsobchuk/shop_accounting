class Thing < ApplicationRecord
  validates :name, :description, :price, :discount, presence: true
  validates :uid, uniqueness: true, presence: true

  belongs_to :delivery
  belongs_to :shop

  scope :by_create, -> { order(:created_at) }
  scope :existing, -> { where.not(sold: true) }

  def sold!
    update(sold: true, sold_date: DateTime.current)
  end
end
