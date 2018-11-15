class AddTechnologyToUserTechnology < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_technologies, :technology, foreign_key: true
  end
end
