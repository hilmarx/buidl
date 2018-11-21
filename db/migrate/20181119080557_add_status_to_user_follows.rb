class AddStatusToUserFollows < ActiveRecord::Migration[5.2]
  def change
    add_column :user_follows, :status, :boolean, null: false, default: true
  end
end
