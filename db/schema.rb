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

ActiveRecord::Schema.define(version: 20140531052823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.string  "assignment_name"
    t.text    "description"
    t.date    "due_date"
    t.integer "cohort_id"
  end

  create_table "cohorts", force: true do |t|
    t.string  "track"
    t.integer "location_id"
    t.date    "start_date"
    t.date    "end_date"
    t.string  "password_digest"
  end

  create_table "comments", force: true do |t|
    t.text    "content"
    t.integer "commentable_id"
    t.string  "commentable_type"
    t.integer "user_id"
  end

  create_table "enrollments", force: true do |t|
    t.integer "cohort_id"
    t.integer "user_id"
  end

  create_table "locations", force: true do |t|
    t.string "city"
  end

  create_table "submissions", force: true do |t|
    t.string  "github_link"
    t.string  "heroku_link"
    t.integer "user_id"
    t.string  "status"
    t.integer "assignment_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
