class OrdersController < ApplicationController
	before_action :authenticate_user!
	layout 'bootstrap'

	def index
		#@orders = Order.all.includes(:dishes)
		@mis_ordenes = Order.all.includes(:dishes)
		@mis_ordenes.each do |orden|
		orden.cuenta = Order.find(orden.id).dishes.group("name").count
		orden.suma = Order.find(orden.id).dishes.sum("price")
		end		
	end

	def new
		@dishes = Dish.all
	end

	def create
		@order = Order.new()
		@order.user_id = current_user.id
		@order.save
		@order.dishes << Dish.find(params[:dish_id])
		redirect_to	edit_order_path(@order)
	end

	def edit
		@orders = Order.find(params[:id]).dishes.group("name").count
		@suma = Order.find(params[:id]).dishes.sum("price")
		@dishes = Dish.all
		@order_id = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@order.dishes << Dish.find(params[:dish_id])
		@order.save
		redirect_to	edit_order_path(@order)		
	end

	def estado
		@order = Order.find(params[:id])
		if @order.condition.nil?
			@order.condition = "cocina"
		else
		 @order.condition = params[:order][:condition]
		end
		@order.save
		redirect_to orders_path
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to	orders_url
	end

	
	def order_params
		params.require(:order).permit(:title, :content, :created_at, :condition)
	end


end
