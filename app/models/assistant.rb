class Assistant < User
  validates :first_name, :last_name, :phone_first, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.+@.+\..+/ }

  belongs_to :shop
  has_many :things, through: :shop
end
