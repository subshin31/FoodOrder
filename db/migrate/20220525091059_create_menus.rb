class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :cuisine_id
      t.integer :price
      t.string :type
      t.timestamps
    end
  end
end
