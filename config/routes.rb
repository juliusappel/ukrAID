Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :home, to: 'pages#home'

  resources :categories, only: %i[show]

  resources :posts, only: %i[show new create] do
    member do
      post 'save_post', to: "posts#save_post"
      post 'unsave_post', to: "posts#unsave_post"
      post 'upvote_post', to: "posts#upvote_post"
      post 'downvote_post', to: "posts#downvote_post"
      post 'publish', to: "posts#publish_post"
      post 'unpublish', to: "posts#unpublish_post"
      post 'delete', to: "posts#delete_post"
    end
  end

  get :dashboard, to: 'pages#dashboard'
  get :all_categories, to: 'categories#all'
  get :about, to: 'pages#about'

  resources :posts, only: %i[new create] do
    resources :addresses, only: %i[new create]
    resources :post_categories, only: %i[new create]
  end
end
