class AddUsersToUserFollow < ActiveRecord::Migration[5.2]
  def change
    add_column :user_follows, :followed_id, :integer
    add_column :user_follows, :follower_id, :integer
  end
end
