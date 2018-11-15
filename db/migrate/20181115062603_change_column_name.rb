class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_follows, :followed_id, :leader_id
  end
end
