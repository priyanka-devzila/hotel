class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :restaurant, foreign_key: true, null: false
      t.references :dish, foreign_key: true
      t.integer :quantity
      t.decimal :dishes_amount, precision: 16, scale: 2, default: 0.0
      t.decimal :discount, precision: 16, scale: 2, default: 0.0
      t.decimal :delivery_charge,  precision: 16, scale: 2, default: 0.0
      t.decimal :grand_amount, precision: 16, scale: 2, default: 0.0
      t.string :add_promo
      t.string :status, null: false
      t.datetime :ordered_on, null:false
      t.decimal :rating
      t.string :repeat_order
      t.string :my_favourite

      t.timestamps
    end
  end
end
