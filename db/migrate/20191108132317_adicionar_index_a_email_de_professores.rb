class AdicionarIndexAEmailDeProfessores < ActiveRecord::Migration[6.0]
  def change
    add_index :professors, :email
  end
end
