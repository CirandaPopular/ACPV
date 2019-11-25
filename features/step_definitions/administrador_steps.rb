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

Then("Eu vejo o menu de administradores") do
  expect(page).to have_current_path(menu_administrador_path)
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

Given("Eu estou na pagina de selecao de alunos") do
  visit 'selecao_aluno'
  expect(page).to have_content('Seleção de Alunos')
end

Given("Eu estou na pagina de selecao de professores") do
  visit 'selecao_professor'
  expect(page).to have_content('Seleção de Professores')
end

When("Eu clico no botao Aprovar o aluno com nome {string}, Idade {string} e Cor {string}") do |nome,idade,cor|
  click_link nome+idade+cor
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

And("O administrador com email {string} existe") do |email|
  visit 'administradores/new'
  fill_in 'administrador[nome]', :with => 'administrador'
  fill_in 'administrador[email]', :with => email
  fill_in 'administrador[telefone]', :with => '87999000000'
  find("option[value=cidade_admin_Garanhuns]").click
  fill_in 'administrador[password]', :with => 'senha1234'
  fill_in 'administrador[password_confirmation]', :with => 'senha1234'
  click_button 'criar_administrador'
end

Given("Eu nao vejo mais o aluno com nome {string} listado") do |nome|
  expect(page).to have_no_content(nome)
end

Given("Eu nao vejo mais o professor com email {string} listado") do |email|
  expect(page).to have_no_content(email)
end

When("Eu clico em Lista de Alunos") do
  click_link "Lista de Alunos"
end

When("Eu clico em Editar Informacoes de Aluno do aluno de nome {string}") do |nome|
  click_link "Editar"+nome.gsub(" ","")
end

And("Eu preencho o campo contato do responsavel com {string}") do |telefone|
  fill_in 'aluno[contato_responsavel]', :with => telefone
end

Then("Eu vejo que o contato do responsavel do aluno de nome {string} foi alterado para {string}") do |nome, telefone|
  expect(page).to have_content("Nome completo: "+nome)
  expect(page).to have_content("Contato do responsável: "+telefone)
end

And("Eu preencho o campo rua com {string}") do |rua|
  fill_in 'aluno[rua]', :with => rua
end

Then("Eu vejo que a rua do aluno de nome {string} foi alterada para {string}") do |nome, rua|
  expect(page).to have_content("Nome completo: "+nome)
  expect(page).to have_content("Rua: "+rua)
end

Then("Eu vejo que a escola do aluno de nome {string} foi alterada para {string}") do |nome, escola|
  expect(page).to have_content("Nome completo: "+nome)
  expect(page).to have_content("Escola: "+escola)
end

And("Eu clico em Criar Nova Turma") do
  click_link "Criar Nova Turma"
end

And("Eu preencho o campo nome com {string}") do |nome|
  fill_in 'turma[nome]', :with => nome
end

And("Eu seleciono {string} no campo cidade") do |cidade|
  find("option[value=cidade_turma_" + cidade + "]").click
end

And("Eu clico no botao Criar Turma") do
  click_button 'criar_turma'
end

Then("Eu vejo que a turma foi criada com sucesso") do
  expect(page).to have_content("Adicionar Professores à Turma")
end

Then("Eu vejo uma mensagem de erro indicando que a turma nao foi criada") do
  assert_selector('div#erro_criacao_turma')
end

And("Eu aprovo a inscricao do professor de e-mail {string}") do |email|
  visit 'selecao_professor'
  expect(page).to have_content('Seleção de Professores')
  click_link email
  expect(page).to have_no_content(email)
end

When("Eu clico em adicionar o professor de email {string}") do |email|
  click_link email
end

And("Eu aprovo a inscricao do aluno de nome {string}, Idade {string} e cor {string}") do |nome, idade, cor|
  visit 'selecao_aluno'
  expect(page).to have_content('Seleção de Alunos')
  click_link nome+idade+cor
  expect(page).to have_no_content(nome)
end

When("Eu clico em adicionar o aluno de nome {string}, Idade {string} e cor {string}") do |nome, idade, cor|
  click_link nome+idade+cor
end

When("Eu clico no botao Lista de Turmas") do
  click_link 'Lista de Turmas'
end

Then("Eu visualizo a Lista de Turmas") do
  expect(page).to have_current_path(turmas_path)
end