class AddUserToUserTechnology < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_technologies, :user, foreign_key: true
  end
end
