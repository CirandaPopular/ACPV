Rails.application.routes.draw do
  get 'sessoes/new'
  get 'ciranda_popular/inicio'
  resources :alunos
  resources :professors
  resources :administradores
  get    'menu_administrador'   => 'ciranda_popular#menu_administrador'
  get    'login'                => 'sessoes#new'
  post   'login'                => 'sessoes#create'
  get    'logout'               => 'sessoes#destroy'
  root 'ciranda_popular#inicio'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end