class Owner < User
  validates :email, presence: true, format: { with: /\A.+@.+\..+/ }
end
