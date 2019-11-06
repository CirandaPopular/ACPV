class AdicionarPasswordDigestEmUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :password_digest, :string
  end
end
