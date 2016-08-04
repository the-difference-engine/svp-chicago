# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160729012208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "loi_id"
    t.string   "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "loi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
    t.string   "name"
  end

  create_table "challenges", force: :cascade do |t|
    t.integer  "answer_id"
    t.string   "challenge"
    t.string   "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ftes", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "amount_1"
    t.integer  "amount_2"
    t.integer  "amount_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invite_maxes", force: :cascade do |t|
    t.integer  "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invited_lois", force: :cascade do |t|
    t.integer  "loi_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landings", force: :cascade do |t|
    t.string   "year"
    t.string   "sector_focus"
    t.text     "main_points"
    t.text     "gray_section"
    t.text     "last_point"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "lois", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "submitted",  default: false
    t.integer  "user_id"
    t.boolean  "status"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "section_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "loi_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "q1"
    t.integer  "q2"
    t.integer  "q3"
    t.integer  "q4"
    t.string   "q5"
    t.integer  "weighted_score"
  end

  create_table "rfp_answers", force: :cascade do |t|
    t.integer  "rfp_question_id"
    t.integer  "rfp_id"
    t.string   "answer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "rfp_questions", force: :cascade do |t|
    t.integer  "rfp_section_id"
    t.string   "question"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "question_type"
  end

  create_table "rfp_sections", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rfps", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_answers", force: :cascade do |t|
    t.integer  "sub_question_id"
    t.integer  "user_id"
    t.integer  "rfp_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "answer"
  end

  create_table "sub_questions", force: :cascade do |t|
    t.integer  "rfp_question_id"
    t.string   "question"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "super_admin",            default: false
    t.boolean  "active_account",         default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
