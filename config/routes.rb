# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  delete '/logout', to: 'users#destroy', as: :logout

  get 'post_create_new', to: 'posts#new'
  post 'post_create_new', to: 'posts#create'

  get 'comment_create_new', to: 'comments#new'
  post 'comment_create_new', to: 'comments#create'

  post 'like_create_new', to: 'likes#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
