class Order < ApplicationRecord
	enum status: {order_placed: 0,order_shipped: 1,order_delivered: 2}
	belongs_to :customer
	belongs_to :menu
	belongs_to :restaurant
	has_many :payments
end
