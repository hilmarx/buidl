class AddDateToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :date, :datetime
  end
end
