module SessoesHelper
  def login(*)
   session[:usuario_id] = @usuario.id
  end
  def usuario_atual
    begin
      @usuario_atual ||= Administrador.find_by(id: session[:usuario_id])
      if @usuario_atual.eh_administrador == false
        @usuario_atual ||= Professor.find_by(id: session[:usuario_id])
      else
        @usuario_atual
      end
    rescue
      @usuario_atual ||= Professor.find_by(id: session[:usuario_id])
    end
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
    if usuario_atual.cidade_voluntario != 'Ambas'
      usuario_atual.cidade_voluntario
    end
  end
end