Feature: Inscricao de Professor
  As a professor
  I want to realizar a inscricao para ministrar aulas do curso atraves do sistema
  So that eu nao precise fazer isso manualmente

Feature: Login de Professor
  As a professor
  I want to fazer login no sistema
  So that eu possa ter acesso a mais funcionalidades do sistema

Feature: Editar Inscricao de Professor
  As a professor
  I want to editar minha inscricao
  So that os dados no sistema fiquem atualizados

#CENÁRIOS REFERENTES À INSCRIÇÃO DE PROFESSORES
  Scenario: Fazer a inscricao de um professor corretamente
    Given Eu estou na pagina de inscricao de professores
    When Eu preencho o campo nome completo com "Nome Completo"  e o campo idade com "29"
    And Eu preencho o campo e-mail com "email@gmail.com" e o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "Endereco" e o campo cidade com "Nome da Cidade"
    And Eu seleciono "Mestrado" no campo grau de instrucao e "Garanhuns" no campo cidade para se voluntariar
    And Eu seleciono "Sim" no campo disponibilidade e "Portugues" no campo area de atuacao
    And Eu clico no botao de concluir inscricao
    Then Eu vejo que a inscricao foi efetuada com sucesso

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

#CENÁRIOS REFERENTES AO LOGIN DE PROFESSORES
  Scenario: Fazer o login de um professor corretamente
    Given O professor com email "email@gmail.com" existe
    And Eu sou administrador e estou logado
    And Eu estou na pagina de selecao de professores
    And Eu clico no botao Aprovar o professor com email "email@gmail.com"
    And Eu nao vejo mais o professor com email "email@gmail.com" listado
    And Eu faco logout
    And Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "1234567"
    And Eu clico no botao de fazer login
    Then Eu vejo o menu de professores

  Scenario: Fazer o login de um professor com a senha incorreta
    Given O professor com email "email@gmail.com" existe
    And Eu sou administrador e estou logado
    And Eu estou na pagina de selecao de professores
    And Eu clico no botao Aprovar o professor com email "email@gmail.com"
    And Eu nao vejo mais o professor com email "email@gmail.com" listado
    And Eu faco logout
    And Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "senha1"
    And Eu clico no botao de fazer login
    Then Eu vejo que o login nao foi efetuado

  Scenario: Fazer o login de um professor que nao se inscreveu
    Given Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "1234567"
    And Eu clico no botao de fazer login
    Then Eu vejo que o login nao foi efetuado

  Scenario: Fazer o login de um professor que nao teve sua inscricao aprovada
    Given Eu estou na pagina de inscricao de professores
    And Eu preencho o campo nome completo com "Nome Completo"  e o campo idade com "29"
    And Eu preencho o campo e-mail com "email@gmail.com" e o campo telefone com "87999000000"
    And Eu preencho o campo endereco com "Endereco" e o campo cidade com "Nome da Cidade"
    And Eu seleciono "Mestrado" no campo grau de instrucao e "Garanhuns" no campo cidade para se voluntariar
    And Eu seleciono "Sim" no campo disponibilidade e "Portugues" no campo area de atuacao
    And Eu clico no botao de concluir inscricao
    And Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "1234567"
    And Eu clico no botao de fazer login
    Then Eu vejo que ainda nao tenho permissao para fazer login

#CENÁRIOS REFERENTES À EDIÇÃO DE INSCRIÇÃO DE PROFESSORES
  Scenario: Alterar o telefone de um professor corretamente
    Given O professor com email "email@gmail.com" existe
    And Eu sou administrador e estou logado
    And Eu estou na pagina de selecao de professores
    And Eu clico no botao Aprovar o professor com email "email@gmail.com"
    And Eu nao vejo mais o professor com email "email@gmail.com" listado
    And Eu faco logout
    And Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "1234567"
    And Eu clico no botao de fazer login
    And Eu vejo o menu de professores
    When Eu clico em Minhas Informacoes
    And Eu clico em Editar Informacoes
    And Eu preencho o campo telefone com  "81993992342"
    And Eu clico no botao de concluir inscricao
    Then Eu vejo que meu telefone foi alterado para "81993992342"

  Scenario: Alterar a area de atuacao de um professor corretamente
    Given O professor com email "email@gmail.com" existe
    And Eu sou administrador e estou logado
    And Eu estou na pagina de selecao de professores
    And Eu clico no botao Aprovar o professor com email "email@gmail.com"
    And Eu nao vejo mais o professor com email "email@gmail.com" listado
    And Eu faco logout
    And Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "1234567"
    And Eu clico no botao de fazer login
    And Eu vejo o menu de professores
    When Eu clico em Minhas Informacoes
    And Eu clico em Editar Informacoes
    And Eu seleciono "Ingles" no campo area de atuacao
    And Eu clico no botao de concluir inscricao
    Then Eu vejo que minha area de atuacao foi alterada para "Ingles"

  Scenario: Alterar o nome de um professor corretamente
    Given O professor com email "email@gmail.com" existe
    And Eu sou administrador e estou logado
    And Eu estou na pagina de selecao de professores
    And Eu clico no botao Aprovar o professor com email "email@gmail.com"
    And Eu nao vejo mais o professor com email "email@gmail.com" listado
    And Eu faco logout
    And Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "1234567"
    And Eu clico no botao de fazer login
    And Eu vejo o menu de professores
    When Eu clico em Minhas Informacoes
    And Eu clico em Editar Informacoes
    And Eu preencho o campo nome completo com "Novo Nome Completo"
    And Eu clico no botao de concluir inscricao
    Then Eu vejo que meu nome foi alterado para "Novo Nome Completo"

  Scenario: Alterar a cidade de um professor para uma com nome muito curto
    Given O professor com email "email@gmail.com" existe
    And Eu sou administrador e estou logado
    And Eu estou na pagina de selecao de professores
    And Eu clico no botao Aprovar o professor com email "email@gmail.com"
    And Eu nao vejo mais o professor com email "email@gmail.com" listado
    And Eu faco logout
    And Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "1234567"
    And Eu clico no botao de fazer login
    And Eu vejo o menu de professores
    When Eu clico em Minhas Informacoes
    And Eu clico em Editar Informacoes
    And Eu preencho o campo cidade com "C"
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a alteracao nao foi efetuada

  Scenario: Alterar a idade de um professor para uma que contém letras
    Given O professor com email "email@gmail.com" existe
    And Eu sou administrador e estou logado
    And Eu estou na pagina de selecao de professores
    And Eu clico no botao Aprovar o professor com email "email@gmail.com"
    And Eu nao vejo mais o professor com email "email@gmail.com" listado
    And Eu faco logout
    And Eu estou na pagina de login
    When Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "1234567"
    And Eu clico no botao de fazer login
    And Eu vejo o menu de professores
    When Eu clico em Minhas Informacoes
    And Eu clico em Editar Informacoes
    And Eu preencho o campo idade com "idade"
    And Eu clico no botao de concluir inscricao
    Then Eu vejo uma mensagem de erro indicando que a alteracao nao foi efetuada