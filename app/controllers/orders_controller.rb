class OrdersController < ApplicationController

	def index
	 @orders = Order.all
	 @menus = Menu.all
	 render
	end	

	def new
	 @order = Order.new
	 @menus = Menu.new
	end

	def create
	 render json: params and return
	 @order = Order.new(order_params)
	 if @order.save
	 	redirect_to orders_url
	 else
	 	render :new
	 end
	end

	private
	 	def order_params
	 		params.fetch(:order,{}).permit(:restaurant_name,:menu_name)
	 	end
end
