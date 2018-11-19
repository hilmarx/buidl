class ChangeSizeBytesInProjectsToKiloBytes < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :size_bytes, :size_kilobytes
  end
end
