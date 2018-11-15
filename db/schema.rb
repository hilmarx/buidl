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

ActiveRecord::Schema.define(version: 2018_11_15_054200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "project_id"
    t.bigint "technology_id"
    t.integer "lines_added"
    t.integer "lines_deleted"
    t.integer "commits"
    t.index ["project_id"], name: "index_contributions_on_project_id"
    t.index ["technology_id"], name: "index_contributions_on_technology_id"
    t.index ["user_id"], name: "index_contributions_on_user_id"
  end

  create_table "project_follows", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_project_follows_on_project_id"
    t.index ["user_id"], name: "index_project_follows_on_user_id"
  end

  create_table "project_technologies", force: :cascade do |t|
    t.integer "size_bytes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.bigint "technology_id"
    t.index ["project_id"], name: "index_project_technologies_on_project_id"
    t.index ["technology_id"], name: "index_project_technologies_on_technology_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "github_url"
    t.string "url"
    t.string "photo"
    t.integer "owner_id"
    t.boolean "public"
    t.string "primary_language"
    t.integer "size_bytes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "github_description"
    t.integer "lines_added"
    t.integer "lines_deleted"
    t.integer "commits"
    t.boolean "archived"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_follows", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "followed_id"
    t.integer "follower_id"
  end

  create_table "user_technologies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "technology_id"
    t.bigint "user_id"
    t.index ["technology_id"], name: "index_user_technologies_on_technology_id"
    t.index ["user_id"], name: "index_user_technologies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "profile_photo"
    t.string "cover_photo"
    t.string "address"
    t.decimal "longitude"
    t.decimal "latitude"
    t.string "github_username"
    t.integer "github_id"
    t.string "github_url"
    t.string "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contributions", "projects"
  add_foreign_key "contributions", "technologies"
  add_foreign_key "contributions", "users"
  add_foreign_key "project_follows", "projects"
  add_foreign_key "project_follows", "users"
  add_foreign_key "project_technologies", "projects"
  add_foreign_key "project_technologies", "technologies"
  add_foreign_key "user_technologies", "technologies"
  add_foreign_key "user_technologies", "users"
end
