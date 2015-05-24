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

ActiveRecord::Schema.define(version: 20120711093223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "puzzle_id"
    t.boolean  "correct"
    t.text     "provided_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "puzzles", force: :cascade do |t|
    t.text     "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "answer"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "avatar_url"
    t.string   "provider"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "staff",        default: false
  end

end