class OrdersController < ApplicationController

	def index
	 @orders = Order.all
	 render
	end	

	def new
	 @order = Order.new
	end

	def create
	 @order = Order.new(order_params)
	 if @order.save
	 	redirect_to orders_url
	 else
	 	render :new
	 end
	end

	private
	 	def order_params
	 		params.fetch(:order,{}).permit(:menu_name,:customer_name,:restaurant_name)
	 	end
end
