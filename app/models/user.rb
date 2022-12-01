class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 4 }
  validates :email, uniqueness: true

  has_many :wishlists
  has_many :plants, through: :wishlists
end
