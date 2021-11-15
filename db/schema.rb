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

ActiveRecord::Schema.define(version: 2021_08_11_194408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calitatis", force: :cascade do |t|
    t.string "denumire"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "calitatis_relatares", id: false, force: :cascade do |t|
    t.bigint "calitati_id", null: false
    t.bigint "relatare_id", null: false
    t.index ["calitati_id", "relatare_id"], name: "index_calitatis_relatares_on_calitati_id_and_relatare_id"
    t.index ["relatare_id", "calitati_id"], name: "index_calitatis_relatares_on_relatare_id_and_calitati_id"
  end

  create_table "relatare_temes", force: :cascade do |t|
    t.integer "relatare_id"
    t.integer "teme_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relatares", force: :cascade do |t|
    t.text "textro"
    t.text "texten"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "temes", force: :cascade do |t|
    t.string "denumire"
    t.text "despre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
