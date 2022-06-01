class Customer < ApplicationRecord
	has_many :orders
	paginates_per 4
	validates :name, presence: true
	validates :name, length: { minimum: 20 }
	
end

