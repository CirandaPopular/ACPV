class CreateProfessors < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :email
      t.integer :idade
      t.string :telefone
      t.string :rua
      t.string :bairro
      t.string :cidade
      t.string :grau_instrucao
      t.string :cidade_voluntario
      t.boolean :disponibilidade_voluntario
      t.string :area_atuacao

      t.timestamps
    end
  end
end
