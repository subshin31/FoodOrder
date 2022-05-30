class OrdersController < ApplicationController
	before_action :current_order, only: [:show, :edit, :update, :destroy]
	before_action :get_restaurant_names, only: [:new, :edit]
	before_action :get_menu_name, only: [:new, :edit]
	before_action :get_customer_name, only: [:new, :edit]

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

	def edit
		
	end

	def update
	 if @order.update(order_params)
	 	redirect_to orders_url
	 else
	 	render :edit
	 end
	end

	def destroy
		if @order.delete
			redirect_to orders_url
		else
			render json: params and return
		end
	end

	private
	 	def order_params
	 		params.fetch(:order,{}).permit(:restaurant_id,:menu_id,:customer_id)
	 	end

	 	def current_order
	 		@order = Order.find(params[:id])
	 	end

	 	def get_restaurant_names
	 		@restaurants = Restaurant.all.order('name').map{|c| [c.name, c.id] }
	 	end

	 	def get_menu_name
	 		 @menus = Menu.all.order('name').map{|c| [c.name, c.id] }
	 	end

	 	def get_customer_name
	 		@customers = Customer.all.order('name').map{|c| [c.name, c.id] }
	 	end
end
