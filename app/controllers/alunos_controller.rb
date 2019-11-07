class AlunosController < ApplicationController
  def show
    @aluno = Aluno.find(params[:id])
  end
  def new
    @aluno = Aluno.new
  end
  def create
    @aluno = Aluno.new(parametros_aluno)
    if @aluno.save
      redirect_to @aluno
    else
      render 'new'
    end
  end
  def index
    @alunos = Aluno.all
  end
  private
  def parametros_aluno
    params.require(:aluno).permit(:nome, :email, :idade, :telefone, :rua, :bairro, :cidade, :cor, :genero, :nome_responsavel, :contato_responsavel, :escola, :tipo_escola, :grau_instrucao, :fez_enem, :area, :atuacao_mov_social)
  end
end