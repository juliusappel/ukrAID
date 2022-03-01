Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages, only: :welcome
end
