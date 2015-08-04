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

ActiveRecord::Schema.define(version: 20150804193356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.string   "date"
    t.integer  "profile_id",  null: false
    t.integer  "workshop_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attendances", ["profile_id"], name: "index_attendances_on_profile_id", using: :btree
  add_index "attendances", ["workshop_id"], name: "index_attendances_on_workshop_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "surname",                      null: false
    t.string   "given_name",                   null: false
    t.string   "location",                     null: false
    t.text     "about_me",                     null: false
    t.string   "gender"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

  add_index "profiles", ["surname"], name: "index_profiles_on_surname", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",        null: false
    t.string   "instructions", null: false
    t.integer  "profile_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "projects", ["profile_id"], name: "index_projects_on_profile_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "workshops", force: :cascade do |t|
    t.string   "title",        null: false
    t.string   "location",     null: false
    t.text     "about",        null: false
    t.string   "contact_info", null: false
    t.string   "repeats",      null: false
    t.integer  "organizer_id", null: false
    t.integer  "profile_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "workshops", ["location"], name: "index_workshops_on_location", using: :btree
  add_index "workshops", ["organizer_id"], name: "index_workshops_on_organizer_id", using: :btree
  add_index "workshops", ["profile_id"], name: "index_workshops_on_profile_id", using: :btree

  add_foreign_key "attendances", "profiles"
  add_foreign_key "attendances", "workshops"
  add_foreign_key "profiles", "users"
  add_foreign_key "projects", "profiles"
  add_foreign_key "workshops", "profiles"
end
