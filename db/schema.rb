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

ActiveRecord::Schema.define(:version => 20131109205427) do

  create_table "groups", :force => true do |t|
    t.string   "group_name"
    t.string   "group_description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "group_id"
    t.string   "group_name"
    t.string   "title"
  end

  add_index "microposts", ["group_id", "created_at"], :name => "index_microposts_on_group_id_and_created_at"
  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "joiner_id"
    t.integer  "joined_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "relationships", ["joined_id"], :name => "index_relationships_on_joined_id"
  add_index "relationships", ["joiner_id", "joined_id"], :name => "index_relationships_on_joiner_id_and_joined_id", :unique => true
  add_index "relationships", ["joiner_id"], :name => "index_relationships_on_joiner_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",             :default => false
    t.boolean  "annoucement",       :default => false
    t.boolean  "annoucement_email", :default => false
    t.boolean  "carpool",           :default => false
    t.boolean  "carpool_email",     :default => false
    t.boolean  "rent_lease",        :default => false
    t.boolean  "rent_lease_email",  :default => false
    t.boolean  "sale",              :default => false
    t.boolean  "sale_email",        :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
