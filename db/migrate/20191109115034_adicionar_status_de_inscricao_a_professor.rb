class AdicionarStatusDeInscricaoAProfessor < ActiveRecord::Migration[6.0]
  def change
    add_column :professors, :inscricao_aprovada, :boolean
  end
end
