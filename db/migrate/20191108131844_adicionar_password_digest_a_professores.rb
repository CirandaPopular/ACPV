class AdicionarPasswordDigestAProfessores < ActiveRecord::Migration[6.0]
  def change
    add_column :professors, :password_digest, :string
  end
end