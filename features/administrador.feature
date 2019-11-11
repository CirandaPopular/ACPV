Feature: Login de administrador
  As an administrador
  I want to fazer login no sistema
  So that eu possa ter acesso a mais funcionalidades do sistema

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