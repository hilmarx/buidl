class AddUserToContribution < ActiveRecord::Migration[5.2]
  def change
    add_reference :contributions, :user, foreign_key: true
  end
end
