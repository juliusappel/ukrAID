Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :home, to: 'pages#home'

  resources :categories, only: %i[show]

  resources :posts, only: %i[show new create destroy] do
    member do
      post 'toggle_save', to: "posts#toggle_save"
    end
  end

  get :dashboard, to: 'pages#dashboard'
  get :all_categories, to: 'categories#all'

  resources :posts, only: %i[new create] do
    resources :addresses, only: %i[new create]
    resources :post_categories, only: %i[new create]
  end
end
