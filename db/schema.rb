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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140716211143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "chats", ["group_id"], name: "index_chats_on_group_id", using: :btree

  create_table "directions", force: true do |t|
    t.string   "name"
    t.string   "details"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "directions", ["group_id"], name: "index_directions_on_group_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "theme_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "groups", ["theme_id"], name: "index_groups_on_theme_id", using: :btree

  create_table "invites", force: true do |t|
    t.string   "email"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["group_id"], name: "index_links_on_group_id", using: :btree

  create_table "packing_items", force: true do |t|
    t.string   "name"
    t.boolean  "is_packed"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "packed_by"
  end

  add_index "packing_items", ["group_id"], name: "index_packing_items_on_group_id", using: :btree

  create_table "plans", force: true do |t|
    t.string   "activity"
    t.integer  "schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "activity_time"
  end

  add_index "plans", ["schedule_id"], name: "index_plans_on_schedule_id", using: :btree

  create_table "poll_options", force: true do |t|
    t.string   "option"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "poll_id"
  end

  add_index "poll_options", ["poll_id"], name: "index_poll_options_on_poll_id", using: :btree

  create_table "polls", force: true do |t|
    t.string   "topic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "polls", ["group_id"], name: "index_polls_on_group_id", using: :btree

  create_table "posts", force: true do |t|
    t.text     "description"
    t.string   "profile_image_url"
    t.string   "user_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tag_id"
  end

  add_index "posts", ["tag_id"], name: "index_posts_on_tag_id", using: :btree

  create_table "schedules", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.date     "date"
  end

  add_index "schedules", ["group_id"], name: "index_schedules_on_group_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "themes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "user_groups", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id", using: :btree
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
