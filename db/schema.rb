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

ActiveRecord::Schema[7.1].define(version: 2024_01_22_095705) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "username"
    t.string "body"
    t.integer "userid"
    t.integer "postid"
    t.bigint "user_id", null: false
    t.bigint "forum_thread_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_thread_id"], name: "index_comments_on_forum_thread_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "forum_threads", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "category"
    t.string "username"
    t.integer "userid"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_forum_threads_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "username"
    t.integer "userid"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "aboutyou"
    t.string "pfp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "forum_threads"
  add_foreign_key "comments", "users"
  add_foreign_key "forum_threads", "users"
  add_foreign_key "posts", "users"
end
