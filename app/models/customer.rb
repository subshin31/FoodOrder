class Customer < ApplicationRecord
	has_many :orders
	paginates_per 4
	validates :name, presence: true, length: { minimum: 3 }
	validates :address, presence: true, length: { minimum: 10 , maximum: 100}
	validates :contact_number, length: { minimum: 10 , maximum: 10}, numericality: { only_integer: true},format: { with: /\A\+?[1-9]\d{1,14}\z/i, on: :create}
	validates :email_id, presence: true, format: { with: /\A([A-Za-z+_.-]+)@(([A-Za-z0-9.-]+\.)+[com]{2,})\z/i, on: :create}, uniqueness: true, on: :update

end

