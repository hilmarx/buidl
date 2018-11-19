class DropProfileTechnologyTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :profile_technologies
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
