class AddUserToContribution < ActiveRecord::Migration[5.2]
  def change
    add_reference :contributions, :profile, foreign_key: true
  end
end
