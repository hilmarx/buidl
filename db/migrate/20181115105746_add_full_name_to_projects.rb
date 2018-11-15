class AddFullNameToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :full_name, :string
  end
end
