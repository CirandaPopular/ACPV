require 'test_helper'

class ProfessorTest < ActiveSupport::TestCase
  test 'um professor com todas as informacoes corretas deve ser salvo' do
    professor = Professor.new nome:'Mariana Costa', email:'marianac@gmail.com', idade:40, telefone:'87995396483', endereco:'Nome da Rua, Nome do Bairro', cidade:'Garanhuns', grau_instrucao:'Mestrado', cidade_voluntario:'Recife', disponibilidade_voluntario:'Sim', area_atuacao:'Portugues', password:'1234567'
    assert professor.save!
  end

  test 'um professor sem informacao de disponibilidade para ser voluntario nao deve ser salvo' do
    professor = Professor.new nome:'Joao Pedro', email:'joaopedro@hotmail.com', idade:56, telefone:'87999296483', endereco:'Nome da Rua, Nome do Bairro', cidade:'Recife', grau_instrucao:'Doutorado', cidade_voluntario:'Recife', disponibilidade_voluntario:nil, area_atuacao:'Fisica', password:'1234567'
    assert_not professor.save
  end

  test 'um professor sem area de atuacao nao deve ser salvo' do
    professor = Professor.new nome:'Ana Maria', email:'ana.maria12@hotmail.com', idade:33, telefone:'81989296483', endereco:'Nome da Rua, Nome do Bairro', cidade:'Garanhuns', grau_instrucao:'Graduacao', cidade_voluntario:'Garanhuns', disponibilidade_voluntario:'Sim', area_atuacao:nil, password:'1234567'
    assert_not professor.save
  end

  test 'um professor sem informacao de para qual cidade quer se voluntariar nao deve ser salvo' do
    professor = Professor.new nome:'Juliana Ferreira', email:'julianaf@hotmail.com', idade:39, telefone:'81989296483', endereco:'Nome da Rua, Nome do Bairro', cidade:'Garanhuns', grau_instrucao:'Mestrado', cidade_voluntario:nil, disponibilidade_voluntario:'Sim', area_atuacao:'Geografia', password:'1234567'
    assert_not professor.save
  end

  test 'um professor sem nenhuma informacao adicionada nao deve ser salvo' do
    professor = Professor.new
    assert_not professor.save
  end

  test 'um professor sem e-mail nao deve ser salvo' do
    professor = Professor.new nome:'Jose Carlos', email:nil, idade:63, telefone:'81989296483', endereco:'Nome da Rua, Nome do Bairro', cidade:'Garanhuns', grau_instrucao:'Doutorado', cidade_voluntario:'Garanhuns', disponibilidade_voluntario:'Sim', area_atuacao:'Quimica', password:'1234567'
    assert_not professor.save
  end

  test 'apenas um professor deve ser criado por vez' do
    professoresIni = Professor.all.length
    professor = Professor.new nome:'Jose Carlos', email:'jose_carlos@hotmail.com', idade:63, telefone:'81989296483', endereco:'Nome da Rua, Nome do Bairro', cidade:'Garanhuns', grau_instrucao:'Doutorado', cidade_voluntario:'Garanhuns', disponibilidade_voluntario:'Sim', area_atuacao:'Quimica', password:'1234567'
    assert professor.save
    professoresFim = Professor.all.length
    assert((professoresFim - professoresIni) == 1)
  end
end