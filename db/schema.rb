# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141120050704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: true do |t|
    t.float    "lat"
    t.float    "long"
    t.string   "type",       limit: 32, default: "LunarLocation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rover_id"
  end

  add_index "locations", ["lat", "long"], name: "index_locations_on_lat_and_long", using: :btree
  add_index "locations", ["rover_id", "updated_at"], name: "index_locations_on_rover_id_and_updated_at", using: :btree
  add_index "locations", ["type"], name: "index_locations_on_type", using: :btree

  create_table "points_of_interest", force: true do |t|
    t.string   "name",        null: false
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points_of_interest", ["location_id"], name: "index_points_of_interest_on_location_id", using: :btree
  add_index "points_of_interest", ["name"], name: "index_points_of_interest_on_name", using: :btree

  create_table "rovers", force: true do |t|
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rovers", ["vehicle_id"], name: "index_rovers_on_vehicle_id", using: :btree

end
