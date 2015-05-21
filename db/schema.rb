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

ActiveRecord::Schema.define(version: 20150521162655) do

  create_table "aplicarcobranzas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contactos", force: :cascade do |t|
    t.string   "titulo"
    t.string   "correo"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documentoscobranzas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "dns"
    t.string   "rfc"
    t.string   "urlwebservice"
    t.string   "usuariosob"
    t.string   "passob"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "email"
    t.string   "es_jci"
    t.boolean  "inventario"
    t.boolean  "filtromarca"
    t.boolean  "filtrocategoria"
  end

  create_table "escribepedidos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impresion_documentos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listaprecios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metodopagos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidolineas", force: :cascade do |t|
    t.string   "pedido_id"
    t.string   "producto"
    t.string   "product_value"
    t.string   "product_id"
    t.float    "precio"
    t.float    "cantidad"
    t.float    "total"
    t.string   "imagen"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.decimal  "maximo"
    t.float    "impuesto"
    t.float    "precioob"
    t.float    "precioproductoextra"
    t.string   "productoextra"
    t.float    "impuestoextra"
  end

  create_table "pedidos", force: :cascade do |t|
    t.string   "usuario_id"
    t.float    "total"
    t.float    "subtotal"
    t.boolean  "abierto"
    t.boolean  "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidosobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "precios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
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
    t.string   "nombre"
    t.integer  "empresa_id"
    t.string   "rfcempresa"
    t.string   "rfc"
    t.string   "title"
    t.string   "correo"
    t.boolean  "isadmin"
    t.string   "role"
    t.string   "partner_id"
    t.string   "vendor_id"
    t.string   "customer_name"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["empresa_id"], name: "index_usuarios_on_empresa_id"
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true

end
