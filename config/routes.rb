Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :home, to: 'pages#home'
  resources :categories, only: %i[show]
end
