class AddParamsToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :profile_photo, :string
    add_column :profiles, :github_url, :string
    add_column :profiles, :description, :string
    add_column :profiles, :full_name, :string
  end
end
