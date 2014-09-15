# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20140915191851) do

  create_table "documents", :force => true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "material"
  end

  create_table "job_openings", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.text     "description"
    t.integer  "user_id"
    t.date     "open_date"
    t.date     "closed_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ratings", :force => true do |t|
    t.text     "comments"
    t.integer  "quantitative"
    t.integer  "qualitative"
    t.integer  "arts_landscape"
    t.integer  "artistic_training"
    t.integer  "experience"
    t.integer  "passion"
    t.integer  "communication"
    t.integer  "organization"
    t.integer  "english"
    t.integer  "cultural_sensitivity"
    t.integer  "computing"
    t.integer  "web_production"
    t.integer  "social_media"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "rater_id"
    t.integer  "applicant_id"
    t.integer  "research"
    t.integer  "archiving"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                         :default => "",    :null => false
    t.string   "encrypted_password",            :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                 :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.boolean  "submitted",                     :default => false
    t.boolean  "admin",                         :default => false
    t.text     "note"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "application_confirmation_sent", :default => false
    t.boolean  "under_consideration",           :default => true
    t.boolean  "rejection_notice_sent",         :default => false
    t.boolean  "dormant",                       :default => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
