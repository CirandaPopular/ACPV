Rails.application.routes.draw do
  get 'sessoes/new'
  get 'ciranda_popular/inicio'
  resources :alunos
  resources :professors
  resources :administradores
  resources :turmas
  resources :arquivos
  get    'menu_administrador'        => 'ciranda_popular#menu_administrador'
  get    'menu_professor'            => 'ciranda_popular#menu_professor'
  get    'login'                     => 'sessoes#new'
  post   'login'                     => 'sessoes#create'
  get    'logout'                    => 'sessoes#destroy'
  get    'selecao_professor'         => 'professors#selecao_professor'
  get   'aprovar_inscricao/:id', :to => 'professors#alterar_inscricao', :as => :aprovar_inscricao
  put    'update/:id',           :to => 'professors#update',            :as => :atualizar_professor
  get    'sucesso'                   => 'ciranda_popular#inscricao_finalizada'
  get    'sem_permissao'             => 'ciranda_popular#sem_permissao'
  get    'selecao_aluno'             => 'alunos#selecao_aluno'
  get    'add_apostila'              => 'arquivos#index'
  get    'visualizar_apostilas'      => 'arquivos#show'
  get    'minhas_turmas'             => 'professors#minhas_turmas'
  post   'arquivos/upload_arquivo'
  post   'arquivos/download_arquivo'
  post   'arquivos/remover_arquivo'
  get    'aprovar_inscricao_aluno/:id',             :to => 'alunos#alterar_inscricao',   :as => :alterar_inscricao_aluno
  get    'adicionar_professor_turma/:id/:id_turma', :to => 'turmas#adicionar_professor', :as => :adicionar_professor_turma
  get    'adicionar_aluno_turma/:id/:id_turma',     :to => 'turmas#adicionar_aluno',     :as => :adicionar_aluno_turma
  root   'ciranda_popular#inicio'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end