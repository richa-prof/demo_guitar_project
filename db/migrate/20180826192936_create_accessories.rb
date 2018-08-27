class CreateAccessories < ActiveRecord::Migration[5.0]
  def change
    create_table :accessories do |t|
      t.string :name
      t.text :description
      t.string :brand
      t.string :image
      t.float :price


      t.timestamps
    end
  end
end
