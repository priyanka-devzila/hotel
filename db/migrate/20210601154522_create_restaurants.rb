class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :phone_no_1, null: false
      t.string :phone_no_2
      t.string :address, null: false
      t.string :home_delivery, null: false
      t.string :delivery_time
      t.string :delivery_charge
      t.text :description
      t.text :other_details

      t.timestamps
    end
  end
end
