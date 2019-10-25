class ProfessorsController < ApplicationController
  def show
    @professor = Professor.find(params[:id])
  end
  def new
    @professor = Professor.new
  end
  def create
    @professor = Professor.new(parametros_professor)
    if @professor.save
      redirect_to @professor
    else
      render 'new'
    end
  end
  private
  def parametros_professor
    params.require(:professor).permit(:nome, :email, :idade, :telefone, :endereco, :cidade, :grau_instrucao, :cidade_voluntario, :disponibilidade_voluntario, :area_atuacao)
  end
end