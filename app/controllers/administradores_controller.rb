class AdministradoresController < ApplicationController
  before_action :autorizar, except: [:new, :create]
  def show
    @administrador = Administrador.find(params[:id])
  end
  def new
    @administrador = Administrador.new
  end
  def create
    @administrador = Administrador.new(parametros_administrador)
    if @administrador.save
      redirect_to @administrador, notice: "Administrador criado com sucesso!"
    else
      render 'new'
    end
  end
  def index
    @administradores = Administrador.all
  end
  private
  def parametros_administrador
    params.require(:administrador).permit(:nome, :email, :telefone, :cidade_voluntario, :password, :password_confirmation)
  end
end
