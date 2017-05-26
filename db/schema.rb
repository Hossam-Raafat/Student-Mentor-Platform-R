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

ActiveRecord::Schema.define(version: 20170524112708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "managers", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["email"], name: "index_managers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_managers_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "mentors", force: :cascade do |t|
    t.boolean  "status",                 default: false
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.index ["email"], name: "index_mentors_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_mentors_on_invitation_token", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_mentors_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_mentors_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "body",       null: false
    t.string   "language",   null: false
    t.string   "screenshot"
    t.integer  "student_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["student_id"], name: "index_questions_on_student_id", using: :btree
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "star"
    t.integer  "response_id"
    t.integer  "student_id"
    t.integer  "mentor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["mentor_id"], name: "index_rates_on_mentor_id"
    t.index ["response_id"], name: "index_rates_on_response_id"
    t.index ["student_id"], name: "index_rates_on_student_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string   "answer"
    t.boolean  "status"
    t.integer  "question_id"
    t.integer  "mentor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["mentor_id"], name: "index_responses_on_mentor_id", using: :btree
    t.index ["question_id"], name: "index_responses_on_question_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "name"
    t.string   "program"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["email"], name: "index_students_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_students_on_invitation_token", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_students_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "student_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_votes_on_question_id", using: :btree
    t.index ["student_id"], name: "index_votes_on_student_id", using: :btree
  end

  add_foreign_key "questions", "students"
  add_foreign_key "responses", "mentors"
  add_foreign_key "responses", "questions"
  add_foreign_key "votes", "questions"
  add_foreign_key "votes", "students"
end
