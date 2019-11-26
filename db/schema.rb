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


ActiveRecord::Schema.define(version: 2019_11_26_184303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.bigint "user_id"
    t.string "brand"
    t.string "model"
    t.string "plate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "car_type"
    t.boolean "visible", default: true
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "winch_id"
    t.integer "rating"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "visible"
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["winch_id"], name: "index_reviews_on_winch_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "winch_id"
    t.bigint "car_id"
    t.string "description"
    t.datetime "arrival_time"
    t.datetime "delivery_time"
    t.string "status"
    t.float "win_init_lat"
    t.float "win_init_long"
    t.float "car_lat"
    t.float "car_long"
    t.float "dest_lat"
    t.float "dest_long"
    t.integer "total_distance"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.index ["car_id"], name: "index_trips_on_car_id"
    t.index ["winch_id"], name: "index_trips_on_winch_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "winch"
    t.boolean "visible"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "winches", force: :cascade do |t|
    t.bigint "user_id"
    t.string "brand"
    t.string "type"
    t.string "plate"
    t.integer "price_per_km"
    t.float "win_lat"
    t.float "win_long"
    t.boolean "on_duty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_winches_on_user_id"
  end

  add_foreign_key "cars", "users"
  add_foreign_key "photos", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "winches"
  add_foreign_key "trips", "cars"
  add_foreign_key "trips", "winches"
  add_foreign_key "winches", "users"
end
