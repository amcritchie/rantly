class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :username, presence: true
end