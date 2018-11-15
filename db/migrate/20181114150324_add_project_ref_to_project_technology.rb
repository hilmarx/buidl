class AddProjectRefToProjectTechnology < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_technologies, :project, foreign_key: true
  end
end
