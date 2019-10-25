class AjustesTabelaProfessores < ActiveRecord::Migration[6.0]
  def change
    add_column :professors, :endereco, :string
    remove_column :professors, :bairro, :string
    change_column :professors, :disponibilidade_voluntario, :string
  end
end
