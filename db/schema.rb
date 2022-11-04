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

ActiveRecord::Schema[7.0].define(version: 2022_11_03_094417) do
  create_table "credits_histories", force: :cascade do |t|
    t.integer "balance"
    t.string "operation"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credits_histories_on_user_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "status"
    t.string "token_auth"
    t.string "cellphone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "sender_id", null: false
    t.text "text"
    t.integer "size"
    t.integer "parts"
    t.boolean "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_messages_on_sender_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.integer "message_id", null: false
    t.string "phone"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_recipients_on_message_id"
  end

  create_table "sender_requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reason"
    t.index ["name"], name: "index_sender_requests_on_name", unique: true
    t.index ["user_id"], name: "index_sender_requests_on_user_id"
  end

  create_table "sender_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "sender_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_sender_users_on_sender_id"
    t.index ["user_id"], name: "index_sender_users_on_user_id"
  end

  create_table "senders", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "pattern"
  end

  create_table "user_credits", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "balace"
    t.string "operation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_credits_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "cellphone"
    t.integer "status"
    t.integer "otp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "credits_histories", "users"
  add_foreign_key "messages", "senders"
  add_foreign_key "messages", "users"
  add_foreign_key "recipients", "messages"
  add_foreign_key "sender_requests", "users"
  add_foreign_key "sender_users", "senders"
  add_foreign_key "sender_users", "users"
  add_foreign_key "user_credits", "users"
end
