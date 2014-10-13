class User < ActiveRecord::Base
  has_secure_password

  has_many :rants

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password_digest, presence: true
  validates :password_digest, length: {minimum: 8}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true
  validates :rant_frequency, presence: true

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end
end