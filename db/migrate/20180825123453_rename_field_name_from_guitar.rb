class RenameFieldNameFromGuitar < ActiveRecord::Migration[5.0]
  def change
    rename_column :guitars, :type, :guitar_type
  end
end
