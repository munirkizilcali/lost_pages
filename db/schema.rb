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

ActiveRecord::Schema.define(version: 2018_05_29_174611) do

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "isbn"
    t.string "author"
    t.string "short_description"
    t.string "info_link"
    t.string "cover_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "copies", force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
    t.integer "condition"
    t.datetime "purchased_date"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lendings", force: :cascade do |t|
    t.integer "copy_id"
    t.integer "borrower_id"
    t.datetime "due_date"
    t.datetime "lend_date"
    t.boolean "returned"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
