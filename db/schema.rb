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

ActiveRecord::Schema.define(version: 2021_04_24_195448) do

  create_table "activities", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "img_url"
    t.string "text"
    t.string "address"
    t.string "lat"
    t.string "lng"
    t.index ["trip_id"], name: "index_activities_on_trip_id"
  end

  create_table "destination_activities", force: :cascade do |t|
    t.integer "destination_id", null: false
    t.integer "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_destination_activities_on_activity_id"
    t.index ["destination_id"], name: "index_destination_activities_on_destination_id"
  end

  create_table "destination_foods", force: :cascade do |t|
    t.integer "destination_id", null: false
    t.integer "food_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destination_id"], name: "index_destination_foods_on_destination_id"
    t.index ["food_id"], name: "index_destination_foods_on_food_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "location"
    t.string "country"
    t.string "description"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "lat"
    t.float "lon"
  end

  create_table "foods", force: :cascade do |t|
    t.string "cuisine"
    t.string "restaurant_name"
    t.string "dish"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "getdata", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", force: :cascade do |t|
    t.string "emoji"
    t.integer "user_id", null: false
    t.integer "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_likes_on_activity_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "start_date"
    t.integer "num_of_people"
    t.string "traveller_names"
    t.integer "user_id", null: false
    t.integer "destination_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "budget"
    t.integer "expense"
    t.datetime "end_date"
    t.index ["destination_id"], name: "index_trips_on_destination_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "hometown"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "password_digest"
    t.string "favorites"
  end

  add_foreign_key "activities", "trips"
  add_foreign_key "destination_activities", "activities"
  add_foreign_key "destination_activities", "destinations"
  add_foreign_key "destination_foods", "destinations"
  add_foreign_key "destination_foods", "foods"
  add_foreign_key "likes", "activities"
  add_foreign_key "likes", "users"
  add_foreign_key "trips", "destinations"
  add_foreign_key "trips", "users"
end


