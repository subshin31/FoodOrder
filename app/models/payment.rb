class Payment < ApplicationRecord
	enum status: {payment_pending: 0,payment_processing: 1,payment_paid: 2}
	
	belongs_to :customer
	belongs_to :order
	has_many :customers

	validates :payment_type, presence: true
	validates :last_4_digit,presence: true, length: { minimum: 4 , maximum: 4},format: { with: /\A(^[0-9]{4})\z/i, on: :create}
end
