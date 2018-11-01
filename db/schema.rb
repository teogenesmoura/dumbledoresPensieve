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

ActiveRecord::Schema.define(version: 2018_11_01_210406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memory_items", force: :cascade do |t|
    t.string "content"
    t.string "location"
    t.string "weather"
    t.datetime "date_recorded"
    t.integer "memory_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memory_list_id"], name: "index_memory_items_on_memory_list_id"
  end

  create_table "memory_lists", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "date_created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
