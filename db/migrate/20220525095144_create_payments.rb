class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :customer_id
      t.integer :order_id
      t.string :payment_type
      t.integer :last_4_digit
      t.integer :status

      t.timestamps
    end
  end
end
