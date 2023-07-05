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

ActiveRecord::Schema[7.0].define(version: 2023_07_03_153810) do
  create_table "animal_scientific_orders", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "note"
    t.string "typeable_type"
    t.bigint "typeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["typeable_type", "typeable_id"], name: "index_cards_on_typeable"
  end

  create_table "faunas", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "animal_scientific_order_id", null: false
    t.bigint "habitat_id", null: false
    t.bigint "micro_habitat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_scientific_order_id"], name: "index_faunas_on_animal_scientific_order_id"
    t.index ["habitat_id"], name: "index_faunas_on_habitat_id"
    t.index ["micro_habitat_id"], name: "index_faunas_on_micro_habitat_id"
  end

  create_table "faunas_predators", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "fauna_id"
    t.bigint "predator_id"
    t.index ["fauna_id"], name: "index_faunas_predators_on_fauna_id"
    t.index ["predator_id"], name: "index_faunas_predators_on_predator_id"
  end

  create_table "floras", charset: "utf8mb4", force: :cascade do |t|
    t.string "associated_species"
    t.string "buildup_speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habitats", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "micro_habitats", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scenarii", charset: "utf8mb4", force: :cascade do |t|
    t.string "author"
    t.string "name"
    t.integer "level"
    t.string "subject"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "firstname", default: "", null: false
    t.string "lastname", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "admin", default: false
    t.string "jti", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "faunas", "animal_scientific_orders"
  add_foreign_key "faunas", "habitats"
  add_foreign_key "faunas", "micro_habitats"
  add_foreign_key "faunas_predators", "faunas"
  add_foreign_key "faunas_predators", "faunas", column: "predator_id"
end
