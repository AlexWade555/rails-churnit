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

ActiveRecord::Schema.define(version: 2022_03_09_003208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_sessions_on_card_id"
    t.index ["user_id"], name: "index_card_sessions_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_name"
    t.string "card_image_url"
    t.string "card_type"
    t.string "reward_category"
    t.decimal "reward_rate"
    t.decimal "interest_free_period"
    t.decimal "annual_fee_init"
    t.decimal "bonus_point_spend"
    t.decimal "bonus_point_time"
    t.decimal "bonus_point_reward"
    t.decimal "interest_rate"
    t.decimal "late_payment_fee"
    t.decimal "foreign_transaction_fee"
    t.decimal "minimum_income"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "annual_fee_after"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "income"
    t.integer "spend"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "card_sessions", "cards"
  add_foreign_key "card_sessions", "users"
  add_foreign_key "cards", "users"
end
