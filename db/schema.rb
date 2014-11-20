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

ActiveRecord::Schema.define(version: 20141120085039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "rant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followings", force: true do |t|
    t.integer  "user_following_id"
    t.integer  "user_being_followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_confirmers", force: true do |t|
    t.string "uuid"
    t.string "email"
  end

  create_table "rant_comments", force: true do |t|
    t.text     "comment"
    t.integer  "rant_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rants", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "rant"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spams", force: true do |t|
    t.integer "rant_id"
    t.boolean "resolved"
  end

  create_table "user_comments", force: true do |t|
    t.text    "comment"
    t.integer "user_id"
    t.integer "commenter_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "rant_frequency"
    t.text     "image_url"
    t.boolean  "admin"
    t.string   "image"
    t.boolean  "email_confirmed"
  end

end
