class AddDiretorioArquivo < ActiveRecord::Migration[6.0]
  def change
    add_column :arquivos, :diretorio_arquivo, :string
  end
end