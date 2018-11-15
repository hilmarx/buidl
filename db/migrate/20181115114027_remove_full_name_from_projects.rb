class RemoveFullNameFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :full_name, :string
  end
end
