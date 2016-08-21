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

ActiveRecord::Schema.define(version: 20160820185526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "households", force: :cascade do |t|
    t.string   "street_address"
    t.string   "street_address2"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "postal_code"
    t.date     "arrival_date"
    t.date     "departure_date"
    t.boolean  "invitation_sent", default: false
    t.boolean  "thank_you_sent",  default: false
    t.text     "gift"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "food_requirements"
    t.text     "song_requests"
    t.boolean  "attending_rehearsal_dinner", default: false
    t.boolean  "attending_wedding"
    t.integer  "household_id"
    t.string   "email_address"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "title"
    t.string   "nickname"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "file"
    t.text     "description"
    t.string   "contact_info"
    t.string   "ip_address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
