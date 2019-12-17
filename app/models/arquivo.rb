class Arquivo < ApplicationRecord
  validates :diretorio_arquivo, presence: true

  def self.upload_arquivo(arquivo, diretorio)
    FileUtils.mkdir_p(diretorio) unless File.exists?(diretorio)
    arquivo.each do |arq|
      File.open(File.join(diretorio, arq.original_filename), "wb") { |f| f.write(arq.read) }
    end
  end

  def self.download_arquivo(diretorio)
    Zip::File.open(diretorio+'.zip', Zip::File::CREATE) do |arquivo_zip|
      Dir.chdir diretorio
      Dir.glob("**/*").reject { |e| File.directory?(e) }.each do |arquivo|
        puts "Adicionando #{arquivo}"
        arquivo_zip.add(arquivo.sub(diretorio + '/', ''), arquivo)
      end
    end
  end
end