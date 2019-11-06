class AdicionarIndexAEmailDeAdministradores < ActiveRecord::Migration[6.0]
  def change
    add_index :administradores, :email
  end
end
