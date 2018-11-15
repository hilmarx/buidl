class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :profile_photo, :string
    add_column :users, :cover_photo, :string
    add_column :users, :address, :string
    add_column :users, :longitude, :decimal
    add_column :users, :latitude, :decimal
    add_column :users, :github_username, :string
    add_column :users, :github_id, :integer
    add_column :users, :github_url, :string
    add_column :users, :description, :string
  end
end
