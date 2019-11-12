class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessoesHelper
  include ProfessorsHelper
  def autorizar
    unless logado?
      redirect_to root_url
    end
  end
  def autorizar_administrador
    unless logado? && @usuario_atual.eh_administrador?
      redirect_to root_url
    end
  end
end