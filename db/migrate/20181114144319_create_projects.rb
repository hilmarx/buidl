class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :github_url
      t.string :url
      t.string :photo
      t.integer :owner_id
      t.boolean :public
      t.string :primary_language
      t.integer :size_bytes

      t.timestamps
    end
  end
end
