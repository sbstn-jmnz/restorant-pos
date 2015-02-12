class Ingredient < ActiveRecord::Base
	has_many :dishes, through: :ingredient_dishes
end
