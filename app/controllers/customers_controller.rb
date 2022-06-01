class CustomersController < ApplicationController
	before_action :current_customer, only: [:show, :edit, :update, :destroy]

	def index
		@customers = Customer.all.order(:name).page(params[:page]).per(4)
	end

	def new
		@customer = Customer.new
	end

	def show
	end

	def create
		@customer = Customer.new(customers_params)
		if @customer.save
			redirect_to customers_url
		else
			# @customer = Customer.new
			render :new
		end
		# @customers = Customer.create(customers_params)
		# if @customers.valid?
		# 	redirect_to customers_url
		# else
		# 	# render json: @customers.errors and return
		# 	@customer = Customer.new
		# 	render :new
		# end
	end

	def edit
		
	end

	def update
		if @customer.update(customers_params)
      		flash.now[:notice] = "Customer Name is Updated"
     		redirect_to customers_url
   	    else
     		render :edit
    	end
	end

	def destroy
		if @customer.delete
			redirect_to customers_url
		else
			render json: params and return
		end
	end

	private

		def customers_params
			params.fetch(:customer,{}).permit(:name,:address,:contact_number,:email_id)
		end

		def current_customer
			@customer =Customer.find(params[:id])
		end 

end
