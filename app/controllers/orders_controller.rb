class OrdersController < ApplicationController

	def index
	 @orders = Order.all
	 render
	end	

	def new
	 @restaurant = Restaurant.distinct.order(:name)
	 @order = Order.new
	end
end
