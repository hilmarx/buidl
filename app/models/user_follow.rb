class UserFollow < ApplicationRecord
  belongs_to :leader, class_name: "User"
  belongs_to :follower, class_name: "User"

  # ADD VALIDATION FOR UNIQUENESS BETWEEN THE LEADER/FOLLOWER COMBO
end
