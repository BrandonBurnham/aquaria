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

ActiveRecord::Schema.define(version: 20131218051123) do

  create_table "aquaria", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "gallons"
    t.string   "water_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
    t.string   "status"
    t.integer  "user_id"
  end

  add_index "aquaria", ["user_id", "created_at"], name: "index_aquaria_on_user_id_and_created_at"

  create_table "chemistries", force: true do |t|
    t.float    "water_ph"
    t.float    "water_nh3"
    t.float    "water_no3"
    t.float    "water_no2"
    t.float    "water_temp"
    t.date     "test_date"
    t.integer  "aquarium_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chemistries", ["aquarium_id"], name: "index_chemistries_on_aquarium_id"

  create_table "foos", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inhabitants", force: true do |t|
    t.string   "inhabitant_type"
    t.string   "name"
    t.string   "description"
    t.integer  "quantity"
    t.integer  "aquarium_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inhabitants", ["aquarium_id"], name: "index_inhabitants_on_aquarium_id"

  create_table "status_lists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
