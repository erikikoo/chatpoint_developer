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

ActiveRecord::Schema.define(version: 20161214172025) do

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
    t.string   "logo"
  end

  create_table "inscription_in_the_establishments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_perfil_id"
    t.integer  "client_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["client_id"], name: "index_inscription_in_the_establishments_on_client_id", using: :btree
    t.index ["user_perfil_id"], name: "index_inscription_in_the_establishments_on_user_perfil_id", using: :btree
  end

  create_table "mensagems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.text     "content",    limit: 65535
    t.boolean  "all",                      default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "title"
    t.string   "email"
    t.index ["user_id"], name: "index_mensagems_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "chat_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "status",     limit: 1
    t.integer  "user_to"
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "chat_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "active",     default: false
  end

  create_table "user_blocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_perfil_id"
    t.integer  "user_perfil_blocked"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["user_perfil_id"], name: "index_user_blocks_on_user_perfil_id", using: :btree
  end

  create_table "user_perfils", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "celular"
    t.string   "email"
    t.date     "nascimento"
    t.string   "sexo"
    t.string   "cidade"
    t.string   "bairro"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "avatar"
    t.boolean  "is_login",   default: true
    t.boolean  "block",      default: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_perfil_id"
    t.index ["user_perfil_id"], name: "index_users_on_user_perfil_id", using: :btree
  end

  add_foreign_key "client_passwords", "clients"
  add_foreign_key "inscription_in_the_establishments", "clients"
  add_foreign_key "inscription_in_the_establishments", "user_perfils"
  add_foreign_key "mensagems", "users"
  add_foreign_key "user_blocks", "user_perfils"
  add_foreign_key "users", "user_perfils"
end
