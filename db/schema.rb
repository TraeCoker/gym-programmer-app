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

ActiveRecord::Schema.define(version: 2021_06_13_214823) do

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "movement_type"
    t.integer "sets"
    t.string "reps"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.integer "days_per_week"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "completed_workouts"
    t.string "most_recent_workout"
    t.string "date_joined"
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "exercise_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "day_of_week"
    t.integer "program_id"
  end

end
