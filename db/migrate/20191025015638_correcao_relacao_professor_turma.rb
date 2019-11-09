class CorrecaoRelacaoProfessorTurma < ActiveRecord::Migration[6.0]
  def change
    create_table :professors_turmas, id: false do |t|
      t.belongs_to :turma
      t.belongs_to :professor
    end
  end
end
