module SessoesHelper
  def login(*)
   session[:usuario_id] = @usuario.id
  end
  def usuario_atual
    @usuario_atual ||= Administrador.find_by(id: session[:usuario_id])
    #if usuario_atual.nil?
    #  @usuario_atual ||= Professor.find_by(id: session[:usuario_id])
    #end
  end
  def bloquear_acesso
    if usuario_atual.present?
      redirect_to usuarios_path
    end
  end
  def logado?
    !usuario_atual.nil?
  end
  def logout
    session.delete(:usuario_id)
    @usuario_atual = nil
  end
end