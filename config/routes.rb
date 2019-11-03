Rails.application.routes.draw do
  get 'ciranda_popular/inicio'
  resources :alunos
  resources :professors
  resources :administradores
  root 'ciranda_popular#inicio'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
