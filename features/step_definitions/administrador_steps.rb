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
