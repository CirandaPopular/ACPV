class UsuariosController < ApplicationController
  before_action :autorizar, except: [:new, :create]
  def show
    @usuario = Usuario.find(params[:id])
  end
  def new
    @usuario = Usuario.new
  end
  def create
    @usuario = Usuario.new(parametros_usuario)
    if @usuario.save
      redirect_to @usuario, notice: "Usuário foi criado com sucesso!"
      #Usuário depois de cadastrar-se acessa o sistema automaticamente
      login(@usuario)
    else
      render 'new'
    end
  end
  def index
    @usuarios = Usuario.all
  end
  private
  def parametros_usuario
    params.require(:usuario).permit(:nome, :email, :password, :password_confirmation)
  end
end
