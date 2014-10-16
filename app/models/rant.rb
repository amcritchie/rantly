class Rant < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  validates :rant, length: {minimum: 140}
  validates :rant, presence: true
  validates :title, presence: true
end