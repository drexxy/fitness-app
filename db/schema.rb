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

ActiveRecord::Schema.define(version: 20171123175312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.integer "number"
    t.integer "set_exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days_workouts", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "day_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "muscle_group"
    t.string "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "goal_id"
    t.integer "days"
    t.string "experience"
    t.string "profile_picture"
    t.float "weight"
  end

  create_table "set_exercises", force: :cascade do |t|
    t.integer "sets"
    t.string "reps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "exercise_id"
    t.integer "day_id"
  end

  create_table "trainer_profiles", force: :cascade do |t|
    t.string "name"
    t.string "profile_picture"
    t.string "gym_name"
    t.string "gym_postcode"
    t.string "years_experience"
    t.string "qualification"
    t.string "rate"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "difficulty"
    t.string "purpose"
  end

end
