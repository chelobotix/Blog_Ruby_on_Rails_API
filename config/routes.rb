# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :new, :create, :destroy] do
          resources :comments, only: [:index, :new, :create, :destroy]
          resources :likes, only: [:create]
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
