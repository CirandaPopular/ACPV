class SessoesController < ApplicationController
  before_action :bloquear_acesso, except: [:destroy]
  def create
    @usuario = Administrador.find_by(email: params[:sessao][:email].downcase)
    if @usuario && @usuario.authenticate(params[:sessao][:password])
      login(@usuario)
      redirect_to @usuario
    else
      @usuario = Professor.find_by(email: params[:sessao][:email].downcase)
      if @usuario && @usuario.authenticate(params[:sessao][:password])
        login(@usuario)
        redirect_to @usuario
      else
        render 'new'
      end
    end
  end
  def destroy
    logout
    redirect_to root_url
  end
end
