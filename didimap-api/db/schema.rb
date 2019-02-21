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

ActiveRecord::Schema.define(version: 2019_02_18_151507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_items", force: :cascade do |t|
    t.string "food", limit: 100
    t.string "desc", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "oligo_value", default: "low"
    t.string "fruktose_value", default: "low"
    t.string "polyol_value", default: "low"
    t.string "laktose_value", default: "low"
  end

  create_table "food_products", force: :cascade do |t|
    t.string "food", limit: 200
    t.string "ingredients"
    t.string "image_path"
    t.integer "proteins_per_100"
    t.integer "carbohydrates_per_100"
    t.integer "fat_per_100"
    t.integer "calories_per_100"
    t.integer "calories_total"
    t.integer "weight"
    t.string "oligo_value", default: "unknown"
    t.string "fructose_value", default: "unknown"
    t.string "polyol_value", default: "unknown"
    t.string "lactose_value", default: "unknown"
    t.string "gtin"
    t.string "producer"
  end

  create_table "user_tested_ingredients", force: :cascade do |t|
    t.string "food", limit: 100
    t.integer "users_with_symptoms"
    t.integer "users_without_symptoms"
  end

end
