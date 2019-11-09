class AdicionandoEhAdministradorAAdministradorEProfessor < ActiveRecord::Migration[6.0]
  def change
    add_column :administradores, :eh_administrador, :boolean
    add_column :professors, :eh_administrador, :boolean
  end
end