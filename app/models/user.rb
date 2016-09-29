class User < ApplicationRecord
  has_secure_password

  validates :password, presence: { message: 'Should be present if Confirmation password' }, if: 'password_confirmation.present?'
  validates :password_confirmation, confirmation: true, if: :password_digest_changed?
end
