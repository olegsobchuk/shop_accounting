class Assistant < User
  validates :email, :shop_id, :first_name, :last_name, :phone_first, presence: true

  belongs_to :shop
  has_many :things, through: :shop
end
