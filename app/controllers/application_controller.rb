class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessoesHelper
  def autorizar
    unless logado?
      redirect_to root_url
    end
  end
end
