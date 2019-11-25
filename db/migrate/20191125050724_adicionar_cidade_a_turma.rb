class AdicionarCidadeATurma < ActiveRecord::Migration[6.0]
  def change
    add_column :turmas, :cidade_turma, :string
  end
end
