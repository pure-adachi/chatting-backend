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

ActiveRecord::Schema.define(version: 2018_10_29_140322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "talk_room_id", null: false
    t.bigint "user_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["talk_room_id"], name: "index_messages_on_talk_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "talk_rooms", force: :cascade do |t|
    t.string "title"
    t.boolean "group", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_access_tokens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "access_token_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token_id"], name: "index_user_access_tokens_on_access_token_id"
    t.index ["user_id"], name: "index_user_access_tokens_on_user_id"
  end

  create_table "user_talk_rooms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "talk_room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["talk_room_id"], name: "index_user_talk_rooms_on_talk_room_id"
    t.index ["user_id"], name: "index_user_talk_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.string "sei"
    t.string "mei"
    t.string "kana_sei"
    t.string "kana_mei"
    t.string "loginid"
    t.string "password"
    t.string "language"
    t.text "avatar"
    t.integer "lock_version", default: 0, null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "messages", "talk_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "user_access_tokens", "access_tokens"
  add_foreign_key "user_access_tokens", "users"
  add_foreign_key "user_talk_rooms", "talk_rooms"
  add_foreign_key "user_talk_rooms", "users"
end
