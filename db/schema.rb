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

ActiveRecord::Schema.define(version: 2019_03_19_131750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categorias", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.bigint "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
    t.index ["slug"], name: "index_cidades_on_slug"
  end

  create_table "contatos", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "criacoes", force: :cascade do |t|
    t.datetime "data"
    t.string "titulo"
    t.string "descricao"
    t.bigint "produto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_criacoes_on_produto_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_estados_on_slug"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "historias", force: :cascade do |t|
    t.datetime "data"
    t.string "titulo"
    t.string "descricao"
    t.bigint "produtor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produtor_id"], name: "index_historias_on_produtor_id"
  end

  create_table "producoes", force: :cascade do |t|
    t.integer "numero"
    t.integer "medida", default: 0
    t.integer "periodo", default: 0
    t.bigint "produto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_producoes_on_produto_id"
  end

  create_table "produtores", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "whatsapp"
    t.boolean "cartao"
    t.string "apelido"
    t.string "sobrenome"
    t.string "slug"
    t.bigint "cidade_id"
    t.boolean "dap"
    t.boolean "pessoa_juridica"
    t.date "published_at"
    t.index ["cidade_id"], name: "index_produtores_on_cidade_id"
    t.index ["slug"], name: "index_produtores_on_slug", unique: true
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.string "preco"
    t.bigint "produtor_id"
    t.bigint "categoria_id"
    t.bigint "qualidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.date "published_at"
    t.index ["categoria_id"], name: "index_produtos_on_categoria_id"
    t.index ["produtor_id"], name: "index_produtos_on_produtor_id"
    t.index ["qualidade_id"], name: "index_produtos_on_qualidade_id"
    t.index ["slug"], name: "index_produtos_on_slug"
  end

  create_table "qualidades", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servicos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.string "preco"
    t.integer "medida", default: 0
    t.bigint "produtor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.date "published_at"
    t.index ["produtor_id"], name: "index_servicos_on_produtor_id"
    t.index ["slug"], name: "index_servicos_on_slug", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.string "codigo"
    t.bigint "produtor_id"
    t.bigint "produto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_videos_on_produto_id"
    t.index ["produtor_id"], name: "index_videos_on_produtor_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cidades", "estados"
  add_foreign_key "criacoes", "produtos"
  add_foreign_key "historias", "produtores"
  add_foreign_key "producoes", "produtos"
  add_foreign_key "produtores", "cidades"
  add_foreign_key "produtos", "categorias"
  add_foreign_key "produtos", "produtores"
  add_foreign_key "produtos", "qualidades"
  add_foreign_key "servicos", "produtores"
  add_foreign_key "videos", "produtores"
  add_foreign_key "videos", "produtos"
end
