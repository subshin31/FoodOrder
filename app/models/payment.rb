class Payment < ApplicationRecord
	enum status: {payment_pending: 0,payment_processing: 1,payment_paid: 2}
	
	belongs_to :customer
	belongs_to :order
	has_many :customers

end
