class Admin < User
  validates :first_name, :last_name, :phone_first, presence: true
end
