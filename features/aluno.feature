Feature: Inscricao de Aluno
  As an aluno
  I want to realizar a inscricao para o curso atraves do sistema
  So that eu nao precise fazer isso manualmente

  Scenario: Fazer a inscricao de um aluno corretamente
    Given Eu estou na pagina de inscricao de alunos
    When Eu preencho o campo nome completo com "Nome Completo" e preencho o campo idade com "19"
    And Eu preencho o campo e-mail  com "email@gmail.com" e preencho o campo telefone com "87999000000"
    And Eu preencho o campo rua com "Nome da Rua", preencho o campo bairro com "Nome do Bairro" e preencho o campo cidade com "Nome da Cidade"
    And Eu seleciono "Pardo" no campo cor ou raca com e seleciono "Feminino" no campo genero
    And Eu preencho o campo nome do responsavel com "Nome Completo Responsavel" e preencho o campo contato do responsavel com "87999900000"
    And Eu preencho o campo escola com "Nome da Escola" e seleciono "Particular" no campo tipo de escola
    And Eu seleciono "Estudante de Graduacao" no campo grau de instrucao e seleciono "Sim" no campo ja fez ENEM
    And Eu seleciono "Humanas" no campo area e seleciono "Sim" no campo atuacao em movimento social
    And Eu clico no botao de concluir inscricao
    Then Eu vejo que a inscricao do aluno de nome "Nome Completo" foi efetuada com sucesso

  Scenario: Fazer a inscricao de um aluno com e-mail invalido
    Given Eu estou na pagina de inscricao de alunos
    When Eu preencho o campo nome completo com "Nome Completo" e preencho o campo idade com "19"
    And Eu preencho o campo e-mail  com "email" e preencho o campo telefone com "87999000000"
    And Eu preencho o campo rua com "Nome da Rua", preencho o campo bairro com "Nome do Bairro" e preencho o campo cidade com "Nome da Cidade"
    And Eu seleciono "Branco" no campo cor ou raca com e seleciono "Masculino" no campo genero
    And Eu preencho o campo nome do responsavel com "Nome Completo Responsavel" e preencho o campo contato do responsavel com "87999900000"
    And Eu preencho o campo escola com "Nome da Escola" e seleciono "Publica" no campo tipo de escola
    And Eu seleciono "Estudante de Graduacao" no campo grau de instrucao e seleciono "Sim" no campo ja fez ENEM
    And Eu seleciono "Exatas" no campo area e seleciono "Nao" no campo atuacao em movimento social
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada

  Scenario: Fazer a inscricao de um aluno com todos os campos em branco
    Given Eu estou na pagina de inscricao de alunos
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada

  Scenario: Fazer a inscricao de um aluno com nome muito curto
    Given Eu estou na pagina de inscricao de alunos
    When Eu preencho o campo nome completo com "Nome" e preencho o campo idade com "34"
    And Eu preencho o campo e-mail  com "email@hotmail.com" e preencho o campo telefone com "81988000000"
    And Eu preencho o campo rua com "Nome da Rua", preencho o campo bairro com "Nome do Bairro" e preencho o campo cidade com "Nome da Cidade"
    And Eu seleciono "Negro" no campo cor ou raca com e seleciono "Outros" no campo genero
    And Eu preencho o campo nome do responsavel com "Nome Completo Responsavel" e preencho o campo contato do responsavel com "87999900000"
    And Eu preencho o campo escola com "Nome da Escola" e seleciono "Particular" no campo tipo de escola
    And Eu seleciono "Estudante de Ensino Medio" no campo grau de instrucao e seleciono "Nao" no campo ja fez ENEM
    And Eu seleciono "Saude" no campo area e seleciono "Nao" no campo atuacao em movimento social
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada

  Scenario: Fazer a inscricao de um aluno com letras no campo telefone
    Given Eu estou na pagina de inscricao de alunos
    When Eu preencho o campo nome completo com "Nome Completo" e preencho o campo idade com "25"
    And Eu preencho o campo e-mail  com "email@hotmail.com" e preencho o campo telefone com "telefone"
    And Eu preencho o campo rua com "Nome da Rua", preencho o campo bairro com "Nome do Bairro" e preencho o campo cidade com "Nome da Cidade"
    And Eu seleciono "Indigena" no campo cor ou raca com e seleciono "Masculino" no campo genero
    And Eu preencho o campo nome do responsavel com "Nome Completo Responsavel" e preencho o campo contato do responsavel com "87999900000"
    And Eu preencho o campo escola com "Nome da Escola" e seleciono "Publica" no campo tipo de escola
    And Eu seleciono "Ensino Medio Completo" no campo grau de instrucao e seleciono "Sim" no campo ja fez ENEM
    And Eu seleciono "Exatas" no campo area e seleciono "Sim" no campo atuacao em movimento social
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada

  Scenario: Fazer a inscricao de um aluno com telefone muito curto
    Given Eu estou na pagina de inscricao de alunos
    When Eu preencho o campo nome completo com "Nome Completo" e preencho o campo idade com "17"
    And Eu preencho o campo e-mail  com "email@hotmail.com" e preencho o campo telefone com "849898"
    And Eu preencho o campo rua com "Nome da Rua", preencho o campo bairro com "Nome do Bairro" e preencho o campo cidade com "Nome da Cidade"
    And Eu seleciono "Negro" no campo cor ou raca com e seleciono "Feminino" no campo genero
    And Eu preencho o campo nome do responsavel com "Nome Completo Responsavel" e preencho o campo contato do responsavel com "87999900000"
    And Eu preencho o campo escola com "Nome da Escola" e seleciono "Publica" no campo tipo de escola
    And Eu seleciono "Aluno de Graduacao" no campo grau de instrucao e seleciono "Sim" no campo ja fez ENEM
    And Eu seleciono "Humanas" no campo area e seleciono "Sim" no campo atuacao em movimento social
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a inscricao nao foi efetuada
