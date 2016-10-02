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

ActiveRecord::Schema.define(version: 20161002131136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: :cascade do |t|
    t.string   "uid"
    t.date     "departure"
    t.date     "arrival"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "things", force: :cascade do |t|
    t.integer  "delivery_id"
    t.integer  "shop_id"
    t.string   "uid"
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.decimal  "price"
    t.integer  "discount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "sold"
    t.datetime "sold_date"
    t.float    "weight"
    t.string   "image_url"
    t.string   "image_thumb"
    t.string   "image_id"
    t.index ["delivery_id"], name: "index_things_on_delivery_id", using: :btree
    t.index ["shop_id"], name: "index_things_on_shop_id", using: :btree
    t.index ["sold"], name: "index_things_on_sold", using: :btree
    t.index ["sold_date"], name: "index_things_on_sold_date", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_first"
    t.string   "phone_second"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "shop_id"
    t.index ["shop_id"], name: "index_users_on_shop_id", using: :btree
  end

  add_foreign_key "users", "shops"
end
