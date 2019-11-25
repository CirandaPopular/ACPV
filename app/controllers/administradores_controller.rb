class AdministradoresController < ApplicationController
  before_action :autorizar_administrador, except:[:new, :create]
  attr_accessor :eh_administrador
  def show
    @administrador = Administrador.find(params[:id])
  end
  def new
    @administrador = Administrador.new
  end
  def edit
    @administrador = Administrador.find(params[:id])
  end
  def create
    @administrador = Administrador.new(parametros_administrador)
    @administrador.eh_administrador = true
    aux = @administrador.cidade_voluntario.split('_')
    @administrador.cidade_voluntario = aux[2]
    if @administrador.save
      redirect_to @administrador
    else
      render 'new'
    end
  end
  def update
    @administrador = Administrador.find(params[:id])
    aux = @administrador.cidade_voluntario.split('_')
    @administrador.cidade_voluntario = aux[2]
    if @administrador.update!(parametros_administrador)
      redirect_to @administrador
    else
      render 'edit'
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