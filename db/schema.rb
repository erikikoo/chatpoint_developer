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

ActiveRecord::Schema.define(version: 20161119113523) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "chats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_passwords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "client_id"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["client_id"], name: "index_client_passwords_on_client_id", using: :btree
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "cliente"
    t.string   "cidade"
    t.string   "bairro"
    t.string   "contato"
    t.string   "fone"
    t.boolean  "status"
    t.string   "url"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "username"
    t.string   "password"
    t.integer  "sign_in_count", default: 0
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.string   "user_to",    limit: 11
    t.string   "status",     limit: 1
    t.integer  "chat_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "chat_id"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "active",     limit: 1, default: "0"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "celular"
    t.string   "email"
    t.date     "nascimento"
    t.string   "sexo",            limit: 1
    t.string   "cidade"
    t.string   "bairro"
    t.boolean  "is_login",                  default: false
    t.string   "avatar"
    t.integer  "client_id"
    t.boolean  "block",                     default: false
    t.index ["client_id"], name: "index_users_on_client_id", using: :btree
  end

  add_foreign_key "client_passwords", "clients"
  add_foreign_key "users", "clients"
end
