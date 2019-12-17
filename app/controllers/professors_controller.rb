class ProfessorsController < ApplicationController
  before_action :autorizar, except: [:new, :create, :edit]
  attr_accessor :nome, :idade, :eh_administrador
  def show
    @professor = Professor.find(params[:id])
  end
  def new
    @professor = Professor.new
  end
  def edit
    @professor = Professor.find(params[:id])
  end
  def create
    @professor = Professor.new(parametros_professor)
    @professor.eh_administrador = false
    @professor.inscricao_aprovada = false
    @professor.password = "1234567"
    aux = @professor.cidade_voluntario.split('_')
    @professor.cidade_voluntario = aux[2]
    aux = @professor.disponibilidade_voluntario.split('_')
    @professor.disponibilidade_voluntario = aux[2]
    if @professor.save
      redirect_to sucesso_path
    else
      render 'new'
    end
  end
  def update
    @professor = Professor.find(params[:id])
    aux = @professor.cidade_voluntario.split('_')
    @professor.cidade_voluntario = aux[2]
    aux = @professor.disponibilidade_voluntario.split('_')
    @professor.disponibilidade_voluntario = aux[2]
    if @professor.update(parametros_professor)
      redirect_to @professor
    else
      render 'edit'
    end
  end
  def index
    @professores = Professor.all
  end
  def destroy
    @professor = Professor.find(params[:id])
    @professor.delete
    redirect_to root_path
  end
  def alterar_inscricao
    @professor = Professor.find(params[:id])
    if @professor.inscricao_aprovada == true
      @professor.inscricao_aprovada = false
    else
      @professor.inscricao_aprovada = true
    end
    @professor.save
    redirect_back(fallback_location: @professor)
  end
  def selecao_professor
    @professores = Professor.all
  end
  private
  def parametros_professor
    params.require(:professor).permit(:nome, :email, :idade, :telefone, :endereco, :cidade, :grau_instrucao, :cidade_voluntario, :disponibilidade_voluntario, :area_atuacao, :inscricao_aprovada, :password, :password_confirmation)
  end
end