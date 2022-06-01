class Customer < ApplicationRecord
	has_many :orders
	paginates_per 3
end
