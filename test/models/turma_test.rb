require 'test_helper'

class TurmaTest < ActiveSupport::TestCase
  test 'uma turma com nome deve poder ser salva' do
    turma = Turma.new nome:'Turma 01'
    assert turma.save
  end

  test 'uma turma sem nome nao pode ser salva' do
    turma = Turma.new nome:nil
    assert_not turma.save
  end
  test 'uma turma com um professor deve poder ser salva' do
    professor = Professor.new nome:'Mariana Costa', email:'marianac@gmail.com', idade:40, telefone:'87995396483', endereco:'Nome da Rua, Nome do Bairro', cidade:'Garanhuns', grau_instrucao:'Mestrado', cidade_voluntario:'Recife', disponibilidade_voluntario:'Sim', area_atuacao:'Portugues'
    turma = Turma.new nome: 'TurmaTop'
    professor.turmas << turma
    assert turma.save
  end
end
