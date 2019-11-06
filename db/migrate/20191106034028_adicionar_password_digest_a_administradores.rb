class AdicionarPasswordDigestAAdministradores < ActiveRecord::Migration[6.0]
  def change
    add_column :administradores, :password_digest, :string
  end
end
