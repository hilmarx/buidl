class CreateProjectTechnologies < ActiveRecord::Migration[5.2]
  def change
    create_table :project_technologies do |t|
      t.integer :size_bytes

      t.timestamps
    end
  end
end
