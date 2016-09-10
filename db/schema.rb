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

ActiveRecord::Schema.define(version: 20160909183547) do

  create_table "editors", force: :cascade do |t|
    t.string   "description"
    t.integer  "manager_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "editors", ["manager_id"], name: "index_editors_on_manager_id"

  create_table "functionalities", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "managers", ["user_id"], name: "index_managers_on_user_id"

  create_table "permissions", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "role"
    t.boolean  "can_create", default: false
    t.boolean  "can_read",   default: false
    t.boolean  "can_update", default: false
    t.boolean  "can_delete", default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "permissions", ["profile_id"], name: "index_permissions_on_profile_id"

  create_table "profile_functionalities", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "functionality_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "profile_functionalities", ["functionality_id"], name: "index_profile_functionalities_on_functionality_id"
  add_index "profile_functionalities", ["profile_id"], name: "index_profile_functionalities_on_profile_id"

  create_table "profile_users", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profile_users", ["profile_id"], name: "index_profile_users_on_profile_id"
  add_index "profile_users", ["user_id"], name: "index_profile_users_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "description"
    t.integer  "manager_id"
    t.integer  "editor_id"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "profiles", ["editor_id"], name: "index_profiles_on_editor_id"
  add_index "profiles", ["manager_id"], name: "index_profiles_on_manager_id"

  create_table "users", force: :cascade do |t|
    t.integer  "manager_id"
    t.integer  "editor_id"
    t.integer  "profile_id"
    t.integer  "father_id"
    t.boolean  "active",                 default: true
    t.boolean  "admin",                  default: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
