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

ActiveRecord::Schema[8.0].define(version: 2025_02_05_123031) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "daily_tasks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_daily_tasks_on_user_id"
  end

  create_table "health_syncs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.json "health_data"
    t.string "data_type"
    t.datetime "synced_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_health_syncs_on_user_id"
  end

  create_table "menstruation_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.integer "cycle_length"
    t.integer "period_length"
    t.string "symptoms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_menstruation_logs_on_user_id"
  end

  create_table "post_templates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "content"
    t.string "hashtags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_post_templates_on_user_id"
  end

  create_table "task_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "daily_task_id", null: false
    t.boolean "completed", default: false, null: false
    t.datetime "completed_at"
    t.date "recorded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_task_id"], name: "index_task_logs_on_daily_task_id"
    t.index ["user_id"], name: "index_task_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.float "height"
    t.float "start_weight"
    t.float "target_weight"
    t.date "target_date"
    t.string "theme_color"
    t.string "name"
    t.string "avatar_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "weight_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "weight", null: false
    t.date "recorded_at", null: false
    t.string "note"
    t.float "weight_diff", null: false
    t.float "progress_rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_weight_logs_on_user_id"
  end

  add_foreign_key "daily_tasks", "users"
  add_foreign_key "health_syncs", "users"
  add_foreign_key "menstruation_logs", "users"
  add_foreign_key "post_templates", "users"
  add_foreign_key "task_logs", "daily_tasks"
  add_foreign_key "task_logs", "users"
  add_foreign_key "weight_logs", "users"
end
