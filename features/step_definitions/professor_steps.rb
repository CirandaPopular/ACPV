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

Given("Eu estou na pagina de login") do
  visit 'login'
  expect(page).to have_content('Login')
end

When("Eu preencho o campo e-mail com {string} e o campo senha com {string}") do |email, senha|
  fill_in 'sessao[email]', :with => email
  fill_in 'sessao[password]', :with => senha
end

When("Eu clico no botao de fazer login") do
  click_button 'login'
end

Then("Eu vejo o menu de professores") do
  expect(page).to have_current_path(menu_professor_path)
end

Then("Eu vejo que o login nao foi efetuado") do
  expect(page).to have_current_path(login_path)
end

When("Eu clico em Minhas Informacoes") do
  expect(page).to have_current_path(menu_professor_path)
  click_link 'Minhas Informações'
  expect(page).to have_content("Dados da Sua Inscrição")
end

And("Eu clico em Editar Informacoes") do
  click_link 'Editar Informações'
  expect(page).to have_content("Editar Inscrição de Professor")
end

And("Eu preencho o campo telefone com  {string}") do |telefone|
  fill_in 'professor[telefone]', :with => telefone
end

Then("Eu vejo que meu telefone foi alterado para {string}") do |telefone|
  expect(page).to have_content("Telefone " + telefone)
end

And("Eu seleciono {string} no campo area de atuacao") do |area_atuacao|
  choose("atuacao_" + area_atuacao)
end

Then("Eu vejo que minha area de atuacao foi alterada para {string}") do |area_atuacao|
  expect(page).to have_content("Área de Atuação " + area_atuacao)
end

When("Eu preencho o campo nome completo com {string}") do |nome|
  fill_in 'professor[nome]', :with => nome
end

Then("Eu vejo que meu nome foi alterado para {string}") do |nome|
  expect(page).to have_content("Nome completo: " + nome)
end

When("Eu preencho o campo cidade com {string}") do |cidade|
  fill_in 'professor[cidade]', :with => cidade
end

Then("Eu vejo uma mensagem de erro indicando que a alteracao nao foi efetuada") do
  assert_selector('div#erro_edicao')
end

When("Eu preencho o campo idade com {string}") do |idade|
  fill_in 'professor[idade]', :with => idade
end

Then("Eu vejo que ainda nao tenho permissao para fazer login") do
  expect(page).to have_current_path(sem_permissao_path)
end

And("Eu faco logout") do
  click_link "Logout"
end