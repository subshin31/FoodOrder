class Restaurant < ApplicationRecord
	belongs_to :cuisine
	paginates_per 3
end
