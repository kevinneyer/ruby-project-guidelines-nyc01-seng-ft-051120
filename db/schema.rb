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
ActiveRecord::Schema.define(version: 20200526212202) do
=======
ActiveRecord::Schema.define(version: 20200526225239) do

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.string "content"
  end

  create_table "bulletin_boards", force: :cascade do |t|
    t.integer "announcement_id"
    t.integer "teacher_id"
  end
>>>>>>> a4d0321df87013a24f8c9c60130c3e5571a574e7

  create_table "classrooms", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.integer "session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "students", force: :cascade do |t|
    t.string  "name"
    t.integer "grade"
    t.float   "gpa"
  end

  create_table "study_group_sessions", force: :cascade do |t|
    t.integer "student_id"
    t.integer "study_group_id"
  end

  create_table "study_groups", force: :cascade do |t|
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "subject"
    t.string   "remarks"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "subject"
  end

end
