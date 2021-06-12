class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.references :restaurant, foreign_key: true
      t.string :dish_name
      t.decimal :price, precision: 16, scale: 2, default: 0.0
      t.decimal :rating
      t.text :description
      t.text :ingredients
      t.string :is_veg, null: false

      t.timestamps
    end
  end
end
