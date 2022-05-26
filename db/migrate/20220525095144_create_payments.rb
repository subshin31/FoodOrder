class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :customer_id
      t.integer :order_id
      t.string :type
      t.integer :last_4_digit
      t.boolean :status

      t.timestamps
    end
  end
end
