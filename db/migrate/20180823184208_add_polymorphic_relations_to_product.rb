class AddPolymorphicRelationsToProduct < ActiveRecord::Migration[5.0]
  create_table :products do |t|
    t.string :category_type
    t.integer :category_id
    t.string :serial_number
    t.timestamps
  end
end
