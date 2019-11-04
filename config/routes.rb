Rails.application.routes.draw do
  get 'sessoes/new'
  get 'usuarios/new'
  get 'ciranda_popular/inicio'
  resources :alunos
  resources :professors
  resources :administradores
  resources :usuarios
  get    'login'   => 'sessoes#new'
  post   'login'   => 'sessoes#create'
  get 'logout'  => 'sessoes#destroy'
  root 'ciranda_popular#inicio'
  resources :turmas do
    resources :alunos
    resources :professors
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
