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

ActiveRecord::Schema.define(version: 20171123210239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", id: :serial, force: :cascade do |t|
    t.string "attachinariable_type"
    t.integer "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "documents", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.date "upload_date"
    t.date "object_date"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.index ["task_id"], name: "index_documents_on_task_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.text "content"
    t.string "destination"
    t.string "sender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.decimal "projected_budget"
    t.string "address"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "specialties", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "start"
    t.datetime "finish"
    t.integer "progress"
    t.string "dependencies", default: ""
    t.string "custom_class"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "budget"
    t.index ["project_id"], name: "index_specialties_on_project_id"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.string "status"
    t.datetime "start"
    t.datetime "finish"
    t.string "zone"
    t.integer "budget"
    t.integer "priority"
    t.string "parent_task"
    t.string "dependencies", default: ""
    t.integer "user_id"
    t.integer "progress"
    t.string "custom_class"
    t.integer "specialty_id"
    t.index ["specialty_id"], name: "index_tasks_on_specialty_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.string "roles"
    t.string "username"
    t.string "phone_number"
    t.string "address"
    t.string "LinkedIn_page"
    t.string "Facebook_page"
    t.string "website"
    t.string "ln_uid"
    t.string "ln_emalil"
    t.string "ln_picture_url"
    t.string "ln_location"
    t.string "industry"
    t.string "ln_public_profile_url"
    t.string "ln_token"
    t.datetime "ln_token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "documents", "tasks"
  add_foreign_key "projects", "users"
  add_foreign_key "specialties", "projects"
  add_foreign_key "tasks", "specialties"
  add_foreign_key "tasks", "users"
end
