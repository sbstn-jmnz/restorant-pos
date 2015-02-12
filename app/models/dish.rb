class Dish < ActiveRecord::Base
	has_many :ingredients, through: :ingredient_dishes
	has_many :details
end
