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

ActiveRecord::Schema.define(version: 20140718070339) do

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.integer  "profile_id"
    t.integer  "item_id"
    t.string   "delieverytype"
    t.string   "status"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.integer  "mrp"
    t.integer  "discount"
    t.integer  "quantity"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pickups", force: true do |t|
    t.integer  "user_id"
    t.integer  "mobile"
    t.integer  "pincode"
    t.string   "status"
    t.integer  "item_id"
    t.integer  "quantity"
    t.string   "address"
    t.string   "delieverytype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.integer  "pincode"
    t.integer  "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
