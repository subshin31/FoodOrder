class RestaurantsController < ApplicationController

 def index
  @restaurants = Restaurant.all
  #@cuisines = Cuisine.all
  render
 end

  def new
  	@cuisines = Cuisine.new
  	@cuisines = Cuisine.distinct.order(:name)
    @restaurants = Restaurant.new
  end

  #save Restaurant name
  def create 
  	render json: params and return
  	@restaurants = Restaurant.new(restaurants_param)
  	@cuisines = Cuisine.new(cuisines_param)
  	respond_to do |format|
  		if @restaurants.save
  			format.html {redirect_to restaurants_url(@restaurants),notice: "Restaurant Name Inserted" }
  			format.json {render :show, status: :created, location: @restaurants }
  		else
  			format.html {render :new, staus: :unprocessable_entity }
  			format.json {render json: @restaurants.errors, status: :unprocessable_entity }
  		end
  	end
  end

  private

  	def set_restaurants
  		@restaurants = Restaurant.find(params[:id])
  		@cuisines=Cuisine.find(params[:cuisine_id])
  	end

  	def restaurants_param
  		params.fetch(:restaurant,{}).permit(:name,:address,:cuisine_id,:open_at,:close_at)
  		# => params.fetch(:cuisines,{}).permit(:id,:cuisine_id)
   	end

   	def cuisines_param
   		params.where(:cuisines,{}).permit(:id)
   	end

end
