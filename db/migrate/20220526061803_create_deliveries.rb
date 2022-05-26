class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.integer :order_id
      t.boolean :status

      t.timestamps
    end
  end
end