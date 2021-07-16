class User < ApplicationRecord
  has_secure_password
  has_many :calories
  has_many :notepads

  EMAIL_FORMAT_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: EMAIL_FORMAT_REGEX }, uniqueness: true
  validates :password, presence: true
end
