class TurmasController < ApplicationController
  before_action :autorizar_administrador
  def show
    @turma = Turma.find(params[:id])
  end
  def new
    @turma = Turma.new
  end
  def edit
    @turma = Turma.find(params[:id])
  end
  def create
    @turma = Turma.new(parametros_turma)
    aux = @turma.cidade_turma.split('_')
    @turma.cidade_turma = aux[2]
    if @turma.save
      render 'edit'
    else
      render 'new'
    end
  end
  def adicionar_professor
    turma = Turma.find(params[:id_turma])
    professor = Professor.find(params[:id])
    turma.professors << professor
    redirect_back(fallback_location: @professor)
  end
  def adicionar_aluno
    turma = Turma.find(params[:id_turma])
    aluno = Aluno.find(params[:id])
    aluno.turma = turma
    turma.alunos << aluno
    redirect_back(fallback_location: @aluno)
  end
  private
  def parametros_turma
    params.require(:turma).permit(:nome, :cidade_turma)
  end
end