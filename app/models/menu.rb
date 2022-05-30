class Menu < ApplicationRecord
	belongs_to :cuisine
	has_many :restaurants
	has_many :orders
end
