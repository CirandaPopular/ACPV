class TurmasController < ApplicationController
  def show
    @turma = Turma.find(params[:id])
  end
  def new
    @turma = Turma.new
  end
  def create
    @turma = Turma.new(parametros_turma)
    if @turma.save
      ##aaa
    else
      render 'new'
    end
  end
  private
  def parametros_turma
    params.require(:turma).permit(:nome, :cidade)
  end
end