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

ActiveRecord::Schema.define(version: 20151210003154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.string   "user"
    t.date     "created_on"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "entries", ["user_id", "created_on"], name: "index_entries_on_user_id_and_created_on", unique: true, using: :btree

  create_table "entry_foods", force: :cascade do |t|
    t.integer  "entry_id"
    t.integer  "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "entry_foods", ["entry_id"], name: "index_entry_foods_on_entry_id", using: :btree
  add_index "entry_foods", ["food_id"], name: "index_entry_foods_on_food_id", using: :btree

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.integer  "glycemic_index"
    t.integer  "entry_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_foods", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "user_id"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entry_foods", "entries"
  add_foreign_key "entry_foods", "foods"
end
