class ArquivosController < ApplicationController
  before_action :autorizar, except: [:show, :download_arquivo]
  def index
    @arquivos = Arquivo.order(id: :desc)
  end
  def show
    @arquivos = Arquivo.order(id: :desc)
  end
  def remover_arquivo
    @arquivo = Arquivo.find(params[:id])
    @arquivo.destroy
    redirect_to action: :index
  end
  def upload_arquivo
    @arquivo = Arquivo.new
    @arquivo.diretorio_arquivo = "#{add_apostila_path}/arquivos/#{Time.now.strftime("%d%m%Y%H%M%S%6N")}"
    Arquivo.upload_arquivo(params[:arquivo], @arquivo.diretorio_arquivo)
    @arquivo.save
    redirect_to action: :index
  end
  def download_arquivo
    Arquivo.download_arquivo(params[:diretorio])
    send_file params[:diretorio]+'.zip'
  end
end