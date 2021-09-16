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

ActiveRecord::Schema.define(version: 2021_09_16_170309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "package_photos", force: :cascade do |t|
    t.bigint "subscription_id"
    t.bigint "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_package_photos_on_photo_id"
    t.index ["subscription_id"], name: "index_package_photos_on_subscription_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url"
    t.string "unsplash_id"
    t.boolean "user_uploaded"
    t.string "user_photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "tea_id"
    t.string "title"
    t.float "price"
    t.string "status"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_subscriptions_on_customer_id"
    t.index ["tea_id"], name: "index_subscriptions_on_tea_id"
  end

  create_table "teas", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "temperature"
    t.integer "brew_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "package_photos", "photos"
  add_foreign_key "package_photos", "subscriptions"
  add_foreign_key "subscriptions", "teas"
  add_foreign_key "subscriptions", "users", column: "customer_id"
end
