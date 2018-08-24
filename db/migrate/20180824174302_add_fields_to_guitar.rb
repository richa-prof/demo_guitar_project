class AddFieldsToGuitar < ActiveRecord::Migration[5.0]
  def change
    add_column :guitars, :serial_number, :string
    add_column :guitars, :image, :string
  end
end
