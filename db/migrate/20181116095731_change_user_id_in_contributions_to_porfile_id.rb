class ChangeUserIdInContributionsToPorfileId < ActiveRecord::Migration[5.2]
  def change
    rename_column :contributions, :user_id, :profile_id
  end
end
