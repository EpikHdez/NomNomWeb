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

ActiveRecord::Schema.define(version: 20180608020905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.bigint "address_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_type_id"], name: "index_addresses_on_address_type_id"
  end

  create_table "favorite_places", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_favorite_places_on_place_id"
    t.index ["user_id"], name: "index_favorite_places_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "url"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_pictures_on_place_id"
  end

  create_table "place_addresses", force: :cascade do |t|
    t.bigint "place_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_place_addresses_on_address_id"
    t.index ["place_id"], name: "index_place_addresses_on_place_id"
  end

  create_table "place_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_types", force: :cascade do |t|
    t.bigint "place_id"
    t.bigint "place_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_category_id"], name: "index_place_types_on_place_category_id"
    t.index ["place_id"], name: "index_place_types_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.string "picture"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_products_on_place_id"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_user_addresses_on_address_id"
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "picture", default: "https://nomnomapp.herokuapp.com/no_image.png", null: false
    t.bigint "user_type_id", default: 2, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "addresses", "address_types"
  add_foreign_key "favorite_places", "places"
  add_foreign_key "favorite_places", "users"
  add_foreign_key "pictures", "places"
  add_foreign_key "place_addresses", "addresses"
  add_foreign_key "place_addresses", "places"
  add_foreign_key "place_types", "place_categories"
  add_foreign_key "place_types", "places"
  add_foreign_key "products", "places"
  add_foreign_key "user_addresses", "addresses"
  add_foreign_key "user_addresses", "users"
end
