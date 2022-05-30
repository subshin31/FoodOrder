class Order < ApplicationRecord
	belongs_to :customer
	belongs_to :menu
	belongs_to :restaurant
	has_many :payments

end
