class OrdersController < ApplicationController
layout 'bootstrap'
	def index
		@orders = Order.all
	end
end
