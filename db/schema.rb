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

ActiveRecord::Schema.define(version: 2021_02_12_173345) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "common_interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "common_interests_contacts", id: false, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "common_interest_id", null: false
    t.index ["contact_id", "common_interest_id"], name: "index_common_interests_contacts_link"
  end

  create_table "contact_groups", force: :cascade do |t|
    t.string "name"
    t.date "last_contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_groups_contacts", id: false, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "contact_group_id", null: false
    t.index ["contact_id", "contact_group_id"], name: "index_contact_groups_contacts_link"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_contacts_on_category_id"
  end

  add_foreign_key "contacts", "categories"
end
