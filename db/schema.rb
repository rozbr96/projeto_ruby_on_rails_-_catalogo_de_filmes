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

ActiveRecord::Schema[7.1].define(version: 2023_10_14_203434) do
  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "directors", force: :cascade do |t|
    t.string "name", null: false
    t.integer "nationality_id", null: false
    t.datetime "birth_date", null: false
    t.integer "favorite_genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorite_genre_id"], name: "index_directors_on_favorite_genre_id"
    t.index ["name"], name: "index_directors_on_name", unique: true
    t.index ["nationality_id"], name: "index_directors_on_nationality_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "nationalities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_nationalities_on_country_id"
    t.index ["name"], name: "index_nationalities_on_name", unique: true
  end

  add_foreign_key "directors", "genres", column: "favorite_genre_id"
  add_foreign_key "directors", "nationalities"
  add_foreign_key "nationalities", "countries"
end
