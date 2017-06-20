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
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170617213515) do
=======
ActiveRecord::Schema.define(version: 20170617233105) do
>>>>>>> dfc2eac867d7be703f16c18d955701245c404f6c
=======
ActiveRecord::Schema.define(version: 20170619233205) do
>>>>>>> 97242b0c7aedd67e50a8c88f30fb1a6e8ab7f892

  create_table "events", force: :cascade do |t|
    t.string "source"
    t.string "source_id"
    t.integer "user_id"
    t.text "description"
    t.text "photo"
    t.string "date"
    t.string "price"
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
  end

end
