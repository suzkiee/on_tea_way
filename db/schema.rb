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

ActiveRecord::Schema.define(version: 2021_09_17_214201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.bigint "user_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tea_id"
    t.string "title"
    t.float "price"
    t.string "status"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tea_id"], name: "index_subscriptions_on_tea_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "package_photos", "photos"
  add_foreign_key "package_photos", "subscriptions"
  add_foreign_key "photos", "users"
  add_foreign_key "subscriptions", "teas"
  add_foreign_key "subscriptions", "users"
end
