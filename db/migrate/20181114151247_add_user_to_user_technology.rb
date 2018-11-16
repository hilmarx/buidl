class AddUserToUserTechnology < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_technologies, :profile, foreign_key: true
  end
end
