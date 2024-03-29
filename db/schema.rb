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

ActiveRecord::Schema.define(version: 20141223185717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hunts", force: true do |t|
    t.string   "name",        null: false
    t.integer  "location_id", null: false
    t.integer  "user_id",     null: false
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "hunts", ["location_id", "user_id"], name: "index_hunts_on_location_id_and_user_id", unique: true, using: :btree

  create_table "locations", force: true do |t|
    t.float    "latitude",   null: false
    t.float    "longitude",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",    null: false
  end

  add_index "locations", ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude", unique: true, using: :btree

  create_table "quizzes", force: true do |t|
    t.integer  "hunt_id",     null: false
    t.string   "question",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_no"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "avatar_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
