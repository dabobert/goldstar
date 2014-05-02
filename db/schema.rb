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

ActiveRecord::Schema.define(version: 20110906184647) do

  create_table "email_addresses", force: true do |t|
    t.integer  "profile_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "star_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interweb_networks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_media_accounts", force: true do |t|
    t.string   "username"
    t.integer  "network_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
  end

  create_table "stars", force: true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_id"
    t.string   "source_type",         default: "goldstar"
    t.integer  "sender_network_id",   default: 1
    t.integer  "receiver_network_id", default: 1
    t.string   "misc"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree

end
