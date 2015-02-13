class OrdersController < ApplicationController
layout 'bootstrap'

	def index
		@orders = Order.all.includes(:dishes)

	end

	def new
		@dishes = Dish.all
		@order = Order.includes(:dishes).find(params[:order_id]) if params.has_key?(:order_id)
	end

	def add
		order_id = params[:order_id]
		if order_id.nil?
			@order = Order.new()
			@order.user_id = current_user.id
		else
			@order = Order.find(order_id)
		end
		@dish = Dish.find(params[:id2])
		@order.dishes << @dish
		@order.save
		redirect_to "/orders/new?order_id=" + @order.id.to_s
	end

	def order_params
    params.require(:order).permit(:title, :content, :created_at)
  end
end
