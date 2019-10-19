class TrocarBooleanPorStringEmAlunos < ActiveRecord::Migration[6.0]
  def change
    change_column :alunos, :fez_enem, :string
    change_column :alunos, :atuacao_mov_social, :string
  end
end