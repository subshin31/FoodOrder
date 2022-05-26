class Order < ApplicationRecord
	belongs_to :customer
	has_many :menus
	has_many :restaurants
	has_many :payments
end
