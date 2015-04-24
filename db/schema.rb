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

ActiveRecord::Schema.define(version: 20150416072208) do

  create_table "dewpoints", force: :cascade do |t|
    t.float    "current"
    t.integer  "weather_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dewpoints", ["weather_id"], name: "index_dewpoints_on_weather_id"

  create_table "rainfalls", force: :cascade do |t|
    t.float    "current"
    t.integer  "weather_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rainfalls", ["weather_id"], name: "index_rainfalls_on_weather_id"

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temperatures", force: :cascade do |t|
    t.float    "current"
    t.integer  "weather_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "temperatures", ["weather_id"], name: "index_temperatures_on_weather_id"

  create_table "weathers", force: :cascade do |t|
    t.datetime "time"
    t.datetime "initial"
    t.string   "source"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "weathers", ["station_id"], name: "index_weathers_on_station_id"

  create_table "winddirs", force: :cascade do |t|
    t.string   "current"
    t.integer  "weather_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "winddirs", ["weather_id"], name: "index_winddirs_on_weather_id"

  create_table "windspeeds", force: :cascade do |t|
    t.float    "current"
    t.integer  "weather_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "windspeeds", ["weather_id"], name: "index_windspeeds_on_weather_id"

end
