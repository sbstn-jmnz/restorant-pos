class CreateIngredientDishes < ActiveRecord::Migration
  def change
    create_table :ingredient_dishes do |t|
      t.references :dish, index: true
      t.references :ingredient, index: true

      t.timestamps null: false
    end
    add_foreign_key :ingredient_dishes, :dishes
    add_foreign_key :ingredient_dishes, :ingredients
  end
end
