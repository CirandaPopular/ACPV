class CreateAlunos < ActiveRecord::Migration[6.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :email
      t.integer :idade
      t.string :telefone
      t.string :rua
      t.string :bairro
      t.string :cidade
      t.string :cor
      t.string :genero
      t.string :nome_responsavel
      t.string :contato_responsavel
      t.string :escola
      t.string :tipo_escola
      t.string :grau_instrucao
      t.boolean :fez_enem
      t.string :area
      t.boolean :atuacao_mov_social

      t.timestamps
    end
  end
end
