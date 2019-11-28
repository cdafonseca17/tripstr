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

ActiveRecord::Schema.define(version: 2019_11_27_094034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.float "longitude"
    t.float "latitude"
    t.text "address"
    t.text "comment"
    t.text "description"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "rating"
    t.string "url"
    t.string "icon"
    t.string "types"
    t.integer "place_id"
    t.integer "position"
    t.string "photo_google"
    t.index ["step_id"], name: "index_activities_on_step_id"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "nights"
    t.string "location"
    t.float "longitude"
    t.float "latitude"
    t.text "address"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["trip_id"], name: "index_steps_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "start_date"
    t.string "end_date"
    t.string "country_code"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "published", default: false
    t.string "country"
    t.string "dates"
    t.float "longitude"
    t.float "latitude"
    t.string "photo"
    t.index ["user_id"], name: "index_trips_on_user_id"
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
    t.string "username"
    t.string "home_city"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "steps"
  add_foreign_key "steps", "trips"
  add_foreign_key "trips", "users"
end
