# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_21_021728) do

  create_table "car_park_slots", force: :cascade do |t|
    t.integer "park_slot_id"
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_car_park_slots_on_car_id"
    t.index ["park_slot_id", "car_id"], name: "index_car_park_slots_on_park_slot_id_and_car_id", unique: true
    t.index ["park_slot_id"], name: "index_car_park_slots_on_park_slot_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.string "number_plate"
    t.string "brand"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "park_slots", force: :cascade do |t|
    t.integer "park_id"
    t.float "height"
    t.float "width"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_park_slots_on_park_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "cover"
    t.string "images"
    t.string "avatar"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "post_code"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
