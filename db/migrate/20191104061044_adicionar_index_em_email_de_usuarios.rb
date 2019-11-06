class AdicionarIndexEmEmailDeUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_index :usuarios, :email
  end
end
