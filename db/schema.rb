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

ActiveRecord::Schema.define(version: 20150206135403) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "keyword"
    t.string   "description"
    t.text     "content"
    t.string   "img"
    t.integer  "parent_id",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characteristics", force: true do |t|
    t.string   "name"
    t.integer  "position",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "tel"
    t.string   "login"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true

  create_table "dostavkas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goodparams", force: true do |t|
    t.string   "value"
    t.integer  "characteristic_id"
    t.integer  "good_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods", force: true do |t|
    t.string   "name"
    t.string   "articul"
    t.string   "keyword"
    t.string   "description"
    t.string   "img",         default: "no_image.jpg"
    t.integer  "category_id"
    t.text     "anons"
    t.text     "content"
    t.boolean  "presence",    default: true
    t.boolean  "visible",     default: true
    t.boolean  "hits",        default: false
    t.boolean  "fresh",       default: false
    t.boolean  "sale",        default: false
    t.integer  "price"
    t.string   "img_slide"
    t.integer  "views",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goodsinorders", force: true do |t|
    t.integer  "order_id"
    t.integer  "good_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "informers", force: true do |t|
    t.string   "name"
    t.integer  "informer_position", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.string   "title"
    t.integer  "informer_id"
    t.integer  "link_position", default: 0
    t.string   "keyword"
    t.string   "description"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.string   "keywords"
    t.string   "description"
    t.string   "anons"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "customer_id"
    t.integer  "dostavka_id"
    t.integer  "payment_id"
    t.boolean  "status",      default: false
    t.string   "mail"
    t.string   "tel"
    t.string   "address"
    t.string   "name"
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "keyword"
    t.string   "description"
    t.string   "content"
    t.integer  "position",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
