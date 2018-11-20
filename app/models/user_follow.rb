class UserFollow < ApplicationRecord
  belongs_to :leader, class_name: "User"
  belongs_to :follower, class_name: "User"

  validates :leader, uniqueness: { scope: :follower } ###

  def self.find_instance(profile, current_user)
    user_follow = self.find_by(leader: profile.user, follower: current_user)
    # user_follow = UserFollow.where(leader_id: profile.user.id, follower_id: current_user.id)
  end

  def follow?
     self.status == true
  end
end
