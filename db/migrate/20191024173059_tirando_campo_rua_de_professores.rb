class TirandoCampoRuaDeProfessores < ActiveRecord::Migration[6.0]
  def change
    remove_column :professors, :rua, :string
  end
end
