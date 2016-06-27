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

ActiveRecord::Schema.define(version: 20160621210654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.integer  "tipo_de_pessoa_id",   null: false
    t.string   "numero_do_documento", null: false
    t.string   "inscricao_estadual"
    t.string   "inscricao_municipal"
    t.string   "razao_social",        null: false
    t.string   "nome_fantasia"
    t.string   "cep",                 null: false
    t.string   "endereco",            null: false
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro",              null: false
    t.integer  "pais_id",             null: false
    t.integer  "uf_id",               null: false
    t.integer  "municipio_id",        null: false
    t.integer  "user_id",             null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "emissores", force: :cascade do |t|
    t.integer  "user_id",             null: false
    t.string   "nome_fantasia"
    t.string   "razao_social"
    t.string   "inscricao_estadual"
    t.string   "inscricao_municipal"
    t.string   "cep"
    t.string   "logradouro"
    t.string   "numero_do_endereco"
    t.string   "complemento"
    t.string   "bairro"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "tipo_de_pessoa_id",   null: false
    t.integer  "uf_id",               null: false
    t.integer  "municipio_id",        null: false
  end

  create_table "municipios", force: :cascade do |t|
    t.string   "nome",                        null: false
    t.integer  "codigo_ibge",                 null: false
    t.boolean  "capital",     default: false, null: false
    t.integer  "uf_id",                       null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "paises", force: :cascade do |t|
    t.string   "nome",            null: false
    t.integer  "codigo_ibge",     null: false
    t.string   "codigo_siscomex", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tipos_de_pessoas", force: :cascade do |t|
    t.string   "codigo",           null: false
    t.string   "nome_por_extenso", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "ufs", force: :cascade do |t|
    t.integer  "codigo_ibge",      null: false
    t.string   "nome",             null: false
    t.string   "nome_por_extenso", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
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
    t.string   "cnpj",                                null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
