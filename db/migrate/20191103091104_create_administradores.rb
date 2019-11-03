class CreateAdministradores < ActiveRecord::Migration[6.0]
  def change
    create_table :administradores do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :cidade_voluntario

      t.timestamps
    end
  end
end
