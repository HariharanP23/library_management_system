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

ActiveRecord::Schema[7.1].define(version: 2024_01_15_104431) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_copies", force: :cascade do |t|
    t.string "book_copy_no"
    t.bigint "book_id", null: false
    t.bigint "library_id", null: false
    t.boolean "hidden"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_copies_on_book_id"
    t.index ["library_id"], name: "index_book_copies_on_library_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "isbn"
    t.date "published_date"
    t.integer "copies_available"
    t.integer "total_copies"
    t.integer "price"
    t.string "row"
    t.text "description"
    t.bigint "category_id", null: false
    t.bigint "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_books_on_category_id"
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_categories_on_library_id"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.date "start_date"
    t.date "due_date"
    t.date "return_date"
    t.integer "fine_amount"
    t.bigint "member_id", null: false
    t.bigint "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_entries_on_book_id"
    t.index ["library_id"], name: "index_entries_on_library_id"
    t.index ["member_id"], name: "index_entries_on_member_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "library_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_type"
    t.string "doj"
    t.string "dob"
    t.string "phone_no"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_faculties_on_email", unique: true
    t.index ["library_id"], name: "index_faculties_on_library_id"
    t.index ["reset_password_token"], name: "index_faculties_on_reset_password_token", unique: true
  end

  create_table "issues", force: :cascade do |t|
    t.bigint "book_copy_id", null: false
    t.bigint "member_id", null: false
    t.bigint "library_id", null: false
    t.string "fine"
    t.string "description"
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_copy_id"], name: "index_issues_on_book_copy_id"
    t.index ["book_id"], name: "index_issues_on_book_id"
    t.index ["library_id"], name: "index_issues_on_library_id"
    t.index ["member_id"], name: "index_issues_on_member_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "library_id"
    t.string "name"
    t.string "location"
    t.date "established_date"
    t.time "opening_hours_start"
    t.time "opening_hours_end"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "code"
    t.date "dob"
    t.string "phone_no"
    t.date "expired_at"
    t.integer "amount"
    t.bigint "library_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["library_id"], name: "index_members_on_library_id"
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  add_foreign_key "book_copies", "books"
  add_foreign_key "book_copies", "libraries"
  add_foreign_key "books", "categories"
  add_foreign_key "books", "libraries"
  add_foreign_key "categories", "libraries"
  add_foreign_key "entries", "books"
  add_foreign_key "entries", "libraries"
  add_foreign_key "entries", "members"
  add_foreign_key "faculties", "libraries"
  add_foreign_key "issues", "book_copies"
  add_foreign_key "issues", "books"
  add_foreign_key "issues", "libraries"
  add_foreign_key "issues", "members"
  add_foreign_key "members", "libraries"
end
