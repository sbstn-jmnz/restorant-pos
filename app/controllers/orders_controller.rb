class OrdersController < ApplicationController
layout 'bootstrap'

	def index
		@orders = Order.all.includes(:dishes)

	end

	def new
		@dishes = Dish.all
	end

	def create
		@order = Order.new()
		#@order.user_id = current_user.id
		@order.save
		@order.dishes << Dish.find(params[:dish_id])
		redirect_to	edit_order_path(@order)
	end

	def edit
		@orders = Order.find(params[:id]).dishes.group("name").count
		@dishes = Dish.all
		@order_id = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@order.dishes << Dish.find(params[:dish_id])
		@order.save
		redirect_to	edit_order_path(@order)		
	end

	def order_params
    	params.require(:order).permit(:title, :content, :created_at)
    end
end
