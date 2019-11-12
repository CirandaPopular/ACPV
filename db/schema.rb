# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_12_121117) do

  create_table "administradores", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "cidade_voluntario"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "eh_administrador"
    t.index ["email"], name: "index_administradores_on_email"
  end

# Could not dump table "alunos" because of following StandardError
#   Unknown type '' for column 'belongs_to'

  create_table "professors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.integer "idade"
    t.string "telefone"
    t.string "cidade"
    t.string "grau_instrucao"
    t.string "cidade_voluntario"
    t.string "disponibilidade_voluntario"
    t.string "area_atuacao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "endereco"
    t.string "password_digest"
    t.boolean "eh_administrador"
    t.boolean "inscricao_aprovada"
    t.index ["email"], name: "index_professors_on_email"
  end

  create_table "professors_turmas", id: false, force: :cascade do |t|
    t.integer "turma_id"
    t.integer "professor_id"
    t.index ["professor_id"], name: "index_professors_turmas_on_professor_id"
    t.index ["turma_id"], name: "index_professors_turmas_on_turma_id"
  end

  create_table "turmas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "alunos", "turmas"
end
