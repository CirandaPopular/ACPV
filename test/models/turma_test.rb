require 'test_helper'

class TurmaTest < ActiveSupport::TestCase
  test 'uma turma com nome e cidade deve ser salva' do
    turma = Turma.new nome:'Turma 01', cidade_turma:'Recife'
    assert turma.save
  end

  test 'uma turma sem nome nao deve ser salva' do
    turma = Turma.new nome:nil, cidade_turma:'Recife'
    assert_not turma.save
  end

  test 'uma turma sem cidade nao deve ser salva' do
    turma = Turma.new nome:'Turma 01', cidade_turma:nil
    assert_not turma.save
  end

  test 'uma turma com um professor deve ser salva' do
    professor = Professor.new nome:'Mariana Costa', email:'marianac@gmail.com', idade:40, telefone:'87995396483', endereco:'Nome da Rua, Nome do Bairro', cidade:'Garanhuns', grau_instrucao:'Mestrado', cidade_voluntario:'Recife', disponibilidade_voluntario:'Sim', area_atuacao:'Portugues'
    turma = Turma.new nome: 'TurmaTop', cidade_turma:'Recife'
    professor.turmas << turma
    assert turma.save
  end

  test 'apenas uma turma deve ser criada por vez' do
    turmasIni = Turma.all.length
    turma = Turma.new nome:'Turma1', cidade_turma:'Garanhuns'
    assert turma.save
    turmasFim = Turma.all.length
    assert((turmasFim - turmasIni) == 1)
  end

  test 'uma turma com um aluno deve ser salva' do
    aluno = Aluno.new nome:'Ana Julia', email:'anajulia@hotmail.com', idade:19, telefone:'81995396483', rua:'Nome da Rua', bairro:'Nome do Bairro', cidade:'Recife', cor:'Branco', genero:'Feminino', nome_responsavel:'Nome do Responsavel', contato_responsavel:'98429312', escola:'Nome da Escola', tipo_escola:'Publica', grau_instrucao:'Estudante de Graduacao', fez_enem:'Sim', area:'Humanas', atuacao_mov_social:'Sim'
    turma = Turma.new nome: 'TurmaTop', cidade_turma:'Recife'
    turma.alunos << aluno
    assert turma.save
  end
end
