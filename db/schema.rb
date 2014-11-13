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

ActiveRecord::Schema.define(version: 20141113025356) do

  create_table "assignments", force: true do |t|
    t.integer  "UID"
    t.boolean  "completed"
    t.string   "description"
    t.integer  "points"
    t.integer  "doneBy"
    t.string   "answer"
    t.integer  "subsubject"
    t.string   "duedate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "sender"
    t.text     "message"
    t.integer  "recever"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer  "UID"
    t.integer  "assignmentID"
    t.string   "response"
    t.boolean  "selected"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subsubjects", force: true do |t|
    t.string   "name"
    t.integer  "subjectID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "email"
    t.string   "userName"
    t.integer  "points"
    t.integer  "rating"
    t.boolean  "banned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
