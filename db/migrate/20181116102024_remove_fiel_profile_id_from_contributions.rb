class RemoveFielProfileIdFromContributions < ActiveRecord::Migration[5.2]
  def change
    remove_column :contributions, :profile_id
    add_reference :contributions, :profile, index: true, foreign_key: true
  end
end
