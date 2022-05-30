class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :menu_name
      t.string :restaurant_name
      
      t.timestamps
    end
  end
end
