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

ActiveRecord::Schema.define(version: 2022_04_03_194022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "boxes", force: :cascade do |t|
    t.string "name"
    t.string "comment"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "record_id"
    t.index ["record_id"], name: "index_boxes_on_record_id"
    t.index ["user_id"], name: "index_boxes_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "year"
    t.string "bpm"
    t.string "key"
    t.string "image"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "label"
    t.string "masterid"
    t.text "tracklist", default: [], array: true
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "box_id", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["box_id"], name: "index_tags_on_box_id"
    t.index ["record_id"], name: "index_tags_on_record_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "position"
    t.string "title"
    t.bigint "artist_id", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_tracks_on_artist_id"
    t.index ["record_id"], name: "index_tracks_on_record_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boxes", "records"
  add_foreign_key "boxes", "users"
  add_foreign_key "tags", "boxes"
  add_foreign_key "tags", "records"
  add_foreign_key "tracks", "artists"
  add_foreign_key "tracks", "records"
end
