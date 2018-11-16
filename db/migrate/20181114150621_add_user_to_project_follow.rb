class AddUserToProjectFollow < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_follows, :profile, foreign_key: true
  end
end
