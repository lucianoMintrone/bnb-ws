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

ActiveRecord::Schema.define(version: 2021_03_06_153001) do

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

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "guest_id", null: false
    t.date "from_date"
    t.date "to_date"
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_bookings_on_guest_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "user_id", null: false
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_comments_on_room_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorite_bookings", force: :cascade do |t|
    t.bigint "guest_id", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_favorite_bookings_on_booking_id"
    t.index ["guest_id"], name: "index_favorite_bookings_on_guest_id"
  end

  create_table "guests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_rating", default: 0.0
    t.float "number_of_ratings", default: 0.0
    t.index ["user_id"], name: "index_guests_on_user_id", unique: true
  end

  create_table "hosts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hosts_on_user_id", unique: true
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rate"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rateable_type", null: false
    t.bigint "rateable_id", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_ratings_on_rateable_type_and_rateable_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "displayed_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "host_id", null: false
    t.bigint "room_type_id", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "number_of_guests"
    t.float "price_per_night"
    t.decimal "longitude", precision: 10, scale: 6
    t.decimal "latitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "available_from"
    t.date "available_to"
    t.datetime "blocked_at"
    t.string "hash_id"
    t.float "total_rating", default: 0.0
    t.float "number_of_ratings", default: 0.0
    t.index ["host_id"], name: "index_rooms_on_host_id"
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firebase_id", default: "", null: false
    t.datetime "blocked_at"
    t.string "firebase_token"
    t.index ["firebase_id"], name: "index_users_on_firebase_id", unique: true
  end

  create_table "visited_rooms", force: :cascade do |t|
    t.bigint "guest_id", null: false
    t.bigint "room_id", null: false
    t.boolean "push_notification_has_been_sent", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "similar_room_push_has_been_sent", default: false, null: false
    t.index ["guest_id"], name: "index_visited_rooms_on_guest_id"
    t.index ["room_id"], name: "index_visited_rooms_on_room_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "external_id"
    t.string "address"
    t.text "mnemonic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "guests"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "comments", "rooms"
  add_foreign_key "comments", "users"
  add_foreign_key "favorite_bookings", "bookings"
  add_foreign_key "favorite_bookings", "guests"
  add_foreign_key "guests", "users"
  add_foreign_key "hosts", "users"
  add_foreign_key "rooms", "hosts"
  add_foreign_key "rooms", "room_types"
  add_foreign_key "visited_rooms", "guests"
  add_foreign_key "visited_rooms", "rooms"
  add_foreign_key "wallets", "users"
end
