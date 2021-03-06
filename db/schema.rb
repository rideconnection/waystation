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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120207002840) do

  create_table "referrals", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "customer_phone"
    t.string   "case_manager_name"
    t.string   "case_manager_email"
    t.string   "username"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ucr_form_file_name"
    t.string   "ucr_form_content_type"
    t.integer  "ucr_form_file_size"
    t.datetime "ucr_form_updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "active",                :default => true
    t.text     "progress_notes"
    t.boolean  "completed"
    t.datetime "completed_at"
    t.text     "followup_notes"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type",     :limit => 50
    t.boolean  "active",                      :default => true
  end

end
