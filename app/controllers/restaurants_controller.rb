class RestaurantsController < ApplicationController
 before_action :current_restaurant, only: [:show, :edit, :update, :destroy]
 before_action :get_cuisine_names, only: [:new, :edit]

 def index
  @restaurants = Restaurant.all.order(:name).page(params[:page]).per(3)
  @cuisines = Cuisine.all
  render 
 end

  def show
  end

  def new
  	@cuisines = Cuisine.new
    @restaurant = Restaurant.new
  end

  def create 
    @restaurants = Restaurant.new(restaurants_param)
    if @restaurants.save
        flash[:message] = "Restaurant Name is Added"
        redirect_to restaurants_url
		else
			render :new
		end 
  end

  def edit
    
  end

  def update
    if @restaurant.update(restaurants_param)
      flash.now[:notice] = "Restaurant Name is Updated"
      redirect_to restaurants_url
    else
      render :edit
    end
  end

  def destroy
    if @restaurant.delete
      redirect_to restaurants_url
    else
      render json: params and return
    end
  end

  private

  	def current_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

  	def restaurants_param
  		params.fetch(:restaurant,{}).permit(:name,:address,:cuisine_id,:open_at,:close_at)
   	end

    def get_cuisine_names
      @cuisine_names = Cuisine.all.order('name').map{|c| [c.name, c.id] }
    end


end
