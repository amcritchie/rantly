class Session < ActiveRecord::Base
  # validates :rant, length: {minimum: 140}
  validates :username, :presence => {:message => "Username needed"}
end