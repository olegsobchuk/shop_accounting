class Assistant < User
  validates :shop_id, :first_name, :last_name, :phone_first, presence: true

  belongs_to :shop

  def can_sell
    shop.things.existing
  end
end
