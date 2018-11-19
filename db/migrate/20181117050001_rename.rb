class Rename < ActiveRecord::Migration[5.2]
  def change
    remove_column :profile_technologies, :user_id
  end

end
