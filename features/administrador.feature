Feature: Login de administrador
  As an administrador
  I want to fazer login no sistema
  So that eu possa ter acesso a mais funcionalidades do sistema

Feature: Administracao de alunos
  As an administrador
  I want to fazer a selecao de alunos, editar dados de alunos e visualizar todos os alunos que se inscreveram no sistema
  So that eu nao precise fazer isso manualmente

Feature: Administracao de professores e administradores
  As an administrador
  I want to fazer a selecao de professores e visualizar todos os professores e administradores que se inscreveram no sistema
  So that eu nao precise fazer isso manualmente

Feature: Administracao de turmas
  As an administrador
  I want to criar turmas, visualizar todas as turmas e adicionar professores e alunos a turmas
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

  Scenario: Fazer o login sem preencher nenhum campo
    Given Eu estou na pagina de login
    When Eu clico no botao de fazer login
    Then Eu vejo que o login nao foi efetuado

#CENÁRIOS REFERENTES À ADMINISTRAÇÃO DE ALUNOS
  Scenario: Fazer a selecao dos alunos corretamente
    Given Eu sou administrador e estou logado
    And O aluno com nome "Nome Aluno", Idade "20" e Cor "Pardo" existe
    And Eu estou na pagina de selecao de alunos
    When Eu clico no botao Aprovar o aluno com nome "Nome Aluno", Idade "20" e Cor "Pardo"
    Then Eu nao vejo mais o aluno com nome "Nome Aluno" listado

  Scenario: Visualizar a lista de alunos inscritos corretamente
    Given Eu sou administrador e estou logado
    And Eu estou no menu de administrador
    When Eu clico no botao Lista de Alunos
    Then Eu visualizo a Lista de Alunos

  Scenario: Alterar o contato do responsavel de um aluno corretamente
    Given Eu estou na pagina de inscricao de alunos
    When Eu preencho o campo nome completo com "Nome Completo" e o campo idade com "19"
    And Eu preencho o campo e-mail  com "email@gmail.com" e o campo telefone com "87999000000"
    And Eu preencho o campo rua com "Nome da Rua", o campo bairro com "Nome do Bairro" e o campo cidade com "Nome da Cidade"
    And Eu seleciono "Pardo" no campo cor ou raca e "Feminino" no campo genero
    And Eu preencho o campo nome do responsavel com "Nome Completo Responsavel" e o campo contato do responsavel com "87999900000"
    And Eu preencho o campo escola com "Nome da Escola"
    And Eu seleciono "Particular" no campo tipo de escola
    And Eu seleciono "Estudante de Graduacao" no campo grau de instrucao e "Sim" no campo ja fez ENEM
    And Eu seleciono "Humanas" no campo area e "Sim" no campo atuacao em movimento social
    And Eu clico no botao de concluir inscricao
    And Eu vejo que a inscricao foi efetuada com sucesso
    And Eu estou na pagina de inscricao de administradores
    And Eu preencho o campo nome completo com "Nome Completo" e o campo e-mail com "email@gmail.com"
    And Eu preencho o campo telefone com "87999000000"
    And Eu seleciono "Recife" no campo cidade onde administra o curso
    And Eu preencho os campos senha e confirmacao de senha com "senha1234"
    And Eu clico no botao de concluir
    And Eu estou na pagina de login
    And Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "senha1234"
    And Eu clico no botao de fazer login
    And Eu vejo o menu de administradores
    And Eu clico em Lista de Alunos
    When Eu clico em Editar Informacoes de Aluno do aluno de nome "Nome Completo"
    And Eu preencho o campo contato do responsavel com "81993992342"
    And Eu clico no botao de concluir inscricao
    Then Eu vejo que o contato do responsavel do aluno de nome "Nome Completo" foi alterado para "81993992342"

  Scenario: Alterar a rua de um aluno corretamente
    Given Eu estou na pagina de inscricao de alunos
    When Eu preencho o campo nome completo com "Nome Completo" e o campo idade com "19"
    And Eu preencho o campo e-mail  com "email@gmail.com" e o campo telefone com "87999000000"
    And Eu preencho o campo rua com "Nome da Rua", o campo bairro com "Nome do Bairro" e o campo cidade com "Nome da Cidade"
    And Eu seleciono "Pardo" no campo cor ou raca e "Feminino" no campo genero
    And Eu preencho o campo nome do responsavel com "Nome Completo Responsavel" e o campo contato do responsavel com "87999900000"
    And Eu preencho o campo escola com "Nome da Escola"
    And Eu seleciono "Particular" no campo tipo de escola
    And Eu seleciono "Estudante de Graduacao" no campo grau de instrucao e "Sim" no campo ja fez ENEM
    And Eu seleciono "Humanas" no campo area e "Sim" no campo atuacao em movimento social
    And Eu clico no botao de concluir inscricao
    And Eu vejo que a inscricao foi efetuada com sucesso
    And Eu estou na pagina de inscricao de administradores
    And Eu preencho o campo nome completo com "Nome Completo" e o campo e-mail com "email@gmail.com"
    And Eu preencho o campo telefone com "87999000000"
    And Eu seleciono "Recife" no campo cidade onde administra o curso
    And Eu preencho os campos senha e confirmacao de senha com "senha1234"
    And Eu clico no botao de concluir
    And Eu estou na pagina de login
    And Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "senha1234"
    And Eu clico no botao de fazer login
    And Eu vejo o menu de administradores
    And Eu clico em Lista de Alunos
    When Eu clico em Editar Informacoes de Aluno do aluno de nome "Nome Completo"
    And Eu preencho o campo rua com "Novo Nome da Rua"
    And Eu clico no botao de concluir inscricao
    Then Eu vejo que a rua do aluno de nome "Nome Completo" foi alterada para "Novo Nome da Rua"

  Scenario: Alterar o nome da escola de um aluno corretamente
    Given Eu estou na pagina de inscricao de alunos
    When Eu preencho o campo nome completo com "Nome Completo" e o campo idade com "19"
    And Eu preencho o campo e-mail  com "email@gmail.com" e o campo telefone com "87999000000"
    And Eu preencho o campo rua com "Nome da Rua", o campo bairro com "Nome do Bairro" e o campo cidade com "Nome da Cidade"
    And Eu seleciono "Pardo" no campo cor ou raca e "Feminino" no campo genero
    And Eu preencho o campo nome do responsavel com "Nome Completo Responsavel" e o campo contato do responsavel com "87999900000"
    And Eu preencho o campo escola com "Nome da Escola"
    And Eu seleciono "Particular" no campo tipo de escola
    And Eu seleciono "Estudante de Graduacao" no campo grau de instrucao e "Sim" no campo ja fez ENEM
    And Eu seleciono "Humanas" no campo area e "Sim" no campo atuacao em movimento social
    And Eu clico no botao de concluir inscricao
    And Eu vejo que a inscricao foi efetuada com sucesso
    And Eu estou na pagina de inscricao de administradores
    And Eu preencho o campo nome completo com "Nome Completo" e o campo e-mail com "email@gmail.com"
    And Eu preencho o campo telefone com "87999000000"
    And Eu seleciono "Recife" no campo cidade onde administra o curso
    And Eu preencho os campos senha e confirmacao de senha com "senha1234"
    And Eu clico no botao de concluir
    And Eu estou na pagina de login
    And Eu preencho o campo e-mail com "email@gmail.com" e o campo senha com "senha1234"
    And Eu clico no botao de fazer login
    And Eu vejo o menu de administradores
    And Eu clico em Lista de Alunos
    When Eu clico em Editar Informacoes de Aluno do aluno de nome "Nome Completo"
    And Eu preencho o campo escola com "Novo nome da Escola"
    And Eu clico no botao de concluir inscricao
    Then Eu vejo que a escola do aluno de nome "Nome Completo" foi alterada para "Novo nome da Escola"

