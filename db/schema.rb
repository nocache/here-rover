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

ActiveRecord::Schema.define(version: 20141119025847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "body",       limit: 16, default: "luna"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["body"], name: "index_locations_on_body", using: :btree
  add_index "locations", ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude", using: :btree

  create_table "rovers", force: true do |t|
    t.integer  "vehicle_id"
    t.integer  "locations_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rovers", ["vehicle_id"], name: "index_rovers_on_vehicle_id", using: :btree

end
