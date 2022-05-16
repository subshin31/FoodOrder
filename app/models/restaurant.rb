class Restaurant < ApplicationRecord
	belongs_to :cuisines, foreign_key: "cuisine_id"
end
