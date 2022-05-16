class Customer < ApplicationRecord
	has_many :restaurants
	has_many :cuisines
end
