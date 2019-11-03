class AdministradoresController < ApplicationController
  def show
    @administrador = Administrador.find(params[:id])
  end
  def new
    @administrador = Administrador.new
  end
  def create
    @administrador = Administrador.new(parametros_administrador)
    if @administrador.save
      redirect_to @administrador
    else
      render 'new'
    end
  end
  private
  def parametros_administrador
    params.require(:administrador).permit(:nome, :email, :telefone, :cidade_voluntario)
  end
end
