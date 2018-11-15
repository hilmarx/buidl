class RemoveSizeBytesFromContributions < ActiveRecord::Migration[5.2]
  def change
    remove_column :contributions, :size_bytes, :integer
  end
end
