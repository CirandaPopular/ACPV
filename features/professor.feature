Feature: Inscricao de Professor
  As a professor
  I want to realizar a inscricao para ministrar aulas do curso atraves do sistema
  So that eu nao precise fazer isso manualmente

Feature: Login
  As a professor
  I want to fazer login no sistema
  So that eu possa ter acesso a mais funcionalidades do sistema

  Scenario: Fazer a inscricao de um professor corretamente
    Given Eu estou na pagina de inscricao de professores
    When Eu preencho o campo nome completo com "Nome Completo"  e o campo idade com "29"
    And Eu preencho o campo e-mail com "email@gmail.com" e o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "Endereco" e o campo cidade com "Nome da Cidade"
    And Eu seleciono "Mestrado" no campo grau de instrucao e "Garanhuns" no campo cidade para se voluntariar
    And Eu seleciono "Sim" no campo disponibilidade e "Portugues" no campo area de atuacao
    And Eu clico no botao de concluir inscricao
    Then Eu vejo que a inscricao do professor de nome "Nome Completo" foi efetuada com sucesso

  Scenario: Fazer a inscricao de um professor sem selecionar uma area de atuacao
    Given Eu estou na pagina de inscricao de professores
    When Eu preencho o campo nome completo com "Nome Completo"  e o campo idade com "50"
    And Eu preencho o campo e-mail com "email@hotmail.com" e o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "Endereco" e o campo cidade com "Recife"
    And Eu seleciono "Doutorado" no campo grau de instrucao e "Recife" no campo cidade para se voluntariar
    And Eu seleciono "Sim" no campo disponibilidade
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada

  Scenario: Fazer a inscricao de um professor com letras no campo idade
    Given Eu estou na pagina de inscricao de professores
    When Eu preencho o campo nome completo com "Nome Completo"  e o campo idade com "idade"
    And Eu preencho o campo e-mail com "email@gmail.com" e o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "Endereco" e o campo cidade com "Nome da Cidade"
    And Eu seleciono "Mestrado" no campo grau de instrucao e "Garanhuns" no campo cidade para se voluntariar
    And Eu seleciono "Sim" no campo disponibilidade e "Portugues" no campo area de atuacao
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada

  Scenario: Fazer a inscricao de um professor sem selecionar o grau de instrucao
    Given Eu estou na pagina de inscricao de professores
    When Eu preencho o campo nome completo com "Nome Completo"  e o campo idade com "50"
    And Eu preencho o campo e-mail com "email@hotmail.com" e o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "Endereco" e o campo cidade com "Recife"
    And Eu seleciono "Recife" no campo cidade para se voluntariar
    And Eu seleciono "Sim" no campo disponibilidade e "Matematica" no campo area de atuacao
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada

  Scenario: Fazer a inscricao de um professor com endereco muito curto
    Given Eu estou na pagina de inscricao de professores
    When Eu preencho o campo nome completo com "Nome Completo"  e o campo idade com "idade"
    And Eu preencho o campo e-mail com "email@gmail.com" e o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "End" e o campo cidade com "Nome da Cidade"
    And Eu seleciono "Mestrado" no campo grau de instrucao e "Garanhuns" no campo cidade para se voluntariar
    And Eu seleciono "Sim" no campo disponibilidade e "Portugues" no campo area de atuacao
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada