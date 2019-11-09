require 'test_helper'

class AdministradorTest < ActiveSupport::TestCase
  test 'um administrador com todas as informacoes corretas deve ser salvo' do
    administrador = Administrador.new nome:'Carlos Silva', email:'carlos.s@gmail.com', telefone:'87995396483', password:'senha12345', cidade_voluntario:'Garanhuns', eh_administrador: true
    assert administrador.save!
  end

  test 'um administrador sem senha nao deve ser salvo' do
    administrador = Administrador.new nome:'Marcelo Costa', email:'marcelo123@hotmail.com', telefone:'87995396483', password:nil, cidade_voluntario:'Garanhuns', eh_administrador: true
    assert_not administrador.save
  end

  test 'um administrador sem uma cidade selecionada nao deve ser salvo' do
    administrador = Administrador.new nome:'Luciana Ferreira', email:'lucianaf@hotmail.com', telefone:'87995396483', password:'luciana12njf', cidade_voluntario:nil, eh_administrador: true
    assert_not administrador.save
  end

  test 'um administrador sem nenhuma informacao adicionada nao deve ser salvo' do
    administrador = Administrador.new
    assert_not administrador.save
  end

  test 'apenas um administrador deve ser criado por vez' do
    adminIni = Administrador.all.length
    administrador = Administrador.new nome:'Ana Julia', email:'anajulia@hotmail.com', telefone:'81995396483', password:'abc123efg', cidade_voluntario:'Recife', eh_administrador: true
    assert administrador.save
    adminFim = Administrador.all.length
    assert((adminFim - adminIni) == 1)
  end
end
