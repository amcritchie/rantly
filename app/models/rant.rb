class Rant < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :rant_comments
  validates :rant, length: {minimum: 140}
  validates :title, length: {maximum: 50}
  validates :title, presence: true
end