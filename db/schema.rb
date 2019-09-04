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

ActiveRecord::Schema.define(version: 2019_09_04_185530) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.integer "subsidiary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subsidiary_id"], name: "index_addresses_on_subsidiary_id"
  end

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.string "year"
    t.integer "manufacture_id"
    t.text "car_options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "motorization"
    t.string "category"
    t.integer "fuel_type_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_car_models_on_category_id"
    t.index ["fuel_type_id"], name: "index_car_models_on_fuel_type_id"
    t.index ["manufacture_id"], name: "index_car_models_on_manufacture_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "car_model_id"
    t.integer "car_km"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "license_plate"
    t.string "color"
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fuel_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufactures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cnpj"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
