class User < ActiveRecord::Base
  has_secure_password

  has_many :rants
  has_many :followers,
           foreign_key: :user_being_followed_id,
           class_name: "Following"
  has_many :followings,
           foreign_key: :user_following_id,
           class_name: "Following"

  mount_uploader :image, AvatarUploader

  has_many :rant_comments


  validates :username, presence: {message: "Username can't be blank"}
  validates :username, uniqueness: {message: "Username has already been taken"}
  validates :password_digest, presence: {message: "Password can't be Blank"}
  validates :password_digest, length: {minimum: 8, message: "Password must be at least eight characters"}
  validates :first_name, presence: {message: "Please enter first name"}
  validates :last_name, presence: {message: "Please enter last name"}
  validates :bio, presence: {message: "Please describe yourself"}
  validates :rant_frequency, presence: {message: "How often do you rant"}

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end

end