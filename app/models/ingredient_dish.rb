class IngredientDish < ActiveRecord::Base
  belongs_to :dish
  belongs_to :ingredient
end
