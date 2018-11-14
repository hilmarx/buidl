class CreateUserTechnologies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_technologies do |t|

      t.timestamps
    end
  end
end
