Feature: Inscricao de Professor
  As a professor
  I want to realizar a inscricao para ministrar aulas do curso atraves do sistema
  So that eu nao precise fazer isso manualmente

  Scenario: Fazer a inscricao de um professor corretamente
    Given Eu estou na pagina de inscricao de professores
    When Eu preencho o campo nome completo com "Nome Completo" e preencho o campo idade com "29"
    And Eu preencho o campo e-mail  com "email@gmail.com" e preencho o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "Endereco" e preencho o campo cidade com "Nome da Cidade"
    And Eu seleciono "Mestrado" no campo grau de instrucao e seleciono "Garanhuns" no campo cidade para se voluntariar
    And Eu seleciono "Sim" no campo disponibilidade e seleciono "Portugues" no campo area de atuacao
    And Eu clico no botao de concluir inscricao
    Then Eu vejo que a inscricao do professor de nome "Nome Completo" foi efetuada com sucesso

  Scenario: Fazer a inscricao de um professor sem selecionar uma area de atuacao
    Given Eu estou na pagina de inscricao de professores
    When Eu preencho o campo nome completo com "Nome Completo" e preencho o campo idade com "50"
    And Eu preencho o campo e-mail  com "email@hotmail.com" e preencho o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "Endereco" e preencho o campo cidade com "Recife"
    And Eu seleciono "Douturado" no campo grau de instrucao e seleciono "Recife" no campo cidade para se voluntariar
    And Eu seleciono "Sim" no campo disponibilidade
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada

  Scenario: Fazer a inscricao de um professor com letras no campo idade
    Given Eu estou na pagina de inscricao de professores
    When Eu preencho o campo nome completo com "Nome Completo" e preencho o campo idade com "idade"
    And Eu preencho o campo e-mail  com "email@gmail.com" e preencho o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "Endereco" e preencho o campo cidade com "Nome da Cidade"
    And Eu seleciono "Mestrado" no campo grau de instrucao e seleciono "Garanhuns" no campo cidade para se voluntariar
    And Eu seleciono "Sim" no campo disponibilidade e seleciono "Portugues" no campo area de atuacao
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada

  Scenario: Fazer a inscricao de um professor sem disponibilidade para se voluntariar
    Given Eu estou na pagina de inscricao de professores
    When Eu preencho o campo nome completo com "Nome Completo" e preencho o campo idade com "34"
    And Eu preencho o campo e-mail  com "email@gmail.com" e preencho o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "Endereco" e preencho o campo cidade com "Nome da Cidade"
    And Eu seleciono "Mestrado" no campo grau de instrucao e seleciono "Garanhuns" no campo cidade para se voluntariar
    And Eu seleciono "Nao" no campo disponibilidade e seleciono "Ingles" no campo area de atuacao
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada

    #falta um cenario