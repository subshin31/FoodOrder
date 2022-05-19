class RestaurantsController < ApplicationController

 def index
  @restaurants = Restaurant.all
  @cuisines = Cuisine.all
  render 
 end

  def new
  	@cuisines = Cuisine.new
  	@cuisine_names = Cuisine.all.order('name').map{|c| [c.name, c.id] }
    @restaurant = Restaurant.new
  end

  def create 
    @restaurants = Restaurant.new(restaurants_param)
   
  	respond_to do |format|
   
  		if @restaurants.save
        p "After save restaurants"
  			# format.html {redirect_to restaurants_url(@restaurants),notice: "Restaurant Name Inserted" }
  			# format.json {render :show, status: :created, location: @restaurants }
        redirect_to restaurants_url
  		else
  			format.html {render :new, staus: :unprocessable_entity }
  			format.json {render json: @restaurants.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    @cuisine_names = Cuisine.all.order('name').map{|c| [c.name, c.id] }
  end

  private

  	def set_restaurants
  		@restaurants = Restaurant.find(params[:id])
  	end

  	def restaurants_param
  		params.fetch(:restaurant,{}).permit(:name,:address,:cuisine_id,:open_at,:close_at)
   	end
end
