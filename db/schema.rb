# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_12_060844) do

  create_table "dishes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "dish_name"
    t.decimal "price", precision: 16, scale: 2, default: "0.0"
    t.decimal "rating", precision: 10
    t.text "description"
    t.text "ingredients"
    t.string "is_veg", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_dishes_on_restaurant_id"
  end

  create_table "orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "dish_id"
    t.integer "quantity"
    t.decimal "dishes_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "discount", precision: 16, scale: 2, default: "0.0"
    t.decimal "delivery_charge", precision: 16, scale: 2, default: "0.0"
    t.decimal "grand_amount", precision: 16, scale: 2, default: "0.0"
    t.string "add_promo"
    t.string "status", null: false
    t.datetime "ordered_on", null: false
    t.decimal "rating", precision: 10
    t.string "repeat_order"
    t.string "my_favourite"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_orders_on_dish_id"
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
  end

  create_table "restaurants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_no_1", null: false
    t.string "phone_no_2"
    t.string "address", null: false
    t.string "home_delivery", null: false
    t.string "open_till"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "dishes", "restaurants"
  add_foreign_key "orders", "dishes"
  add_foreign_key "orders", "restaurants"
end
