Given("Eu estou na pagina de inscricao de administradores") do
  visit 'administradores/new'
  expect(page).to have_content('Adicionar Novo Administrador')
end

When("Eu preencho o campo nome completo com {string} e o campo e-mail com {string}") do |nome, email|
  fill_in 'administrador[nome]', :with => nome
  fill_in 'administrador[email]', :with => email
end

When("Eu preencho o campo telefone com {string}") do |telefone|
  fill_in 'administrador[telefone]', :with => telefone
end

When("Eu seleciono {string} no campo cidade onde administra o curso") do |cidade_voluntario|
  select(cidade_voluntario, from: 'cidade_admin')
end

When("Eu preencho os campos senha e confirmacao de senha com {string}") do |senha|
  fill_in 'administrador[password]', :with => senha
  fill_in 'administrador[password_confirmation]', :with => senha
end

When("Eu clico no botao de concluir") do
  click_button 'criar_administrador'
end

When("Eu clico no botao Lista de Professores") do
  click_link 'Lista de Professores'
end

When("Eu clico no botao Lista de Administradores") do
  click_link 'Lista de Administradores'
end

When("Eu clico no botao Lista de Alunos") do
  click_link 'Lista de Alunos'
end

Then("Eu visualizo a Lista de Professores") do
  expect(page).to have_current_path(professors_path)
end

Then("Eu visualizo a Lista de Administradores") do
  expect(page).to have_current_path(administradores_path)
end

Then("Eu visualizo a Lista de Alunos") do
  expect(page).to have_current_path(alunos_path)
end

Then("Eu vejo o menu de administradores") do
  expect(page).to have_current_path(menu_administrador_path)
end

Given("Eu estou na pagina de selecao de alunos") do
  visit 'selecao_aluno'
  expect(page).to have_content('Seleção de Alunos')
end

Given("Eu estou na pagina de selecao de professores") do
  visit 'selecao_professor'
  expect(page).to have_content('Seleção de Professores')
end

When("Eu clico no botao Aprovar o aluno com nome {string}, Idade {string} e Cor {string}") do |nome,idade,cor|
  click_link "Aprovar"+nome.gsub(" ","")+idade+cor
end

When("Eu clico no botao Aprovar o professor com email {string}") do |email|
  click_link email
end

Given("Eu sou administrador e estou logado") do
  visit 'administradores/new'
  fill_in 'administrador[nome]', :with => 'adm padrao'
  fill_in 'administrador[email]', :with => 'adm@gmail.com'
  fill_in 'administrador[telefone]', :with => '81900000000'
  select('Ambas', from: 'cidade_admin')
  fill_in 'administrador[password]', :with => 'apedro011'
  fill_in 'administrador[password_confirmation]', :with => 'apedro011'
  click_button 'criar_administrador'
  visit '/login'
  fill_in 'sessao[email]', :with => 'adm@gmail.com'
  fill_in 'sessao[password]', :with => 'apedro011'
  click_button 'login'
  expect(page).to have_current_path(menu_administrador_path)
end

And("Eu estou no menu de administrador") do
  visit 'menu_administrador'
  expect(page).to have_current_path(menu_administrador_path)
end

And("O aluno com nome {string}, Idade {string} e Cor {string} existe") do |nome, idade, cor|
  visit 'alunos/new'
  fill_in 'aluno[nome]', :with => nome
  fill_in 'aluno[idade]', :with => idade
  fill_in 'aluno[email]', :with => 'padrao@gmail.com'
  fill_in 'aluno[telefone]', :with => '81900000000'
  fill_in 'aluno[rua]', :with => 'rua da faculdade'
  fill_in 'aluno[bairro]', :with => 'boa vista'
  fill_in 'aluno[cidade]', :with => 'garanhuns'
  choose("cor_" + cor)
  choose("genero_" + 'Masculino')
  fill_in 'aluno[nome_responsavel]', :with => 'responsavel padrao'
  fill_in 'aluno[contato_responsavel]', :with => '81900000001'
  fill_in 'aluno[escola]', :with => 'nao tinha nao'
  find("option[value=tipo_escola_Publica]").click
  choose("grau_instrucao_Graduacao")
  find("option[value=fez_enem_Sim]").click
  choose("area_Humanas")
  find("option[value=atuacao_mov_social_Nao]").click
  click_button 'concluir_inscricao'
  expect(page).to have_current_path(sucesso_path)
end

And("O professor com email {string} existe") do |email|
  visit 'professors/new'
  fill_in 'professor[nome]', :with => 'professor padrao'
  fill_in 'professor[idade]', :with => '20'
  fill_in 'professor[email]', :with => email
  fill_in 'professor[telefone]', :with => '81900000000'
  fill_in 'professor[endereco]', :with => 'faculdade rural uag'
  fill_in 'professor[cidade]', :with => 'garanhuns'
  choose("grau_Mestrado")
  find("option[value=cidade_voluntario_Garanhuns]").click
  find("option[value=disponibilidade_voluntario_Sim]").click
  choose("atuacao_Biologia")
  click_button 'concluir_inscricao'
end

Given("Eu nao vejo mais o aluno {string} listado") do |nome|
  expect(page).to have_no_content(nome)
end

Given("Eu nao vejo mais o professor com email {string} listado") do |email|
  expect(page).to have_no_content(email)
end