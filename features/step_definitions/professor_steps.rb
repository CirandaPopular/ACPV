Given("Eu estou na pagina de inscricao de professores") do
  visit 'professors/new'
  expect(page).to have_content('Inscrição de Professor')
end

When("Eu preencho o campo nome completo com {string}  e o campo idade com {string}") do |nome, idade|
  fill_in 'professor[nome]', :with => nome
  fill_in 'professor[idade]', :with => idade
end

When("Eu preencho o campo e-mail com {string} e o campo telefone com {string}") do |email, telefone|
  fill_in 'professor[email]', :with => email
  fill_in 'professor[telefone]', :with => telefone
end

When("Eu preencho o campo endereco com {string} e o campo cidade com {string}") do |endereco, cidade|
  fill_in 'professor[endereco]', :with => endereco
  fill_in 'professor[cidade]', :with => cidade
end

When("Eu seleciono {string} no campo grau de instrucao e {string} no campo cidade para se voluntariar") do |grau, cidade_voluntario|
  palavras_separadas = grau.split(' ')
  choose("grau_" + palavras_separadas[0])
  find("option[value=cidade_voluntario_" + cidade_voluntario + "]").click
end

When("Eu seleciono {string} no campo cidade para se voluntariar") do |cidade_voluntario|
  find("option[value=cidade_voluntario_" + cidade_voluntario + "]").click
end

When("Eu seleciono {string} no campo disponibilidade e {string} no campo area de atuacao") do |disponibilidade, area_atuacao|
  find("option[value=disponibilidade_voluntario_" + disponibilidade + "]").click
  choose("atuacao_" + area_atuacao)
end

When("Eu seleciono {string} no campo disponibilidade") do |disponibilidade|
  find("option[value=disponibilidade_voluntario_" + disponibilidade + "]").click
end

Then("Eu vejo que a inscricao do professor de nome {string} foi efetuada com sucesso") do |nome|
  expect(page).to have_content(nome)
  expect(page).to have_current_path(professors_path + '/' + Professor.last.id.to_s)
end