class OrdersController < ApplicationController
layout 'bootstrap'
	def index
		@orders = Order.all.includes(:dishes)
	end

	def new
		@order = Order.create
		@dishes = Dish.all
	end

	def add
		@order = Order.find(params[:id])
		@dish = Dish.find(params[:id2])
		@order.user_id = current_user.id
		@order.dishes << @dish
		@order.save
		redirect_to "/"
	end

	def order_params
    params.require(:order).permit(:title, :content, :created_at)
  end
end
