module SessoesHelper
  @@admin = false
  def login(*)
   session[:usuario_id] = @usuario.id
   @@admin= @usuario.eh_administrador
  end
  def usuario_atual
    if @@admin == false
      @usuario_atual ||= Professor.find_by(id: session[:usuario_id])
    else
      @usuario_atual ||= Administrador.find_by(id: session[:usuario_id])
    end
    @usuario_atual
  end
  def bloquear_acesso
    if usuario_atual.present?
      redirect_to usuarios_path
    end
  end
  def logado?
    !usuario_atual.nil?
  end
  def eh_admin?
    usuario_atual.eh_administrador?
  end
  def logout
    session.delete(:usuario_id)
    @usuario_atual = nil
  end
  def cidade
    usuario_atual.cidade_voluntario
  end
end