class ChangeTypeInTechnologyToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :technologies, :type, :category
  end
end
