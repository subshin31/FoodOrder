class PaymentsController < ApplicationController
	before_action :current_payment, only: [:show, :edit, :update, :destroy]
    before_action :get_customer_name, only: [:new, :edit]
    before_action :get_order_id, only: [:new, :edit]

	def index
		@payments = Payment.all.order(:id).page(params[:page]).per(4)
		render
	end

	def new
		@payment = Payment.new
	end

	def create
		@payments = Payment.new(payment_params)
		if @payments.save
			redirect_to payments_url
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @payment.update(payment_params)
			redirect_to payments_url
		else
			render :edit
		end
	end

	def destroy
		if @payment.delete
			redirect_to payments_url
		else
			render json: params and return
		end
	end

	private

		def payment_params
     		pp = params.require(:payment).permit(:customer_id,:order_id,:last_4_digit, :payment_type)
      		pp[:status] = params[:payment][:status].to_i
     		return pp 
		end

		def get_customer_name
			@customers = Customer.all.order('name').map{|c| [c.name, c.id] }		
		end

		def current_payment
			@payment = Payment.find(params[:id])
		end

		def get_order_id
			@orders = Order.all.order('id').map{|c| [c.id, c.id]}
		end
end
