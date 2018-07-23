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

ActiveRecord::Schema.define(version: 2018_07_22_222440) do

  create_table "benefits", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "benefits_plans", id: false, force: :cascade do |t|
    t.integer "plan_id", null: false
    t.integer "benefit_id", null: false
    t.index ["benefit_id", "plan_id"], name: "index_benefits_plans_on_benefit_id_and_plan_id"
    t.index ["plan_id", "benefit_id"], name: "index_benefits_plans_on_plan_id_and_benefit_id", unique: true
  end

  create_table "countries", id: :string, force: :cascade do |t|
    t.string "currency", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "price_hundredths", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "countries_id"
    t.index ["countries_id"], name: "index_plans_on_countries_id"
  end

end
