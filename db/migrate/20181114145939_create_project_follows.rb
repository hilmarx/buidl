class CreateProjectFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :project_follows do |t|

      t.timestamps
    end
  end
end
