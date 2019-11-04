class SessoesController < ApplicationController
  before_action :bloquear_acesso, except: [:destroy]
  def create
    @usuario = Usuario.find_by(email: params[:sessao][:email].downcase)
    if @usuario && @usuario.authenticate(params[:sessao][:password])
      login(@usuario)
      redirect_to @usuario
    else
      render 'new'
    end
  end
  def destroy
    logout
    redirect_to root_url
  end
end
