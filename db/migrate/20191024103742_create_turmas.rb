class CreateTurmas < ActiveRecord::Migration[6.0]
  def change
    create_table :turmas do |t|
      t.string :nome
      t.timestamps
    end
    create_table :turmas_professors, id: false do |t|
      t.belongs_to :turma
      t.belongs_to :professor
    end
    add_column :alunos, :belongs_to, :turma
  end
end