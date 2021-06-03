class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.references :restaurant, foreign_key: true
      t.string :dish_name
      t.string :price
      t.string :quantity
      

      t.timestamps
    end
  end
end
