class AddTechnologyToProjectTechnology < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_technologies, :technology, foreign_key: true
  end
end
