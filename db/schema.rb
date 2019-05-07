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

ActiveRecord::Schema.define(version: 3) do

  create_table "allegiances", force: :cascade do |t|
    t.integer "house_id"
    t.integer "member_id"
    t.string  "oath"
    t.boolean "oath_status"
  end

  create_table "houses", force: :cascade do |t|
    t.string  "name"
    t.text    "house_crest"
    t.integer "year_founded"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "hometown"
    t.string "life_status"
  end

end
