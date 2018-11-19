class AddProfileToProfileTechnoligies < ActiveRecord::Migration[5.2]
  def change
    add_reference :profile_technologies, :profile, foreign_key: true
  end
end
