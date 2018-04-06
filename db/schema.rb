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

ActiveRecord::Schema.define(version: 20180405210432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "grants", force: :cascade do |t|
    t.string "grant_number"
    t.string "primary_contact"
    t.string "email"
    t.string "phone"
    t.bigint "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grant_title"
    t.integer "resources_count"
    t.index ["institution_id"], name: "index_grants_on_institution_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_institutions_on_name"
  end

  create_table "pings", force: :cascade do |t|
    t.boolean "status"
    t.boolean "latest"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_pings_on_resource_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "file_name"
    t.string "url"
    t.string "checksum"
    t.string "slug"
    t.boolean "active"
    t.string "access"
    t.integer "pings_count"
    t.bigint "grant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grant_id"], name: "index_resources_on_grant_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "res_code"
    t.string "res_message"
    t.decimal "res_time"
    t.text "status"
    t.text "submitted_query"
    t.boolean "latest"
    t.bigint "resources_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resources_id"], name: "index_statuses_on_resources_id"
  end

  add_foreign_key "grants", "institutions"
  add_foreign_key "pings", "resources"
  add_foreign_key "resources", "grants"
  add_foreign_key "statuses", "resources", column: "resources_id"
end
