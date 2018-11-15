class RemoveTechnologyIdFromContributions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :contributions, :technology, foreign_key: true
  end
end
