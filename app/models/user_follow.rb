class UserFollow < ApplicationRecord
  belongs_to :leader, class_name: "User"
  belongs_to :follower, class_name: "User"

  validates :leader, uniqueness: { scope: :follower }
end
