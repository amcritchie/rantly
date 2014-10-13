class Rant < ActiveRecord::Base
  belongs_to :user

  validates :rant, length: {minimum: 140, maximum: 800}
  validates :rant, presence: true
  validates :title, presence: true
end