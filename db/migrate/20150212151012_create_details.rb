class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.references :order, index: true
      t.references :dish, index: true
      t.integer :quantity

      t.timestamps null: false
    end
    add_foreign_key :details, :orders
    add_foreign_key :details, :dishes
  end
end
