class Dish < ActiveRecord::Base
	has_many :details
	has_many :orders, :through => :details
end
