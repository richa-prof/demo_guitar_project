class AddModelToGuitar < ActiveRecord::Migration[5.0]
  def change
    add_column :guitars, :model, :string
  end
end
