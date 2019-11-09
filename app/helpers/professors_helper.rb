module ProfessorsHelper
  def AprovarInscricao(id)
    @professor = Professor.find(id)
    @professor.update_attribute(:inscricao_aprovada,true)
  end
end