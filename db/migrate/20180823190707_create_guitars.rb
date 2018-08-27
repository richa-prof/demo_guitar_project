class CreateGuitars < ActiveRecord::Migration[5.0]
  def change
    create_table :guitars do |t|
      enable_extension "hstore"
      t.string :name
      t.hstore :preferences
      t.string :guitar_type
      t.string :strings
      t.string :brand
      t.text :description
      t.string :image
      t.string :model
      t.float :price

      t.timestamps
    end
  end
end
