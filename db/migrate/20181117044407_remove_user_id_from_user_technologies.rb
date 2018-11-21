class RemoveUserIdFromUserTechnologies < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_technologies, :user_id
    add_reference :user_technologies, :profile, index: true
    rename_table :user_technologies, :profile_technologies
  end
end
