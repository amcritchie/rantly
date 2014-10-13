class User < ActiveRecord::Base
  has_secure_password

  has_many :rants
  has_many :followers,
           foreign_key: :user_being_followed_id,
           class_name: "Following"
  has_many :followings,
           foreign_key: :user_following_id,
           class_name: "Following"

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