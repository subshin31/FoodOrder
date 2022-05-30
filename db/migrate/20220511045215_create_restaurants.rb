class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :cuisine_id
      t.datetime :open_at
      t.datetime :close_at

      t.timestamps
    end
  end
end
