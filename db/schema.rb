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

ActiveRecord::Schema[7.1].define(version: 2023_10_15_052633) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.integer "release_year", null: false
    t.text "synopsis", null: false
    t.integer "origin_country_id", null: false
    t.integer "length", null: false
    t.integer "director_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_been_released"
    t.index ["director_id"], name: "index_movies_on_director_id"
    t.index ["genre_id"], name: "index_movies_on_genre_id"
    t.index ["origin_country_id"], name: "index_movies_on_origin_country_id"
  end

  create_table "nationalities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_nationalities_on_country_id"
    t.index ["name"], name: "index_nationalities_on_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "directors", "genres", column: "favorite_genre_id"
  add_foreign_key "directors", "nationalities"
  add_foreign_key "movies", "countries", column: "origin_country_id"
  add_foreign_key "movies", "directors"
  add_foreign_key "movies", "genres"
  add_foreign_key "nationalities", "countries"
end
