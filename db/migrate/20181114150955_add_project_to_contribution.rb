class AddProjectToContribution < ActiveRecord::Migration[5.2]
  def change
    add_reference :contributions, :project, foreign_key: true
  end
end
