class AddTumaToAlunos < ActiveRecord::Migration[6.0]
  def change
    add_reference :alunos, :turma
    add_foreign_key :alunos, :turmas
  end
end
