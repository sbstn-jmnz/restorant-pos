class Dish < ActiveRecord::Base
	has_many :details, :dependent => :destroy
	has_many :orders, :through => :details
end
