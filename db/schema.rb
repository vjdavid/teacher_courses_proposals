# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_18_112559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_proposals", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_proposals_on_course_id"
    t.index ["teacher_id"], name: "index_course_proposals_on_teacher_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "votes_count", default: 0, null: false
    t.index ["title"], name: "index_courses_on_title"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "description"
    t.string "email", null: false
    t.string "full_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "votes_count", default: 0, null: false
    t.string "password_digest"
    t.string "token"
    t.index ["email"], name: "index_teachers_on_email"
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type", null: false
    t.bigint "votable_id", null: false
    t.bigint "voter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "course_proposals", "courses"
  add_foreign_key "course_proposals", "teachers"
  add_foreign_key "votes", "teachers", column: "voter_id"
end
