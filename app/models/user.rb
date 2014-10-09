class User < ActiveRecord::Base
  has_secure_password

  has_many :rants

  validates :username, presence: true
end