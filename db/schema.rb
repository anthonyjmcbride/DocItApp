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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170626211546) do
=======

ActiveRecord::Schema.define(version: 20170621083819) do
>>>>>>> 95d96aa1551f21af64044a496902d208c41b53a3


  create_table "events", force: :cascade do |t|
    t.string "source"
    t.string "source_id"
    t.integer "user_id"
    t.text "description"
    t.text "photo"
    t.string "date"
    t.string "price"
  end

  create_table "models", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.string "email"
    t.string "password"
    t.integer "zipcode"
    t.string "calendar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitud"
    t.float "longitude"
    t.string "provider"
    t.string "uid"
    t.string "password_digest"
    t.string "refresh_token"
    t.string "access_token"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
<<<<<<< HEAD
    t.string "city"
=======
    t.string "refresh_token"
    t.string "access_token"
    t.string "city"

>>>>>>> 95d96aa1551f21af64044a496902d208c41b53a3
  end

end
