require 'test_helper'

class ArquivoTest < ActiveSupport::TestCase

  test 'um arquivo upado corretamente deve ser salvo' do
    arquivo = Arquivo.new diretorio_arquivo:'/add_apostila/arquivos/25112019102036389934'
    assert arquivo.save
  end

  test 'apenas um arquivo criado por vez' do
    arqIni = Arquivo.all.length
    arquivo = Arquivo.new diretorio_arquivo:'/add_apostila/arquivos/25112019102036389934'
    assert arquivo.save
    arqFim = Arquivo.all.length
    assert((arqFim - arqIni) == 1)
  end

  test 'um arquivo upado sem diretorio nao deve ser salvo' do
    arquivo = Arquivo.new diretorio_arquivo:nil
    assert_not arquivo.save
  end
end