class AdicionarStatusDeInscricaoAluno < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :inscricao_aprovada, :boolean
  end
end
