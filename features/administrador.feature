Feature: Login de administrador
  As an administrador
  I want to fazer login no sistema
  So that eu possa ter acesso a mais funcionalidades do sistema

Feature: Administracao de Alunos
  As an administrador
  I want to administrar as funcionalidades de alunos
  So that eu nao precise fazer isso manualmente

#CENÁRIOS REFERENTES AO LOGIN DE ADMINISTRADORES
  Scenario: Fazer o login de um administrador corretamente
    Given Eu estou na pagina de inscricao de administradores
    And Eu preencho o campo nome completo com "Nome Completo" e o campo e-mail com "email@gmail.com"
    And Eu preencho o campo telefone com "87999000000"
    And Eu seleciono "Recife" no campo cidade onde administra o curso
    And Eu preencho os campos senha e confirmacao de senha com "senha1234"
    And Eu clico no botao de concluir
    And Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "senha1234"
    And Eu clico no botao de fazer login
    Then Eu vejo o menu de administradores

  Scenario: Fazer o login de um administrador com a senha incorreta
    Given Eu estou na pagina de inscricao de administradores
    And Eu preencho o campo nome completo com "Nome Completo" e o campo e-mail com "email@gmail.com"
    And Eu preencho o campo telefone com "87999000000"
    And Eu seleciono "Recife" no campo cidade onde administra o curso
    And Eu preencho os campos senha e confirmacao de senha com "senha1234"
    And Eu clico no botao de concluir
    And Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "senha12345"
    And Eu clico no botao de fazer login
    Then Eu vejo que o login nao foi efetuado

#CENÁRIOS REFERENTES À ADMINISTRACAO DE ALUNOS
  Scenario: Fazer a selecao dos alunos corretamente
    Given Eu sou administrador e estou logado
    And O aluno com nome "Nome Aluno", Idade "20" e Cor "Pardo" existe
    And Eu estou na pagina de selecao de alunos
    When Eu clico no botao Aprovar o aluno com nome "Nome Aluno", Idade "20" e Cor "Pardo"
    Then Eu nao vejo mais o aluno "Aluno Nome" listado

  Scenario: Fazer a selecao dos professores corretamente
    Given Eu sou administrador e estou logado
    And O professor com email "prof@gmail.com" existe
    And Eu estou na pagina de selecao de professores
    When Eu clico no botao Aprovar o professor com email "prof@gmail.com"
    Then Eu nao vejo mais o professor com email "prof@gmail.com" listado

  Scenario: Visualizar Lista de Professores
    Given Eu sou administrador e estou logado
    And Eu estou no menu de administrador
    When Eu clico no botao Lista de Professores
    Then Eu visualizo a Lista de Professores

  Scenario: Visualizar Lista de Alunos
    Given Eu sou administrador e estou logado
    And Eu estou no menu de administrador
    When Eu clico no botao Lista de Alunos
    Then Eu visualizo a Lista de Alunos

  Scenario: Visualizar Lista de Administradores
    Given Eu sou administrador e estou logado
    And Eu estou no menu de administrador
    When Eu clico no botao Lista de Administradores
    Then Eu visualizo a Lista de Administradores