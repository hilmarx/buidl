class AddDetailsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :github_description, :string
    add_column :projects, :lines_added, :integer
    add_column :projects, :lines_deleted, :integer
    add_column :projects, :commits, :integer
    add_column :projects, :archived, :boolean
  end
end
