class Customer < ApplicationRecord
	has_many :orders
	paginates_per 4
	validates :name, presence: true, length: { minimum: 3 }
	validates :address, presence: true
	validates :contact_number, length: { minimum: 10 , maximum: 10}
	validates :email_id, confirmation: true, presence: true


end

