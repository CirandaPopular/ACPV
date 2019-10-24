Given("Eu estou na pagina de inscricao de alunos") do
  visit 'alunos/new'
  expect(page).to have_content('Inscrição de Aluno')
end

When("Eu preencho o campo nome completo com {string} e preencho o campo idade com {string}") do |nome, idade|
  fill_in 'aluno[nome]', :with => nome
  fill_in 'aluno[idade]', :with => idade
end

When("Eu preencho o campo e-mail  com {string} e preencho o campo telefone com {string}") do |email, telefone|
  fill_in 'aluno[email]', :with => email
  fill_in 'aluno[telefone]', :with => telefone
end

When("Eu preencho o campo rua com {string}, preencho o campo bairro com {string} e preencho o campo cidade com {string}") do |rua, bairro, cidade|
  fill_in 'aluno[rua]', :with => rua
  fill_in 'aluno[bairro]', :with => bairro
  fill_in 'aluno[cidade]', :with => cidade
end

When("Eu seleciono {string} no campo cor ou raca com e seleciono {string} no campo genero") do |cor, genero|
  choose("cor_" + cor)
  choose("genero_" + genero)
end

When("Eu preencho o campo nome do responsavel com {string} e preencho o campo contato do responsavel com {string}") do |nome_responsavel, contato_responsavel|
  fill_in 'aluno[nome_responsavel]', :with => nome_responsavel
  fill_in 'aluno[contato_responsavel]', :with => contato_responsavel
end

When("Eu preencho o campo escola com {string} e seleciono {string} no campo tipo de escola") do |escola, tipo_escola|
  fill_in 'aluno[escola]', :with => escola
  find("option[value=tipo_escola_" + tipo_escola + "]").click
end

When("Eu seleciono {string} no campo grau de instrucao e seleciono {string} no campo ja fez ENEM") do |grau_instrucao, enem|
  palavras_separadas = grau_instrucao.split(' ')
  choose("grau_instrucao_" + palavras_separadas[palavras_separadas.length() - 1])
  find("option[value=fez_enem_" + enem + "]").click
end

When("Eu seleciono {string} no campo area e seleciono {string} no campo atuacao em movimento social") do |area, atuacao_mov_social|
  choose("area_" + area)
  find("option[value=atuacao_mov_social_" + atuacao_mov_social + "]").click
end

When("Eu clico no botao de concluir inscricao") do
  click_button 'concluir_inscricao_aluno'
end

Then("Eu vejo que a inscricao do aluno de nome {string} foi efetuada com sucesso") do |nome|
  expect(page).to have_content(nome)
  expect(page).to have_current_path(alunos_path + '/' + Aluno.last.id.to_s)
end

Then("Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada") do
  assert_selector('div#erro_inscricao_aluno')
end