require 'test_helper'

class AlunoTest < ActiveSupport::TestCase
  test 'um aluno sem nome nao deve ser salvo' do
    aluno = Aluno.new nome:nil, email:'aluno@gmail.com', idade:15, telefone:'87982398583', rua:'nome rua', bairro:'nome bairro', cidade:'nome cidade', cor:'Branco', genero:'Feminino', nome_responsavel:'nome completo', contato_responsavel:'35339302', escola:'nome escola', tipo_escola:'Particular', grau_instrucao:'Ensino Medio Completo', fez_enem:'Sim', area:'Humanas', atuacao_mov_social:'Nao'
    assert_not aluno.save
  end

  test 'um aluno sem nenhuma informacao adicionada nao deve ser salvo' do
    aluno = Aluno.new
    assert_not aluno.save
  end

  test 'um aluno com todas as informacoes corretas deve ser salvo' do
    aluno = Aluno.new nome:'Carlos Silva', email:'carlos.s@gmail.com', idade:23, telefone:'87995396483', rua:'Nome da Rua', bairro:'Nome do Bairro', cidade:'Garanhuns', cor:'Negro', genero:'Masculino', nome_responsavel:'Nome do Responsavel', contato_responsavel:'98429312', escola:'Nome da Escola', tipo_escola:'Particular', grau_instrucao:'Ensino Medio Completo', fez_enem:'Nao', area:'Exatas', atuacao_mov_social:'Nao'
    assert aluno.save
  end

  test 'apenas um aluno deve ser criado por vez' do
    alunosIni = Aluno.all.length
    aluno = Aluno.new nome:'Ana Julia', email:'anajulia@hotmail.com', idade:19, telefone:'81995396483', rua:'Nome da Rua', bairro:'Nome do Bairro', cidade:'Recife', cor:'Branco', genero:'Feminino', nome_responsavel:'Nome do Responsavel', contato_responsavel:'98429312', escola:'Nome da Escola', tipo_escola:'Publica', grau_instrucao:'Estudante de Graduacao', fez_enem:'Sim', area:'Humanas', atuacao_mov_social:'Sim'
    assert aluno.save
    alunosFim = Aluno.all.length
    assert ((alunosFim - alunosIni) == 1)
  end
end
