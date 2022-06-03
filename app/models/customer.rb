class Customer < ApplicationRecord
	has_many :orders
	paginates_per 4
	validates :name, presence: true, length: { minimum: 3 }
	validates :address, presence: true, length: { minimum: 10 , maximum: 100}
	validates :contact_number, length: { minimum: 10 , maximum: 10},format: { with: /\A(^((99|98|97|88|89|87|79|78|77)[1-9]))\d{7}\z/}
	validates :email_id, presence: true, format: { with: /\A([A-Za-z+_.-]+)@(([A-Za-z0-9.-]+\.)+[com]{2,})\z/i, on: :create}, uniqueness: true, on: :update  

end

