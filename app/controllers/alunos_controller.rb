class AlunosController < ApplicationController
  before_action :autorizar_administrador, except: [:new, :create]
  def show
    @aluno = Aluno.find(params[:id])
  end
  def new
    @aluno = Aluno.new
  end
  def alterar_inscricao
    @aluno = Aluno.find(params[:id])
    if @aluno.inscricao_aprovada == true
      @aluno.inscricao_aprovada = false
    else
      @aluno.inscricao_aprovada = true
    end
    @aluno.save
    redirect_back(fallback_location: @aluno)
  end
  def edit
    @aluno = Aluno.find(params[:id])
  end
  def create
    @aluno = Aluno.new(parametros_aluno)
    aux = @aluno.tipo_escola.split('_')
    @aluno.tipo_escola = aux[2]
    aux = @aluno.atuacao_mov_social.split('_')
    @aluno.atuacao_mov_social = aux[3]
    aux = @aluno.fez_enem.split('_')
    @aluno.fez_enem = aux[2]
    if @aluno.save
      redirect_to sucesso_path
    else
      render 'new'
    end
  end
  def update
    @aluno = Aluno.find(params[:id])
    if @aluno.update!(parametros_aluno)
      redirect_to @aluno
    else
      render 'edit'
    end
  end
  def index
    @alunos = Aluno.all
  end
  def selecao_aluno
    @alunos = Aluno.all
  end
  private
  def parametros_aluno
    params.require(:aluno).permit(:nome, :email, :idade, :telefone, :rua, :bairro, :cidade, :cor, :genero, :nome_responsavel, :contato_responsavel, :escola, :tipo_escola, :grau_instrucao, :fez_enem, :area, :atuacao_mov_social)
  end
end