#CENÁRIOS REFERENTES À ADMINISTRAÇÃO DE PROFESSORES
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

  Scenario: Visualizar Lista de Administradores
    Given Eu sou administrador e estou logado
    And Eu estou no menu de administrador
    When Eu clico no botao Lista de Administradores
    Then Eu visualizo a Lista de Administradores


#CENÁRIOS REFERENTES À ADMINISTRAÇÃO DE TURMAS
  Scenario: Criar uma turma corretamente
    Given Eu sou administrador e estou logado
    And Eu estou no menu de administrador
    When Eu clico em Criar Nova Turma
    And Eu preencho o campo nome com "Nome Turma"
    And Eu seleciono "Recife" no campo cidade
    And Eu clico no botao Criar Turma
    Then Eu vejo que a turma foi criada com sucesso

  Scenario: Criar uma turma sem nome
    Given Eu sou administrador e estou logado
    And Eu estou no menu de administrador
    When Eu clico em Criar Nova Turma
    And Eu seleciono "Garanhuns" no campo cidade
    And Eu clico no botao Criar Turma
    Then Eu vejo uma mensagem de erro indicando que a turma nao foi criada

  Scenario: Adicionar um professor a uma turma corretamente
    Given Eu sou administrador e estou logado
    And O professor com email "email@gmail.com" existe
    And Eu aprovo a inscricao do professor de e-mail "email@gmail.com"
    And Eu estou no menu de administrador
    And Eu clico em Criar Nova Turma
    And Eu preencho o campo nome com "Nome Turma"
    And Eu seleciono "Recife" no campo cidade
    And Eu clico no botao Criar Turma
    And Eu vejo que a turma foi criada com sucesso
    When Eu clico em adicionar o professor de email "email@gmail.com"
    Then Eu nao vejo mais o professor com email "email@gmail.com" listado

  Scenario: Adicionar um aluno a uma turma corretamente
    Given Eu sou administrador e estou logado
    And O aluno com nome "Nome Aaaa", Idade "16" e Cor "Branco" existe
    And Eu aprovo a inscricao do aluno de nome "Nome Aaaa", Idade "16" e cor "Branco"
    And Eu estou no menu de administrador
    And Eu clico em Criar Nova Turma
    And Eu preencho o campo nome com "Nome Turma"
    And Eu seleciono "Recife" no campo cidade
    And Eu clico no botao Criar Turma
    And Eu vejo que a turma foi criada com sucesso
    When Eu clico em adicionar o aluno de nome "Nome Aaaa", Idade "16" e cor "Branco"
    Then Eu nao vejo mais o aluno com nome "Nome Aaaa" listado

  Scenario: Visualizar Lista de Turmas
    Given Eu sou administrador e estou logado
    And Eu estou no menu de administrador
    When Eu clico no botao Lista de Turmas
    Then Eu visualizo a Lista de Turmas
