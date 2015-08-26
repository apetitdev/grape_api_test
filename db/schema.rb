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

ActiveRecord::Schema.define(version: 20150813020127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "majors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "majors_schools", id: false, force: :cascade do |t|
    t.integer "school_id"
    t.integer "major_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string   "english_name"
    t.string   "chinese_name"
    t.string   "logo"
    t.integer  "rank"
    t.string   "country"
    t.string   "city"
    t.string   "tuition_fees"
    t.text     "introduction"
    t.string   "world_working"
    t.string   "national_ranking"
    t.string   "cost_of_living"
    t.string   "link"
    t.text     "address"
    t.string   "acronym"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
