class Customer < ApplicationRecord
	has_many :orders
	paginates_per 4
	validates :name, presence: true, length: { minimum: 3 }
	validates :address, presence: true
	validates :contact_number, length: { minimum: 10 , maximum: 10}, numericality: { only_integer: true}
	validates :email_id, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

end

