class MenusController < ApplicationController
	before_action :current_menu, only: [:show, :edit, :update, :destroy]
	before_action :get_cuisine_names, only: [:new, :edit]

	def index
		@menus = Menu.all.order(:name).page(params[:page]).per(3)
		@cuisines = Cuisine.all
		render
	end

	def show
		
	end

	def new
		@menu = Menu.new
	end

	def create
		@menu = Menu.new(menu_params)
		if @menu.save 
			redirect_to menus_url
		else
			render :new
		end
	end

	def edit
		 
	end

	def update
			if @menu.update(menu_params)
			redirect_to menus_url
		else
			render :edit
		end
	end

	def destroy
		if @menu.delete
			redirect_to menus_url
		else
			render json: params and return

		end
	end


	private

		def menu_params
			params.fetch(:menu,{}).permit(:name,:cuisine_id,:menu_type,:price)

		end 

		def current_menu
			@menu = Menu.find(params[:id])

		end

		def get_cuisine_names
			@cuisine_names = Cuisine.all.order('name').map{|c| [c.name, c.id] }
		end

end
