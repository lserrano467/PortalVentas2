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

ActiveRecord::Schema.define(version: 20150923191727) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "categoryState", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment",      limit: 255
    t.string   "commentState", limit: 255
    t.date     "commentDate"
    t.integer  "feature_id",   limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["feature_id"], name: "index_comments_on_feature_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "features", force: :cascade do |t|
    t.string   "tittle",             limit: 255
    t.string   "price",              limit: 255
    t.date     "publicationDate"
    t.string   "publicationState",   limit: 255
    t.string   "description",        limit: 255
    t.integer  "flaggings_count",    limit: 4
    t.integer  "totalLikes",         limit: 4
    t.integer  "user_id",            limit: 4
    t.integer  "category_id",        limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "features", ["category_id"], name: "index_features_on_category_id", using: :btree
  add_index "features", ["user_id"], name: "index_features_on_user_id", using: :btree

  create_table "flaggings", force: :cascade do |t|
    t.string   "flaggable_type", limit: 255
    t.integer  "flaggable_id",   limit: 4
    t.string   "flagger_type",   limit: 255
    t.integer  "flagger_id",     limit: 4
    t.text     "reason",         limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flaggings", ["flaggable_type", "flaggable_id"], name: "index_flaggings_on_flaggable_type_and_flaggable_id", using: :btree
  add_index "flaggings", ["flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], name: "access_flaggings", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "notification",     limit: 255
    t.date     "notificationDate"
    t.integer  "feature_id",       limit: 4
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "notifications", ["feature_id"], name: "index_notifications_on_feature_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "lastName",        limit: 255
    t.string   "userName",        limit: 255
    t.string   "email",           limit: 255
    t.string   "phone",           limit: 255
    t.string   "userType",        limit: 255
    t.integer  "flaggings_count", limit: 4
    t.string   "password_digest", limit: 255
    t.string   "provider",        limit: 255
    t.string   "uid",             limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
