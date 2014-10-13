class Following < ActiveRecord::Base
  belongs_to :user_following, class_name: "User"
  belongs_to :user_being_followed, class_name: "User"
end
