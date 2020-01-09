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

ActiveRecord::Schema.define(version: 2020_01_09_062224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dummy_app_agence", force: :cascade do |t|
    t.string "name"
    t.bigint "dummy_app_commercial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dummy_app_commercial_id"], name: "index_dummy_app_agence_on_dummy_app_commercial_id"
  end

  create_table "dummy_app_articles", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.bigint "dummy_app_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dummy_app_category_id"
    t.bigint "website_id"
    t.index ["dummy_app_category_id"], name: "index_dummy_app_articles_on_dummy_app_category_id"
    t.index ["dummy_app_user_id"], name: "index_dummy_app_articles_on_dummy_app_user_id"
    t.index ["website_id"], name: "index_dummy_app_articles_on_website_id"
  end

  create_table "dummy_app_categories", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dummy_app_topic_id"
    t.index ["dummy_app_topic_id"], name: "index_dummy_app_categories_on_dummy_app_topic_id"
  end

  create_table "dummy_app_commerciaux", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dummy_app_topics", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dummy_app_users", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dummy_app_websites", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dummy_app_agence", "dummy_app_commerciaux"
  add_foreign_key "dummy_app_articles", "dummy_app_users"
end
