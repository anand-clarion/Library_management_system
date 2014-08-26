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

ActiveRecord::Schema.define(version: 20140825142921) do

  create_table "book_copies", force: true do |t|
    t.integer  "book_id"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_transactions", force: true do |t|
    t.integer  "book_id"
    t.integer  "student_id"
    t.datetime "issue_date"
    t.datetime "return_date"
    t.integer  "fine",        limit: 2, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title",      limit: 30
    t.string   "author",     limit: 30
    t.integer  "no_of_copy", limit: 2
    t.boolean  "is_active",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name",                   limit: 40
    t.string   "email",                  limit: 50, default: "",    null: false
    t.integer  "phone_no",               limit: 8
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_admin",                          default: false
    t.boolean  "is_active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

end
