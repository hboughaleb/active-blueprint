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

ActiveRecord::Schema.define(version: 20171115183517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "task_id"
    t.date     "upload_date"
    t.date     "object_date"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "status"
    t.index ["task_id"], name: "index_documents_on_task_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.string   "destination"
    t.string   "sender"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.decimal  "projected_buget"
    t.string   "address"
    t.boolean  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "project_type"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["project_type", "project_id"], name: "index_tasks_on_project_type_and_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "roles"
    t.string   "username"
    t.string   "phone_number"
    t.string   "address"
    t.string   "LinkedIn_page"
    t.string   "Facebook_page"
    t.string   "website"
    t.string   "ln_uid"
    t.string   "ln_emalil"
    t.string   "ln_picture_url"
    t.string   "ln_location"
    t.string   "industry"
    t.string   "ln_public_profile_url"
    t.string   "ln_token"
    t.datetime "ln_token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "documents", "tasks"
  add_foreign_key "projects", "users"
end
