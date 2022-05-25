class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :menu_id
      t.integer :customer_id
      t.integer :restaurant_id
      t.integer :payment_id
      t.boolean :status
      t.timestamps
    end
  end
end
