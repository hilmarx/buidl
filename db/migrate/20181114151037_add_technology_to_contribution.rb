class AddTechnologyToContribution < ActiveRecord::Migration[5.2]
  def change
    add_reference :contributions, :technology, foreign_key: true
  end
end
