require 'test_helper'

class TurmaTest < ActiveSupport::TestCase
  test 'uma turma com nome deve ser salva' do
    turma = Turma.new nome:'Turma 01'
    assert turma.save
  end

  test 'uma turma sem nome nao deve ser salva' do
    turma = Turma.new nome:nil
    assert_not turma.save
  end

  test 'uma turma com um professor deve ser salva' do
    professor = Professor.new nome:'Mariana Costa', email:'marianac@gmail.com', idade:40, telefone:'87995396483', endereco:'Nome da Rua, Nome do Bairro', cidade:'Garanhuns', grau_instrucao:'Mestrado', cidade_voluntario:'Recife', disponibilidade_voluntario:'Sim', area_atuacao:'Portugues'
    turma = Turma.new nome: 'TurmaTop'
    professor.turmas << turma
    assert turma.save
  end

  test 'apenas uma turma deve ser criada por vez' do
    turmasIni = Turma.all.length
    turma = Turma.new nome:'Turma1'
    assert turma.save
    turmasFim = Turma.all.length
    assert((turmasFim - turmasIni) == 1)
  end
end
