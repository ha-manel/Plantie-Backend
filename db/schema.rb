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

ActiveRecord::Schema[7.0].define(version: 2022_11_22_092017) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.string "habitat"
    t.boolean "new", default: false
    t.boolean "trending", default: false
    t.decimal "discount", default: "0.0"
    t.string "water"
    t.decimal "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_wishlists_on_plant_id"
    t.index ["user_id", "plant_id"], name: "index_wishlists_on_user_id_and_plant_id", unique: true
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "wishlists", "plants", on_delete: :cascade
  add_foreign_key "wishlists", "users", on_delete: :cascade
end
