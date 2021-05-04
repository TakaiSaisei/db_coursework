# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_04_175736) do

  create_table "accidents", force: :cascade do |t|
    t.integer "address_id", null: false
    t.integer "officer_id", null: false
    t.string "description", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_accidents_on_address_id"
    t.index ["officer_id"], name: "index_accidents_on_officer_id"
  end

  create_table "accidents_cars", id: false, force: :cascade do |t|
    t.integer "accident_id"
    t.integer "car_id"
    t.index ["accident_id"], name: "index_accidents_cars_on_accident_id"
    t.index ["car_id"], name: "index_accidents_cars_on_car_id"
  end

  create_table "accidents_citizens", id: false, force: :cascade do |t|
    t.integer "accident_id"
    t.integer "citizen_id"
    t.index ["accident_id"], name: "index_accidents_citizens_on_accident_id"
    t.index ["citizen_id"], name: "index_accidents_citizens_on_citizen_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "city_id", null: false
    t.string "address", null: false
    t.string "building"
    t.string "apartment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "citizen_id", null: false
    t.string "manufacter", null: false
    t.string "model", null: false
    t.date "registration_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["citizen_id"], name: "index_cars_on_citizen_id"
  end

  create_table "cities", force: :cascade do |t|
    t.integer "country_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "citizens", force: :cascade do |t|
    t.integer "address_id", null: false
    t.string "first_name", null: false
    t.string "second_name", null: false
    t.string "middle_name", null: false
    t.string "document_number", null: false
    t.date "birth_date", null: false
    t.string "sex", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_citizens_on_address_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "officers", force: :cascade do |t|
    t.integer "citizen_id", null: false
    t.string "rank", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["citizen_id"], name: "index_officers_on_citizen_id"
  end

  create_table "penalties", force: :cascade do |t|
    t.integer "accident_id", null: false
    t.integer "citizen_id", null: false
    t.string "description", null: false
    t.integer "amount", null: false
    t.boolean "payed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accident_id"], name: "index_penalties_on_accident_id"
    t.index ["citizen_id"], name: "index_penalties_on_citizen_id"
  end

  add_foreign_key "accidents", "addresses"
  add_foreign_key "accidents", "officers"
  add_foreign_key "addresses", "cities"
  add_foreign_key "cars", "citizens"
  add_foreign_key "cities", "countries"
  add_foreign_key "citizens", "addresses"
  add_foreign_key "officers", "citizens"
  add_foreign_key "penalties", "accidents"
  add_foreign_key "penalties", "citizens"
end
