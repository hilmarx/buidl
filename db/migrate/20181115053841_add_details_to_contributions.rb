class AddDetailsToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :lines_added, :integer
    add_column :contributions, :lines_deleted, :integer
    add_column :contributions, :commits, :integer
  end
end
